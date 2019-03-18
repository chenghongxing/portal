package com.cheng.login.mapper;

import com.cheng.login.domain.User;

import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByPhoneNo(String phoneNo);

    User selectByUsername(String username);

    int updatePassword(Map para);

    Integer getMaxUserNo();
}