package com.zl.filter;

import com.zl.pojo.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;


public class UserLoginFilter implements Filter {
    @Override
    public void destroy() {
        System.out.println("用户登录过滤器销毁");
    }

    @Override
    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        //获取用户的登录信息
        User loginUser = (User) request.getSession().getAttribute("user");
        //获取到请求的路径
        String path = request.getServletPath();
        System.out.println("本次过滤的请求为：" + path);
        //项目的绝对路径
        String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
        //由于不能过滤一些特定请求，所以需要拿到该请求的路径进行判断
        if ("/user/registerJson".equals(path)||"/user/loginJson".equals(path) || loginUser != null || "/login.jsp".equals(path) || "/user/login".equals(path) || "/register.jsp".equals(path) || "/news/registerAjaxServlet".equals(path) ||"/news/registerServlet".equals(path) || "/news/loginAjax".equals(path)) {
            chain.doFilter(request, response);
        } else {
            //访问的是项目的绝对路径加上要访问的页面，不会出现404的情况
            response.sendRedirect(basePath + "login.jsp?error=" + URLEncoder.encode("非法请求，请先登录", "utf-8"));
        }
    }

    public void init(FilterConfig config) throws ServletException {
        System.out.println("用户登录过滤器创建");
    }

}
