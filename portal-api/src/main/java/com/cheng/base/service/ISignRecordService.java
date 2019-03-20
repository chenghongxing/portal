package com.cheng.base.service;

import java.util.List;
import java.util.Map;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 13:37
 */
public interface ISignRecordService {
    List<Map<String,Object>> selectSignInfo(Map para);
}
