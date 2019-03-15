package com.cheng.login.service;

import com.cheng.exception.CustomException;
import com.cheng.login.domain.User;

import java.util.Map;


/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 13:56
 */
public interface IUserService {
    User selectUserByName(String userName) throws CustomException;

    User selectUserByPhoneNo(String phoneNo) throws CustomException;

    boolean addUser(User user) throws CustomException;

    int updatePwd(Map para) throws CustomException;

    int updatePhone(User user) throws CustomException;

    int updateEmail(User user) throws CustomException;
}
