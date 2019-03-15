package com.cheng.controller;

import com.alibaba.fastjson.JSONObject;
import com.cheng.exception.CustomException;
import com.cheng.login.domain.User;
import com.cheng.login.service.IUserService;
import com.cheng.redis.JedisClient;
import com.cheng.utils.VerifyCode;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/15 9:47
 */
@Controller
public class UserInfoController {
    private static final Logger logger = LoggerFactory.getLogger(UserInfoController.class);
    @Autowired
    private JedisClient jedisClient;
    @Autowired
    private IUserService userService;
    @Autowired
    private JavaMailSender javaMailSender;
    @Value("${mail.smtp.username}")
    private String from;

    @RequestMapping("/repwd")
    @ResponseBody
    public Object repassword(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        String oldPwd = request.getParameter("oldPwd");
        String newPwd = request.getParameter("newPwd");
        logger.info("登录用户信息-》"+ userJosn);
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        Integer id =(Integer) jsonObject.get("id");
        String userNo = jsonObject.getString("userNo");
        ByteSource byteSource = ByteSource.Util.bytes(userNo);
        SimpleHash oldPass = new SimpleHash("MD5",oldPwd,byteSource,1024);
        SimpleHash newPass = new SimpleHash("MD5",newPwd,byteSource,1024);
        Map<String,Object> params = new HashMap<>();
        params.put("id",id);
        params.put("oldPwd",oldPass.toString());
        params.put("newPwd",newPass.toString());
        int fl = userService.updatePwd(params);
//        ModelAndView modelAndView = new ModelAndView();
//        if (fl>0){
//            modelAndView.addObject("message","密码修改成功！");
//        }else {
//            modelAndView.addObject("message","密码修改失败！");
//        }
//        modelAndView.setViewName("relpwd");
        if(fl>0){
            return "密码修改成功";
        }
        return "密码修改失败";
    }

    @RequestMapping("/relPhone")
    @ResponseBody
    public Object updatePhone(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        String phoneCode = request.getParameter("phoneCode");
        String newPhone = request.getParameter("newPhone");
        String msgCode = jedisClient.hget(sessionId,"msgCode");
        if (!msgCode.equals(phoneCode)){
            return "短信验证码错误";
        }
        Integer id = (Integer) jsonObject.get("id");
        User user = new User();
        user.setId(id);
        user.setPhone(newPhone);
        int lg = userService.updatePhone(user);
        if (lg>0){
            return "手机号修改成功";
        }else {
            return "手机号修改失败";
        }
    }

    @RequestMapping("/sendMail")
    @ResponseBody
    public Object sendMail(HttpServletRequest request){
        String toEmail = request.getParameter("toEmail");
        MimeMessage mimeMessage = javaMailSender.createMimeMessage();
        MimeMessageHelper mMessageHelper;
        String numCode = String.valueOf(new Random().nextInt(899999) + 100000);//生成六位数字验证码
        try {
            mMessageHelper = new MimeMessageHelper(mimeMessage,true);
            mMessageHelper.setFrom(from);
            mMessageHelper.setTo(toEmail);
            mMessageHelper.setSubject("邮箱验证码");
            mMessageHelper.setText("邮箱验证码为："+numCode+"（仅用于密码修改或邮箱修改，五分钟有效，请谨慎操作！！！）");
            javaMailSender.send(mimeMessage);
            String sessionId = request.getSession().getId();
            jedisClient.hset(sessionId,"emailCode",numCode);
            jedisClient.expire(sessionId,300);
            return "发送成功";
        } catch (Exception e) {
            e.printStackTrace();
            return "发送失败";
        }
    }

    @RequestMapping("/relEmail")
    @ResponseBody
    public Object updateEmail(HttpServletRequest request){
        String emailCode = request.getParameter("emailCode");
        String newEmail = request.getParameter("newEmail");
        String sessionId = request.getSession().getId();
        String mailCode = jedisClient.hget(sessionId,"emailCode");
        if (!emailCode.equalsIgnoreCase(mailCode)){
            return "验证码错误！";
        }
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        Integer id = (Integer) jsonObject.get("id");
        User user = new User();
        user.setId(id);
        user.setEmail(newEmail);
        int lg = userService.updateEmail(user);
        if (lg>0){
            return "邮箱修改成功！";
        }else {
            return "邮箱修改失败！";
        }
    }
}
