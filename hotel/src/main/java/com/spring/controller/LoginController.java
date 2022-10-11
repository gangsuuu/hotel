package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;
import com.spring.service.MemberServiceImpl;

@Controller
public class LoginController {

	@Autowired
	private MemberServiceImpl memberService;
	
	
	/**
	 * loginCheck.do : 로그인 처리
	 */
	@RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(HotelMemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		SessionVO svo = memberService.getLoginResult(vo); 
		
		if(svo != null) {
			if(svo.getLoginresult() == 1){
				//session.setAttribute("hid", vo.getHid());
				session.setAttribute("svo", svo);
				mv.addObject("login_result","ok");
				mv.setViewName("inquiry/inquiry_list.do");
			}
		}else{
			mv.addObject("login_result","fail");
			mv.setViewName("/login/login");
		}
		
		return mv;
	}
	
	/**
	 * login.do : 로그인 폼
	 */
	@RequestMapping(value="/login.do", method=RequestMethod.GET)
	public String login() {
//		ModelAndView mv = new ModelAndView();
//		mv.addObject("auth", auth);
//		mv.setViewName("/login/login");
		
		return "/login/login";
	}
	
	
}
