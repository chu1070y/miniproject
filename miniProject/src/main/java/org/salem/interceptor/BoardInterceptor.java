package org.salem.interceptor;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class BoardInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		Cookie[] cks = request.getCookies();

		boolean check = false;
		
		for (Cookie cookie : cks) {
			if (cookie.getName().equals("GiveMeCookies")) {
				check = true;
				break;
			}
		}
		
		if(check == false) {
			Cookie cookie = new Cookie("GiveMeCookies", "쿠키짜응");

		    response.addCookie(cookie);
		}

		return super.preHandle(request, response, handler);
	}

}
