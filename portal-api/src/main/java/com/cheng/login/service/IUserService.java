package com.cheng.login.service;

import com.cheng.login.domain.User;
import com.cheng.exception.CustomException;


/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 13:56
 */
public interface IUserService {
    User selectUserByName(String userName) throws CustomException;

    User selectUserByPhoneNo(String phoneNo) throws CustomException;
}
