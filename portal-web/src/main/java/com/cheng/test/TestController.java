package com.cheng.test;

import com.cheng.test.service.ITestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/13 13:57
 */
@Controller
public class TestController {

    @Autowired
    ITestService testService;

    @RequestMapping("/select")
    @ResponseBody
    public Object selectTime(){
        long sa=testService.selectTime();
       return String.valueOf(sa);
    }

}
