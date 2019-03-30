package com.cheng.login.service;

import com.cheng.exception.CustomException;
import com.cheng.login.domain.User;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 13:56
 */
public interface IUserService {
    User selectUserByNo(String userNo) throws CustomException;

    User selectUserByPhoneNo(String phoneNo) throws CustomException;

    boolean addUser(User user) throws CustomException;

    int updatePwd(Map para) throws CustomException;

    int updatePhone(User user) throws CustomException;

    int updateEmail(User user) throws CustomException;

    int updateUserByUser(User user) throws CustomException;

    User selectUserByName(String username) throws CustomException;

    List<User> selectUserInfoList(Map para) throws CustomException;

    BigDecimal getMaxUserNoAdd() throws  CustomException;

    int insertUser(User user) throws  CustomException;

    User selectUserById(Integer userId) throws CustomException;

    List<User> testMapString(Map para) throws CustomException;
}
