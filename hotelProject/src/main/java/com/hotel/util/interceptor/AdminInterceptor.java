package com.hotel.util.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		if(userId != null && !(userId.equals("admin")) || userId == null ) {
			request.setAttribute("msg", "접근 권한이 없습니다.");
			request.getRequestDispatcher("/").forward(request, response);
			return false;
		}else {
			return true;
		}
		
	}

	
}
