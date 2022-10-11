package com.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.service.BasketServiceImpl;
import com.hotel.service.MemberServiceImpl;
import com.hotel.vo.BasketVO;
import com.hotel.vo.MemberVO;
import com.hotel.vo.SessionVO;

@Controller
public class LoginController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired 
	private BasketServiceImpl basketService;
	
	
	@RequestMapping(value="/login.do",method = RequestMethod.GET)
	public String login() {
		return "/login/login";
	}
	
	/**
	 * loginCheck.do : 로그인 처리
	 */
	@RequestMapping(value="/logincheck.do", method=RequestMethod.POST)
	public ModelAndView loginCheck(MemberVO vo, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SessionVO svo = memberService.getLogin(vo); 
		
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
			mv.setViewName("/login/loginresult");
		}
				
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
	
	@RequestMapping(value="/book2.do",method=RequestMethod.GET)
	public ModelAndView booklist2() {
		ModelAndView mv = new ModelAndView();
		ArrayList<BasketVO> blist=(ArrayList<BasketVO>)basketService.getList();
		mv.addObject("basketlist", blist);
		mv.setViewName("/book/book2");
		return mv;
	}
}




