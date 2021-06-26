package com.lzf.interceptor;

import com.lzf.po.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(javax.servlet.http.HttpServletRequest httpServletRequest,
                             javax.servlet.http.HttpServletResponse httpServletResponse,
                             Object o) throws Exception {
        // 获取请求的url
        String url = httpServletRequest.getRequestURI();
        // 除了登录、登录页面以外，其他url都进行拦截处理
        if (url.indexOf("/toLogin")>=0 || url.indexOf("/doLogin") >=0
                || url.indexOf("/toRegister")  >= 0||url.indexOf("/doRegister") >= 0 ){
            return true;
        }
        // 获取session
        HttpSession httpSession = httpServletRequest.getSession();
        User user = (User) httpSession.getAttribute("USER_SESSION");
        // 判断session中是否有用户数据，如果有，则已经登录，返回true，继续进行后续操作
        if (user != null){
            return true;
        }
        // 不符合条件的给出提示信息，并转发到登录页面
        System.out.println("没有权限");
        httpServletRequest.getRequestDispatcher("/WEB-INF/jsp/login.jsp").forward(httpServletRequest, httpServletResponse);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
