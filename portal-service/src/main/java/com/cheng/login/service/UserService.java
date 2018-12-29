package com.cheng.login.service;

import com.cheng.login.domain.User;
import com.cheng.exception.CustomException;
import com.cheng.login.mapper.UserMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/19 11:53
 */
@Service
public class UserService implements IUserService {
    private static final Logger logger= LoggerFactory.getLogger(UserService.class);

    @Autowired
    UserMapper userMapper;

    @Override
    public User selectUserByName(String userName) throws CustomException{
        User user =null;
        try {
           user = userMapper.selectByUsername(userName);
            logger.info("查询用户信息----username="+userName+"----"+user);
        } catch (Exception e) {
            logger.error("查询用户异常----"+e.getMessage());
        }
        return user;
    }

    @Override
    public User selectUserByPhoneNo(String phoneNo) throws CustomException {
        User user = null;
        try {
            user = userMapper.selectByPhoneNo(phoneNo);
            logger.info("手机号查询用户---phone="+phoneNo+"---result="+user);
        } catch (Exception e) {
            logger.error("手机号查用户异常---"+e.getMessage());
        }
        return user;
    }

}
