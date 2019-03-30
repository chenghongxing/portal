package com.cheng.base.service;

import com.cheng.base.domain.SignRecord;
import com.cheng.exception.CustomException;

import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 13:37
 */
public interface ISignRecordService {
    List<Map<String,Object>> selectSignInfo(Map para) throws CustomException;
    int delSignRecordByIds(Integer[] reIds) throws  CustomException;

    List<Map<String,Object>> getSignRecordsByIds(Integer[] reIds) throws CustomException;

    SignRecord selectSignRecordByDate(Map para) throws CustomException;

    int updateSignRecord(SignRecord signRecord) throws CustomException;

    int insertSignRecord(SignRecord signRecord) throws CustomException;

    Integer selectSignCountOne(Map para) throws  CustomException;

    Integer selectSignCountTwo(Map para) throws  CustomException;
}
