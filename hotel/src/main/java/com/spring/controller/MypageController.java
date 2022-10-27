package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MemberServiceImpl;
import com.hotel.vo.HotelMemberVO;

@Controller
public class MypageController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	/*
	 * 마이페이지 호출 
	 */
	@RequestMapping(value="/mypage.do",  method=RequestMethod.GET)
	public String mypage() {
		return "mypage/mypage";   
	} 
	/*
	 * 마이페이지 멤버쉽 혜택 호출 (membershipoffer)
	 */
	@RequestMapping(value="/membershipoffer.do",  method=RequestMethod.GET)
	public String membershipoffer() {
		return "mypage/membershipoffer";   
	} 
	@RequestMapping(value="/passupdate.do",  method=RequestMethod.GET)
	public String passupdate() {
		return "mypage/passupdate";  
	} 

	/*
	 * 현재비밀번호 새비밀번호 체크 처리문 
	 */
	@ResponseBody
	@RequestMapping(value="/mbrpass_check.do", method=RequestMethod.GET)
	public String mbrpass_check(HotelMemberVO vo){
		int result = memberService.mbrpassCheck(vo);
	
		return String.valueOf(result);
	}
	/*
	 * passcheckupdate 업데이트 처리문
	 */
	@RequestMapping(value="/passcheckupdate.do",  method=RequestMethod.POST)
	public ModelAndView passcheckupdate(HotelMemberVO vo) {

		ModelAndView mv = new ModelAndView();
	
			int result = memberService.passUpdate(vo);
			System.out.println(result);
		if(result == 1){
			mv.addObject("passUpdate","ok");
			mv.setViewName("/mypage/mypage");  
	
		}else{
			
			mv.setViewName("error_page");
		}
		
		return mv;  
	} 
	/*
	 * memberUpdate 프로필수정화면
	 */
	@RequestMapping(value="/mupdate.do",  method=RequestMethod.GET)
		//로그인한 회원 정보가져오기
		public ModelAndView memberUpdate(String mid){
			ModelAndView mv = new ModelAndView();
			HotelMemberVO vo = memberService.getMemberContent(mid);
			mv.addObject("vo",vo);
			mv.setViewName("/mypage/mbrupdate");  //마이페이지 창
			
			return mv;  
		} 
	
	
	
	/*
	 * memberUpdate.check.do 프로필수정 업데이트 처리문
	 */	
	@RequestMapping(value="/memberUpdatecheck.do",  method=RequestMethod.POST)
	public ModelAndView memberUpdatecheck(HotelMemberVO vo) {
		ModelAndView mv = new ModelAndView();
	
			int result = memberService.memberUpdateCheck(vo);
			
			if(result == 1){
				mv.addObject("memberupdate","ok");
				mv.setViewName("/mypage/mypage");  //마이페이지 창
		
			}else{
	  
				mv.setViewName("error_page");
			}
			
			return mv;  
		} 
			
	}	

	
