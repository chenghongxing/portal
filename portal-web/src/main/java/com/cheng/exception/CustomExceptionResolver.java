package com.cheng.exception;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.freemarker.FreeMarkerView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @ClassName(类名) ：
 * @Description(描述) ：
 * @author(作者) ： ChengHongXing
 * @data(开发日期) ： 2018/12/18 14:15
 */
public class CustomExceptionResolver implements HandlerExceptionResolver {
    private static final Logger logger= LoggerFactory.getLogger(CustomExceptionResolver.class);
    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        CustomException customException = null;
        e.printStackTrace();
        String message = "";
        if (e instanceof CustomException){
            customException = (CustomException)e;
            message = customException.getMessage();
        } else {
            customException = new CustomException("999999","系统未知错误");
            message=customException.getMessage();
        }
        logger.error(message+"---异常信息----"+e.getMessage());
        View view = new FreeMarkerView();
        ModelAndView modelAndView = new ModelAndView(view);
        modelAndView.addObject("message",message);
        modelAndView.setViewName("errorPage");
        return modelAndView;
    }
}
