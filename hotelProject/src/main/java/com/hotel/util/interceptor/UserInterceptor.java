package com.hotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class UserInterceptor extends HandlerInterceptorAdapter{

	public void saveUrl(HttpServletRequest request){
		//요청 정보 중 get방식의 ? 에 실리는 값
		String query = request.getQueryString();
		HttpSession session = request.getSession();
		session.setAttribute("uri", request.getRequestURI()+(query == null ? "" : "?"+query));
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		if(userId == null ) {
			saveUrl(request);
			response.sendRedirect(request.getContextPath()+"/users/userLogin");
			return false;
		}else {
			return super.preHandle(request, response, handler);
		}
	}

	
}


