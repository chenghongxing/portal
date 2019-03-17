package com.cheng.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/21 12:45
 */
@Controller
public class ViewController {

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
    public String toRelPwdPage(){
        return "relpwd";
    }

    @RequestMapping("/relPhonePage")
    public String toRelPhonePage(){
        return "relphone";
    }

    @RequestMapping("/relEmailPage")
    public String toRelEmailPage(){
        return "relemail";
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
