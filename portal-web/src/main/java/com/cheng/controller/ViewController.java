package com.cheng.controller;

import com.alibaba.fastjson.JSONObject;
import com.cheng.redis.JedisClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/21 12:45
 */
@Controller
public class ViewController {
    private static final Logger logger = LoggerFactory.getLogger(ViewController.class);
    @Autowired
    private JedisClient jedisClient;

    @RequestMapping("/login")
    public String toLoginPage(){
        return "login";
    }

    @RequestMapping("/welcome")
    public String toWelcome(){
        return "welcome";
    }

    @RequestMapping("/")
    public String toHome(){
        return "login";
    }

    @RequestMapping("/404")
    public String to404(){
        return "/html/404.html";
    }

    @RequestMapping("/home")
    public String toHomePage(){
        return "home";
    }

    @RequestMapping("/addNoticePage")
    public String toAddNotice(){
        return "addnotic";
    }

    @RequestMapping("/relPwdPage")
    public ModelAndView toRelPwdPage(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        String oldEmail = jsonObject.get("email").toString();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("relpwd");
        modelAndView.addObject("oldEmail",oldEmail);
        return modelAndView;
    }

    @RequestMapping("/relPhonePage")
    public ModelAndView toRelPhonePage(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        String phone = jsonObject.get("phone").toString();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("phone",phone);
        modelAndView.setViewName("relphone");
        return modelAndView;
    }

    @RequestMapping("/relEmailPage")
    public ModelAndView toRelEmailPage(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        String oldEmail = jsonObject.get("email").toString();
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("relemail");
        modelAndView.addObject("oldEmail",oldEmail);
        return modelAndView;
    }

    @RequestMapping("/noticePage")
    public String toNoticepage(){
        return "notice";
    }

    @RequestMapping("/signDoPage")
    public String toSignDoPage(){
        return "signdo";
    }

    @RequestMapping("/signInfoPage")
    public String toSignInfoPage(){
        return "signinfo";
    }

    @RequestMapping("/userPage")
    public String toUserPage(){
        return "user";
    }

    @RequestMapping("/userInfoPage")
    public String toUserInfoPage(){
        return "userinfo";
    }
}
