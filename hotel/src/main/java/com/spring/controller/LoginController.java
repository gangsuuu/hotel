package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.dao.HotelMemberDAO;
import com.hotel.vo.HotelMemberVO;
import com.spring.service.MemberServiceImpl;



@Controller
public class LoginController {

	@Autowired
	private MemberServiceImpl MemberService;
	/**
	 * loginCheck.do : 로그인 처리
	 */
	@RequestMapping(value="/loginCheck.do",  method=RequestMethod.POST)
	public ModelAndView loginCheck(HotelMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		int result = MemberService.getLoginResult(vo); 
		
		if(result == 1){
			//로그인 성공 --> session객체에 key,value 추가후 index 페이지로 이동
			mv.addObject("login_result","ok");
			mv.setViewName("index");
		}else{
			mv.addObject("login_result","fail");
			mv.setViewName("/login/login");
		}
 	
		return mv;  
	} 
	
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public ModelAndView login(String auth) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("auth", auth);
		mv.setViewName("/login/login");
		return mv;
	}
}

