package com.cheng.controller;


import com.alibaba.fastjson.JSON;
import com.cheng.login.domain.User;
import com.cheng.login.service.IUserService;
import com.cheng.redis.JedisClient;
import com.cheng.sendmsg.Config;
import com.cheng.sendmsg.HttpUtil;
import com.cheng.utils.VerifyCode;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Random;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/20 16:13
 */
@Controller
public class LoginController {

    private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
    private static String operation = "/industrySMS/sendSMS";
    private static String accountSid = Config.ACCOUNT_SID;
    private static String smsContentPre = "【行建科技】登录验证码：";
    private static String smsContentSuf = "，如非本人操作，请忽略此短信。 ";

    @Autowired
    private IUserService userService;
    @Autowired
    private JedisClient jedisClient;


    @RequestMapping("/doLogin")
    public ModelAndView doLogin(HttpServletRequest request){
        String username=request.getParameter("emp_no");
        String password=request.getParameter("password");
        String status=request.getParameter("status");
        String verifyCode = request.getParameter("verifyCode");
        ModelAndView modelAndView = new ModelAndView();
        String code = (String) request.getSession().getAttribute("code");
        if (!code.equals(verifyCode)){
            modelAndView.addObject("codeMsg","验证码错误");
            modelAndView.setViewName("login");
            return modelAndView;
        }
        boolean flag=false;
        if ("1".equals(status)){
            flag=true;
        }
        String message="";
        Subject currentUser= SecurityUtils.getSubject();
        if (!currentUser.isAuthenticated()){
            UsernamePasswordToken token = new UsernamePasswordToken(username,password);
            try {
                currentUser.login(token);
                modelAndView.setViewName("welcome");
                return modelAndView;
            } catch (UnknownAccountException e) {
                message=e.getMessage();
            } catch (IncorrectCredentialsException ice){
                message="账号或密码错误！";
            } catch (AuthenticationException ae){
                message="未知错误！";
            }
            modelAndView.addObject("message",message);
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            modelAndView.setViewName("welcome");
            return modelAndView;
        }
    }

    @RequestMapping("/verifyCode")
    public void doVerifyCode(HttpServletResponse response,HttpServletRequest request){
        VerifyCode verifyCode = new VerifyCode();
        BufferedImage image = verifyCode.getImage();
        String code = verifyCode.getText();
        try {
            ServletOutputStream out = response.getOutputStream();
            request.getSession().setAttribute("code",code);
            VerifyCode.outPut(image,out);
            logger.info("生成验证码成功-----verifyCode="+code);
        } catch (Exception e) {
            logger.error("生成验证码异常---"+e.getMessage());
        }
    }

    @RequestMapping("/sendMsg/{phoneNo}")
    public ModelAndView doSendMsg(@PathVariable("phoneNo") String to, HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        if (jedisClient.exists(to)){
            if ("4".equals(jedisClient.get(to))){
                modelAndView.addObject("sendMsg","请勿重复发送，5分钟后才能发送");
                modelAndView.setViewName("login");
                jedisClient.expire(to,300);
                return modelAndView;
            }
            if (Integer.parseInt(jedisClient.get(to))-4>0){
                modelAndView.addObject("sendMsg","请勿重复发送，5分钟后才能发送");
                modelAndView.setViewName("login");
                return modelAndView;
            }
        }
        String verifyCode = String.valueOf(new Random().nextInt(899999) + 100000);//生成短信验证码
        String content = smsContentPre + verifyCode + smsContentSuf;
        String tmpSmsContent = null;
        try {
            tmpSmsContent = URLEncoder.encode(content, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            logger.error("短信内容转码异常-----"+e.getMessage());
        }
        String url = Config.BASE_URL + operation;
        String body = "accountSid=" + accountSid + "&to=" + to + "&smsContent=" + tmpSmsContent + HttpUtil.createCommonParam();
        // 提交请求
        String result = null;
        try {
            result = HttpUtil.post(url, body);
            logger.info("发送短信返回结果----result:" + System.lineSeparator() + result);
            Map<String,Object> resultJson = (Map<String, Object>) JSON.parse(result);
            String respCode = (String) resultJson.get("respCode");
            if (!"00000".equals(respCode)){
                logger.error("调用秒滴科技发送短信失败----");
                modelAndView.addObject("sendMsg","验证码发送失败！");
                modelAndView.setViewName("login");
                return modelAndView;
            }
            String sessionId = request.getSession().getId();
            jedisClient.hset(sessionId,"msgCode",verifyCode);
            jedisClient.expire(sessionId,300);
            jedisClient.incr(to);
            jedisClient.expire(to,300);
            return null;
        } catch (Exception e) {
            logger.error("调用秒滴科技发送短信验证码异常----"+e.getMessage());
            modelAndView.addObject("sendMsg","验证码发送失败！");
            modelAndView.setViewName("login");
            return modelAndView;
        }
    }

    @RequestMapping("/msgLogin")
    public ModelAndView msgLogin(HttpServletRequest request){
        String phoneNo = request.getParameter("phoneNo");
        String msgCode = request.getParameter("msgCode");
        String sessionId = request.getSession().getId();
        ModelAndView modelAndView = new ModelAndView();
        if (!jedisClient.exists(sessionId)){
            modelAndView.addObject("sendMsg","验证码已过期，重新发送！");
            modelAndView.setViewName("login");
            return modelAndView;
        }
        String code=jedisClient.hget(sessionId,"msgCode");
        if (!code.equals(msgCode)){
            modelAndView.addObject("sendMsg","验证码错误！");
            modelAndView.setViewName("login");
            return modelAndView;
        }
        User user = userService.selectUserByPhoneNo(phoneNo);
        if (user==null){
            modelAndView.addObject("sendMsg","用户不存在！");
            modelAndView.setViewName("login");
            return modelAndView;
        }else {
            modelAndView.setViewName("welcome");
            return modelAndView;
        }
    }
}
