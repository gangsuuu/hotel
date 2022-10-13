package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	/**
	 *	shillastayindex.do
	 *	shillastay 타입의 페이지 
	 */
	@RequestMapping(value="/shillastayindex.do",method=RequestMethod.GET)
	public ModelAndView shillastayindex(String hotelname) {
		ModelAndView mv = new ModelAndView();
		
		if(hotelname == null) {
			hotelname = "stayhub";
		}
		
		mv.addObject("hotelname", hotelname);
		mv.setViewName("index/shillastayindex");
		return mv;
	}
	
}
