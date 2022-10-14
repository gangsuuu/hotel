package com.spring.controller;

import java.util.ArrayList;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.dao.HotelMemberDAO;
import com.hotel.vo.BasketVO;
import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;
import com.spring.service.BasketServiceImpl;
import com.spring.service.MemberServiceImpl;



@Controller
public class LoginController {

	@Autowired
	private MemberServiceImpl MemberService;

	@Autowired
	private BasketServiceImpl basketService;
	
	
	/**
	 * loginCheck.do : 로그인 처리
	 */
	@RequestMapping(value="/loginCheck.do",  method=RequestMethod.POST)
	public ModelAndView loginCheck(HotelMemberVO vo,HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo=MemberService.getLogin(vo);
		
		if(svo != null) {
			if(svo.getLoginresult() == 1){
				//로그인 성공 --> session객체에 key(sid),value(로그인계정) 추가 후 index 페이지로 이동
				//session.setAttribute("sid", vo.getId());
				session.setAttribute("svo", svo);
				mv.addObject("login_result","ok");
				mv.setViewName("/login/loginresult");
			}
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
	
	@RequestMapping(value="/book.do",method=RequestMethod.GET)
	public ModelAndView booklist() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BasketVO> blist=(ArrayList<BasketVO>)basketService.getList();
		mv.addObject("basketlist", blist);
		mv.setViewName("/book/book");
		return mv;
	}
}

