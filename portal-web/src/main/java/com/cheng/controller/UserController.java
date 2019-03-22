package com.cheng.controller;

import com.alibaba.fastjson.JSONObject;
import com.cheng.login.domain.User;
import com.cheng.login.service.IUserService;
import com.cheng.redis.JedisClient;
import com.cheng.shiro.ShiroPwdUtil;
import com.cheng.utils.DateUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/1/9 17:40
 */
@Controller
public class UserController {
    private static final Logger logger= LoggerFactory.getLogger(UserController.class);

    @Autowired
    private IUserService userService;
    @Autowired
    private JedisClient jedisClient;

    @RequestMapping("/addUser")
    public ModelAndView addUser(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJson = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJson);
        String userNo = request.getParameter("userNo");
        String userName = request.getParameter("userName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String sex = request.getParameter("sex");
        String deptNo = request.getParameter("deptNo");
        User user = new User();
        user.setUserNo(userNo);
        user.setUsername(userName);
        user.setEmail("".equals(email)?null:email);
        user.setPhone("".equals(phone)?null:phone);
        user.setSex(sex);
        user.setPartNo(deptNo);
        user.setPassword(ShiroPwdUtil.getPassByMd5(userNo,userNo));
        user.setCreateTime(DateUtils.getCurrentFormatDateShort10());
        user.setUpdateTime(DateUtils.getCurrentFormatDateShort10());
        user.setLastUpdateUser(jsonObject.get("lastUpdateUser").toString());
        int lg = userService.insertUser(user);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sucess");
        if (lg>0){
            modelAndView.addObject("message","新增员工成功！");
        }else {
            modelAndView.addObject("message","新增员工失败！");
        }
        return modelAndView;
    }

    @RequestMapping("/checkBossName")
    @ResponseBody
    public Map checkBossName(HttpServletRequest request){
        Map<String,Object> para = new HashMap<>();
        String bossName = request.getParameter("bossName");
        User user = userService.selectUserByName(bossName);
        if (user==null){
            para.put("flag","false");
        }else {
            para.put("flag","true");
        }
        return para;
    }

    @RequestMapping("/getNewUserNo")
    @ResponseBody
    public Object getNewUserNo(){
        BigDecimal newUserNo = userService.getMaxUserNoAdd();
        Map<String,Object> para = new HashMap<>();
        para.put("newUserNo",newUserNo);
        return para;
    }

    @RequestMapping("/selectUserById")
    @ResponseBody
    public Object selectUserById(HttpServletRequest request){
        String userId = request.getParameter("userId");
        User user = userService.selectUserById(Integer.valueOf(userId));
        return user;
    }
}
