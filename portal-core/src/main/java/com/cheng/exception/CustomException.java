package com.cheng.exception;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 14:01
 */
public class CustomException extends RuntimeException {
    public String message;
    public String code;
    public CustomException(String code, String message){
        this.message=message;
        this.code = code;
    }
    public CustomException(String message){
        this.message=message;
    }


    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}
