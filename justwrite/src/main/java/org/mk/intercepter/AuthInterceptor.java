package org.mk.intercepter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.mk.domain.Login;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
	
		Object session = request.getSession().getAttribute("id");
		System.out.println(session);
		System.out.println("인터셉터로 왔음");
		if(session == null) {
			System.out.println("인터셉터로 왔음 : 세션 널");
			response.sendRedirect("http://localhost:8080/justwrites/login");
			
			return false;
		}
		
		Object login = request.getSession().getAttribute("id");
		System.out.println(login);
		if(login == null) {
			System.out.println("인터셉터로 왔음 : 로그인 정보 널");
			response.sendRedirect("http://localhost:8080/justwrites/login");
			return false;
		}
		
		
		return true;
	}

/*//	@Override
//	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
//			ModelAndView modelAndView) throws Exception {
//		// TODO Auto-generated method stub
//		super.postHandle(request, response, handler, modelAndView);
//	}
*/
	
	
	
	
}
