package com.cheng.login.mapper;


import com.cheng.login.domain.User;
import com.cheng.login.domain.UserKey;

public interface UserMapper {
    int deleteByPrimaryKey(UserKey key);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(UserKey key);

    User selectByUsername(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

     User selectByPhoneNo(String phoneNo);
}