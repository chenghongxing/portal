package com.cheng.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.cheng.base.domain.Dept;
import com.cheng.base.domain.SignRecord;
import com.cheng.base.service.IDeptService;
import com.cheng.base.service.ISignRecordService;
import com.cheng.login.domain.User;
import com.cheng.login.service.IUserService;
import com.cheng.redis.JedisClient;
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
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    @Autowired
    private ISignRecordService signRecordService;
    @Autowired
    private IDeptService deptService;
    @Autowired
    private IUserService userService;

    @RequestMapping("/login")
    public String toLoginPage(){
        return "login";
    }

    @RequestMapping("/welcome")
    public ModelAndView toWelcome(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        String sessionId = request.getSession().getId();
        String userJosn = jedisClient.hget(sessionId,"user");
        User user = JSON.parseObject(userJosn,new TypeReference<User>(){});
        String date = DateUtils.getCurrentFormatDateLong19();
        String time = date.substring(11,16);
        String ta = time.substring(0,2);
        time = time + (Integer.parseInt(ta)>12?"PM":"AM");
        user.setLastLoginTime(time);
        modelAndView.setViewName("welcome");
        modelAndView.addObject("user",user);
        return modelAndView;
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
    public ModelAndView toSignDoPage(HttpServletRequest request){
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("signdo");
        String sessionId = request.getSession().getId();
        String userJson = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJson);
        String userNo = jsonObject.get("userNo").toString();
        String nowDate = DateUtils.getCurrentFormatDateShort10();
        Map<String,Object> para = new HashMap<>();
        para.put("userNo",userNo);
        para.put("nowDate",nowDate);
        SignRecord signRecord = signRecordService.selectSignRecordByDate(para);
        modelAndView.addObject("signRecord",signRecord);
        Calendar calendar = Calendar.getInstance();
        int month = calendar.get(Calendar.MONTH)+1;
        para.clear();
        para.put("userNo",userNo);
        para.put("month",month);
        para.put("nowDate",DateUtils.getCurrentFormatDateShort10());
        int countOne = signRecordService.selectSignCountOne(para);
        int countTwo = signRecordService.selectSignCountTwo(para);
        int dayCount = DateUtils.getCurrentMonthDayCount();
        BigDecimal attendance = new BigDecimal(((countOne*100)/dayCount)).setScale(BigDecimal.ROUND_HALF_UP);
        modelAndView.addObject("attendance",attendance.intValue());
        modelAndView.addObject("abnormal",countTwo);
        return modelAndView;
    }

    @RequestMapping("/signInfoPage")
    public ModelAndView toSignInfoPage(HttpServletRequest request){
        String deptNo = request.getParameter("deptNo");
        String sgDate = request.getParameter("sgDate");
        String userNo = request.getParameter("userNo");
        String userName = request.getParameter("userName");
        ModelAndView modelAndView = new ModelAndView();
        Map para = new HashMap();
        para.put("deptNo","".equals(deptNo)?null:deptNo);
        para.put("nowDate","".equals(sgDate)?null:sgDate);
        para.put("userNo","".equals(userNo)?null:userNo);
        para.put("userName","".equals(userName)?null:userName);
        List<Map<String, Object>> maps = signRecordService.selectSignInfo(para);
        List<Dept> deptList = deptService.getAllDeptList(para);
        modelAndView.setViewName("signinfo");
        modelAndView.addObject("signInfo",maps);
        modelAndView.addObject("deptList",deptList);
        return modelAndView;
    }

    @RequestMapping("/userPage")
    public ModelAndView toUserPage(HttpServletRequest request){
        String deptNo = request.getParameter("deptNo");
        String userNo = request.getParameter("userNo");
        String userName = request.getParameter("userName");
        ModelAndView modelAndView = new ModelAndView();
        Map para = new HashMap();
        List<Dept> deptList = deptService.getAllDeptList(para);
        para.put("deptNo","".equals(deptNo)?null:deptNo);
        para.put("userNo","".equals(userNo)?null:userNo);
        para.put("userName","".equals(userName)?null:userName);
        List<User> userList = userService.selectUserInfoList(para);
        modelAndView.setViewName("user");
        modelAndView.addObject("deptList",deptList);
        modelAndView.addObject("userList",userList);
        return modelAndView;
    }

    @RequestMapping("/userInfoPage")
    public String toUserInfoPage(){
        return "userinfo";
    }

    @RequestMapping("/deptPage")
    public ModelAndView toDeptPage(HttpServletRequest request){
        String deptNo = request.getParameter("deptNo");
        String deptName = request.getParameter("deptName");
        ModelAndView modelAndView = new ModelAndView();
        Map<String,Object> para = new HashMap<>();
        para.put("deptNo","".equals(deptNo)?null:deptNo);
        para.put("deptName","".equals(deptName)?null:deptName);
        List<Dept> deptList = deptService.getAllDeptList(para);
        modelAndView.addObject("deptList",deptList);
        modelAndView.setViewName("dept");
        return modelAndView;
    }

    @RequestMapping("/testMapString")
    @ResponseBody
    public Object testMapString(HttpServletRequest request){
        String status = request.getParameter("status");
        String userNo = request.getParameter("userNo");
        String userName = request.getParameter("userName");
        Map<String,Object> para = new HashMap<>();
        para.put("status",status);
        para.put("userNo",userNo);
        para.put("userName",userName);
        List<User> userList = userService.testMapString(para);
       return userList;
    }
}
