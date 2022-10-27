package com.spring.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hotel.vo.SessionVO;

public class MyAuthInterceptor extends HandlerInterceptorAdapter {
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
		throws Exception {
		
		//세션을 체크하는 로직 구현
		//1. request 객체를 통해 session 정보를 가져오기
		HttpSession session = request.getSession();
		
		//2. 로그인 성공 시, session에 로그인 인증키(mid) 담아서 클라이언트에게 전송
		//로그인한 계정 : 자신의 ID, 로그인하지 않은 사용자 : null
		SessionVO svo = (SessionVO)session.getAttribute("svo");
		
		if(svo == null) {
			//로그인을 하지 않은 사람이면,
			response.sendRedirect("http://localhost:9000/hotel/login.do?auth=fail");//로그인 페이지로 보내기
			return false;
				
		}//if
			//로그인한 계정은 다 보일 수 있음!	
		return true; //로그인에 성공하면 정상적으로 다음 로직으로 실행함
		
	}
	
}

