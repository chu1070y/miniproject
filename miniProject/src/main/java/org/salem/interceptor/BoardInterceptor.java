package org.salem.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import lombok.extern.log4j.Log4j;

@Log4j
public class BoardInterceptor extends HandlerInterceptorAdapter {

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		log.info("BoardInterceptor in......");
		
		Cookie giveMeCookie = null;

		Cookie[] cks = request.getCookies();
		
		String bno = request.getParameter("bno");

		boolean check = false;
		
		for (Cookie cookie : cks) {
			if (cookie.getName().equals("GiveMeCookies")) {
				check = true;
				giveMeCookie = cookie;
				break;
			}
		}

		
		//쿠키 생성 또는 수정
		if(check == false) {
			Cookie cookie = new Cookie("GiveMeCookies", bno);
			cookie.setMaxAge(60*60*24);
		    response.addCookie(cookie);
		}else {
			
			//쿠키 중복값 확인
			String[] arr = giveMeCookie.getValue().split("_");

			for(String str : arr) {
				
				if(str.equals(bno)) {
					return;
				}
				
			}
			
			
			giveMeCookie.setValue(giveMeCookie.getValue()+"_"+bno);
			response.addCookie(giveMeCookie);
		}
		
		
		
		
		super.postHandle(request, response, handler, modelAndView);
	}

}
