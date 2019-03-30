package com.cheng.controller;

import com.alibaba.fastjson.JSONObject;
import com.cheng.base.domain.SignRecord;
import com.cheng.base.service.ISignRecordService;
import com.cheng.redis.JedisClient;
import com.cheng.util.NetworkUtil;
import com.cheng.utils.DateUtils;
import com.cheng.utils.ExcelUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/27 11:17
 */
@Controller
public class SignRecordController {
    private static final Logger logger = LoggerFactory.getLogger(SignRecordController.class);

    @Autowired
    ISignRecordService signRecordService;
    @Autowired
    JedisClient jedisClient;
    @Value("ip.net")
    private String ipNet;

    @RequestMapping("/doDelSignRecord")
    public ModelAndView doDelSignRecord(HttpServletRequest request){
        String[] signIds = request.getParameterValues("ckbox");
        Integer[] sreIds = new Integer[signIds.length];
        for (int i = 0; i < signIds.length; i++) {
            sreIds[i] = Integer.valueOf(signIds[i]);
        }
        int lg = signRecordService.delSignRecordByIds(sreIds);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("sucess");
        if (lg>0){
            modelAndView.addObject("message","考勤记录删除成功！");
        }else {
            modelAndView.addObject("message","考勤记录删除失败！");
        }
        return modelAndView;
    }

    @RequestMapping("/doSignIn")
    @ResponseBody
    public Object doSignIn(HttpServletRequest request){
        Map<String,Object> returnMap = new HashMap<>();
        String sessionId = request.getSession().getId();
        String requestIP = null;
//        try {
//            requestIP = NetworkUtil.getIpAddress(request);
//            String[] strs = requestIP.split(".");
//            if (!ipNet.equals(strs[2])){
//                returnMap.put("flag","false");
//                returnMap.put("respMsg","无效操作，你未在指定地点签到！");
//                return returnMap;
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//            logger.error("获取设备ip出错----"+e.getMessage());
//        }
        String userJson = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJson);
        String userNO = jsonObject.get("userNo").toString();
        SignRecord signRecord = new SignRecord();
        signRecord.setPcIp(requestIP);
        signRecord.setSignTime(DateUtils.getCurrentFormatDateShortNowTime());
        signRecord.setNowDate(DateUtils.getCurrentFormatDateShort10());
        signRecord.setSreUser(userNO);
        int lg = signRecordService.insertSignRecord(signRecord);
        if (lg>0){
            returnMap.put("flag","true");
            returnMap.put("signInTime",DateUtils.getCurrentFormatDateShortNowTime());
        }else{
            returnMap.put("flag","false");
            returnMap.put("respMsg","签到失败！");
        }
        return returnMap;
    }

    @RequestMapping("/doSignOut")
    @ResponseBody
    public Object doSignOut(HttpServletRequest request){
        Map<String,Object> returnMap = new HashMap<>();
        String sessionId = request.getSession().getId();
        String requestIP = null;
//        try {
//            requestIP = NetworkUtil.getIpAddress(request);
//            String[] strs = requestIP.split(".");
//            if (!ipNet.equals(strs[2])){
//                returnMap.put("flag","false");
//                returnMap.put("respMsg","无效操作，你未在指定地点签退！");
//                return returnMap;
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//            logger.error("获取设备ip出错----"+e.getMessage());
//        }
        String userJson = jedisClient.hget(sessionId,"user");
        JSONObject jsonObject = JSONObject.parseObject(userJson);
        String userNo = jsonObject.get("userNo").toString();
        Map<String,Object> para = new HashMap<>();
        para.put("userNo",userNo);
        para.put("nowDate", DateUtils.getCurrentFormatDateShort10());
        SignRecord signRecord = signRecordService.selectSignRecordByDate(para);
        if (null == signRecord || null == signRecord.getSignTime()){
            returnMap.put("flag","false");
            returnMap.put("respMsg","你今天还未签到，不能签退！请先签到！");
        }else {
            signRecord.setSgoutTime(DateUtils.getCurrentFormatDateShortNowTime());
            signRecord.setPcIp(requestIP);
            int lg = signRecordService.updateSignRecord(signRecord);
            if (lg>0){
                returnMap.put("flag","true");
                returnMap.put("signOutTime",DateUtils.getCurrentFormatDateShortNowTime());
            }else {
                returnMap.put("flag","false");
                returnMap.put("respMsg","签退失败！");
            }
        }
        return returnMap;
    }

    @RequestMapping("/doExportSignRecord")
    public void doExportSignRecord(HttpServletRequest request, HttpServletResponse response){
        String[] signIds = request.getParameterValues("ckbox");
        Integer[] sreIds = new Integer[signIds.length];
        for (int i = 0; i < signIds.length; i++) {
            sreIds[i] = Integer.valueOf(signIds[i]);
        }
        List<Map<String,Object>> signRecordList = signRecordService.getSignRecordsByIds(sreIds);
        //excel标题
        String[] title = {"工号","姓名","签到时间","签退时间","日期","部门"};
        //excel文件名
        String fileName = null;
        try {
            fileName = URLEncoder.encode("员工考勤记录"+System.currentTimeMillis()+".xls","UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String content[][] = new String[signRecordList.size()][];
        //sheet名
        String sheetName = "员工考勤记录";
        for (int i = 0; i < signRecordList.size(); i++) {
            content[i] = new String[title.length];
            Map<String,Object> para = signRecordList.get(i);
            content[i][0] = para.get("user_no").toString();
            content[i][1] = para.get("username").toString();
            content[i][2] = para.get("sign_time").toString();
            content[i][3] = para.get("sgout_time").toString();
            content[i][4] = para.get("now_date").toString();
            content[i][5] = para.get("dept_name").toString();
        }
        //创建HSSFWorkbook
        HSSFWorkbook wb = ExcelUtil.getHSSFWorkbook(sheetName, title, content, null);
        //响应到客户端
        try {
            this.setResponseHeader(response, fileName);
            OutputStream os = response.getOutputStream();
            wb.write(os);
            os.flush();
            os.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //发送响应流方法
    public void setResponseHeader(HttpServletResponse response, String fileName) {
        try {
            response.setContentType("application/octet-stream;charset=utf-8");
            response.setHeader("Content-Disposition", "attachment;filename="+fileName);
            response.addHeader("Pargam", "no-cache");
            response.addHeader("Cache-Control", "no-cache");
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
