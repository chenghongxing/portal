package com.cheng.test.service;

import com.cheng.test.mapper.TestMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/13 13:46
 */
@Service
public class TestServiceImpl implements ITestService {
    @Autowired
    TestMapper testMapper;
    public long selectTime() {
        return testMapper.selectTime();
    }
}
