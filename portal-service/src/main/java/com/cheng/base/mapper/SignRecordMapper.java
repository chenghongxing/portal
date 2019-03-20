package com.cheng.base.mapper;

import com.cheng.base.domain.SignRecord;

import java.util.List;
import java.util.Map;

public interface SignRecordMapper {
    int deleteByPrimaryKey(Integer sreId);

    int insert(SignRecord record);

    int insertSelective(SignRecord record);

    SignRecord selectByPrimaryKey(Integer sreId);

    int updateByPrimaryKeySelective(SignRecord record);

    int updateByPrimaryKey(SignRecord record);

    List<Map<String,Object>> selectSignInfo(Map para);
}