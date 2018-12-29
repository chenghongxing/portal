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
        return "index";
    }

    @RequestMapping("/404")
    public String to404(){
        return "/html/404.html";
    }
}
