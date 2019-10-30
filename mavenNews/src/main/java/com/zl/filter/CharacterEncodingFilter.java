package com.zl.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CharacterEncodingFilter implements Filter {
    public void destroy() {
        System.out.println("字符编码过滤器销毁");
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        request.setCharacterEncoding("utf-8");
//        response.setCharacterEncoding("utf-8");
response.setContentType("text/html;charset=utf-8");
        //放行请求
        chain.doFilter(request,response);
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("字符编码过滤器创建");
    }

}
