package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.service.MemberServiceImpl;
import com.hotel.vo.HotelMemberVO;


@Controller
public class SearchController {
	
	@Autowired
	private MemberServiceImpl memberService;
	
	
	@RequestMapping(value = "/findpw.do", method = RequestMethod.GET)
	public String findpw() {
		return "search/findpw";
	}
	

	@RequestMapping(value = "/findpw.do", method = RequestMethod.POST)
	public void findPwPOST(@ModelAttribute HotelMemberVO member, HttpServletResponse response) throws Exception{	
		memberService.findPw(response, member);
		
	}
	
		@RequestMapping(value="/search.do" , method = RequestMethod.GET)
		public String search() {
			return "search/search";
		}
}

	