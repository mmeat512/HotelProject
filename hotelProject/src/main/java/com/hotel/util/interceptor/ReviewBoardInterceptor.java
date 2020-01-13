package com.hotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class ReviewBoardInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		System.out.println(userId);
		if(userId==null) {
			response.sendRedirect(request.getContextPath()+"/user/userLogin");
			return false;
		}else if(userId.equals(userId)) {
			return true;
		}
		return super.preHandle(request, response, handler);
	}
 
	
}
