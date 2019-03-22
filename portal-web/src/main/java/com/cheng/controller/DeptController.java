package com.cheng.controller;

import com.alibaba.fastjson.JSONObject;
import com.cheng.base.domain.Dept;
import com.cheng.base.service.IDeptService;
import com.cheng.exception.CustomException;
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
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/21 9:50
 */
@Controller
public class DeptController {
    private static final Logger logger = LoggerFactory.getLogger(DeptController.class);

    @Autowired
    IDeptService deptService;
    @Autowired
    IUserService userService;
    @Autowired
    JedisClient jedisClient;

    @RequestMapping("/addDeptBtn")
    @ResponseBody
    public Map addDeptBtn(){
        Map para = deptService.selectMaxDeptNo();
        double maxDeptNo = (Double) para.get("maxDeptNo");
        para.put("maxDeptNo",String.valueOf((int)maxDeptNo));
        return para;
    }

    @RequestMapping("/addDept")
    public ModelAndView addDept(HttpServletRequest request){
        String sessionId = request.getSession().getId();
        String deptNo = request.getParameter("deptNo");
        String deptName = request.getParameter("deptName");
        String bossName = request.getParameter("bossName");
        User user = userService.selectUserByName(bossName);
        Dept dept = new Dept();
        dept.setDeptNo(deptNo);
        dept.setDeptName(deptName);
        dept.setCreateTime(DateUtils.getCurrentFormatDateShort10());
        dept.setUpdateTime(DateUtils.getCurrentFormatDateLong19());
        String userJosn = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJosn);
        String userName = jsonObject.get("username").toString();
        dept.setCreateUser(userName);
        dept.setDeptBoss(user.getUserNo());
        int lg = deptService.insertDept(dept);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sucess");
        if (lg>0){
            modelAndView.addObject("message","部门添加成功！");
        }else {
            modelAndView.addObject("message","部门添加失败！");
        }
        return modelAndView;
    }

    @RequestMapping("/getDeptById")
    @ResponseBody
    public Object getDeptById(HttpServletRequest request){
        String deptId = request.getParameter("deptId");
        Dept dept = deptService.getDeptById(Integer.valueOf(deptId));
        User user = userService.selectUserByNo(dept.getDeptBoss());
        dept.setBossName(user.getUsername());
        return dept;
    }

    @RequestMapping("/updateDept")
    public ModelAndView updateDept(HttpServletRequest request){
        String deptNo = request.getParameter("deptNo2");
        String deptName = request.getParameter("deptName2");
        String bossName = request.getParameter("bossName2");
        String deptId = request.getParameter("deptId2");
        User user = userService.selectUserByName(bossName);
        Dept dept = new Dept();
        dept.setDeptId(Integer.valueOf(deptId));
        dept.setDeptName(deptName);
        dept.setDeptBoss(user.getUserNo());
        dept.setUpdateTime(DateUtils.getCurrentFormatDateLong19());
        int fg = deptService.updateDept(dept);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sucess");
        if (fg>0){
            modelAndView.addObject("message","修改部门成功！");
        }else {
            modelAndView.addObject("message","修改部门失败！");
        }
        return modelAndView;
    }

    @RequestMapping("/deleteDept")
    public ModelAndView deleteDept(HttpServletRequest request){
        String[] deptIdS = request.getParameterValues("ckbox");
        Integer[] ids = new Integer[deptIdS.length];
        for (int i = 0; i < deptIdS.length; i++) {
            ids[i]=Integer.valueOf(deptIdS[i]);
        }
        int lg = deptService.deleteDeptByIds(ids);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sucess");
        if (lg>0){
            modelAndView.addObject("message","部门数据删除成功！");
        }else {
            modelAndView.addObject("message","部门数据删除失败！");
        }
        return modelAndView;
    }

}
