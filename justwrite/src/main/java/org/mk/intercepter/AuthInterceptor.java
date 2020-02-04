package org.mk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handle) throws Exception{
		
		HttpSession session = request.getSession();
		
		Object obj = session.getAttribute("login");
		
		if(obj == null) {
			
			response.sendRedirect("/login");
			
			return false;
		}
		
		return true;
		
	}
}
