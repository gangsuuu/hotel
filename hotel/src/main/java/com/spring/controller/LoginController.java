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
	 * loginCheck.do : �α��� ó��
	 */
	@RequestMapping(value="/loginCheck.do",  method=RequestMethod.POST)
	public ModelAndView loginCheck(HotelMemberVO vo) {
		ModelAndView mv = new ModelAndView();
		
		int result = MemberService.getLoginResult(vo); 
		
		if(result == 1){
			//�α��� ���� --> session��ü�� key,value �߰��� index �������� �̵�
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

