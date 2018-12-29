package com.cheng.response;

import java.util.HashMap;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 15:24
 */
public class JsonResponse {
    private String code = null;
    private String message = null;
    private Object data = null;

    private JsonResponse(){}
    public String getCode() {
        return code;
    }

    private void setCode(String code) {
        this.code = code;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public static JsonResponse success(String message){
        JsonResponse jsonResponse = new JsonResponse();
        jsonResponse.setCode("0");
        jsonResponse.setMessage(message);
        jsonResponse.setData(new HashMap<Object,Object>());
        return jsonResponse;
    }

    public static JsonResponse success(String message,Object data){
        JsonResponse jsonResponse = new JsonResponse();
        jsonResponse.setCode("0");
        jsonResponse.setMessage(message);
        jsonResponse.setData(data);
        return jsonResponse;
    }

    public static JsonResponse fail(String code,String message){
        JsonResponse jsonResponse = new JsonResponse();
        jsonResponse.setData(new HashMap<Object,Object>());
        jsonResponse.setMessage(message);
        jsonResponse.setCode(code);
        return jsonResponse;
    }
}
