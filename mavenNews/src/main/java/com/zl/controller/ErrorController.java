package com.zl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.servlet.ModelAndView;

@Controller
@ControllerAdvice(basePackages = "com.zl.controller")
public class ErrorController {
    /**
     * 标记此方法为处理异常的方法
     * @param e
     * @return
     */
    @ExceptionHandler
    public ModelAndView error(Exception e){
        ModelAndView mv = new ModelAndView();
        if (e instanceof MaxUploadSizeExceededException){
            mv.setViewName("error");
            mv.addObject("error","图片上传过大");
        }else if (e instanceof ArithmeticException){
            mv.setViewName("error");
            mv.addObject("error","算数异常,不会影响交易正常进行...");
        }
        return mv;
    }
}
