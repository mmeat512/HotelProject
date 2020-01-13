package com.hotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginFormInterceptor extends HandlerInterceptorAdapter{

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String uri = (String)session.getAttribute("uri");
		String userId = (String)session.getAttribute("userId");
		System.out.println(uri);
		if(userId != null && uri != null) {
			response.sendRedirect(uri);
		}else if(userId != null) {
			response.sendRedirect(request.getContextPath());
		}
	}

	
}
