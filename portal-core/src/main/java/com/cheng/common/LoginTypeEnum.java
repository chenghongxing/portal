package com.cheng.common;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2019/3/19 15:09
 */
public enum  LoginTypeEnum {
    PASSWORD("password"),//密码登录
    NOPASSWD("nopassword");//免密登录

    private String code;

    private LoginTypeEnum(String code){
        this.code=code;
    }

    public String getCode(){
        return code;
    }
}
