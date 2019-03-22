package com.cheng.login.mapper;

import com.cheng.login.domain.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

public interface UserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User selectByPhoneNo(String phoneNo);

    User selectByUserNo(String userNo);

    int updatePassword(Map para);

    BigDecimal getMaxUserNo();

    User selectUserByUsername(String username);

    List<User> selectUserInfoList(Map para);
}