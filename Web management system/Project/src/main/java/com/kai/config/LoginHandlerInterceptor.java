package com.kai.config;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginHandlerInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object loginUser = request.getSession().getAttribute("loginUser");
        if(loginUser==null){//No sign in
            request.setAttribute("msg","No permissions. Please sign in");
            request.getRequestDispatcher("/index.html").forward(request,response);
            return false;
        }
        else {
            return true;
        }
    }


}
