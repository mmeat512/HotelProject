package com.hotel.util.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class QnaBoardInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
			HttpSession session = request.getSession();
			System.out.println("인터셉터:" + session.getAttribute("userId"));
			String userId = (String)session.getAttribute("userId");
			if(userId == null) {
				System.out.println("인터셉터 세션 null일 때");
				return true;
			}else {
				System.out.println("인터셉터 null 아닐 때");
				response.sendRedirect(request.getContextPath()+"/qna/qnaUserRegist");
				return false;
			}
	}

	
	
}
