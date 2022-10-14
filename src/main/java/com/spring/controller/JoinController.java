package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.dao.HotelMemberDAO;
import com.spring.service.MemberServiceImpl;
import com.hotel.vo.HotelMemberVO;



@Controller
public class JoinController {
	@Autowired
	private MemberServiceImpl memberService;
	
	

	/*
	 * joinCheck.do  회원가입 처리문
	 */
	@RequestMapping(value="/joinCheck.do",  method=RequestMethod.POST)
	public ModelAndView joinCheck(HotelMemberVO vo) {
		ModelAndView mv = new ModelAndView();
	
			int result = memberService.getJoinResult(vo);
		
		if(result == 1){
			mv.addObject("join_result","ok");
			mv.setViewName("/login/login");  //로그인창
	
		}else{
  
			mv.setViewName("error_page");
		}
		
		return mv;  
	} 
	
	/*
	 * join.do 
	 */
	@RequestMapping(value="/join.do",  method=RequestMethod.GET)
	public String join() {
		return "/join/join";   // login 폴더안에 있는 login.jsp 파일을 의미 한다
	} 
	/*
	 * joinstep.do 
	 */
	@RequestMapping(value="/joinstep.do", method=RequestMethod.GET)
	public String joinstep() {
		return "/join/joinstep";
	}
	
	/*
	 * id_check.do : 아이디 중복 
	 */
	@ResponseBody  //ajax 
	@RequestMapping(value="/id_check.do",  method=RequestMethod.GET)
	public String id_check(String mid){
	
		return String.valueOf(memberService.getIdCheck(mid));  
	}
	
	

	
	
}











