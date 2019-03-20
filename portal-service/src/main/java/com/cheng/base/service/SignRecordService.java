package com.cheng.base.service;

import com.cheng.base.mapper.SignRecordMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 13:39
 */
@Service
public class SignRecordService implements ISignRecordService {
    private static final Logger logger = LoggerFactory.getLogger(SignRecordService.class);
    @Autowired
    private SignRecordMapper signRecordMapper;
    @Override
    public List<Map<String, Object>> selectSignInfo(Map para) {
        return signRecordMapper.selectSignInfo(para);
    }
}
