package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IndexController {
	
	/**
	 *  index.do
	 */
	@RequestMapping(value="/shillaStay.do",method=RequestMethod.GET)
	public String header() {
		return "index";
	}
	
	/****************************
	 		shlliastay
	**************************** */

	
	
	
	
	/**
	 *	shillastayindex.do
	 *	shillastay Ÿ���� ������ 
	 */
	@RequestMapping(value="shillastayindex.do",method=RequestMethod.GET)
	public ModelAndView shillastayindex(String hotelname) {
		ModelAndView mv = new ModelAndView();
		
		if(hotelname == null) {
			hotelname = "stayhub";
		}
		
		mv.addObject("hotelname", hotelname);
		mv.setViewName("shillastay/shillastayindex");
		return mv;
	}
	
	/**
	 *	shillastayindex_abouthotel.do
	 *	shillastay hub�� about ȣ��
	 *	 */
	@RequestMapping(value="/shillastayindex/aboutShillaStay.do",method=RequestMethod.GET)
	public ModelAndView aboutShillaStay() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("shillastay/aboutShillaStay");
		return mv;
	}
	
	/**
	 *	shillastayindex_brandStoryShillaStay.do
	 *	shillastay hub�� about ȣ��
	 *	 */
	@RequestMapping(value="/shillastayindex/brandStoryShillaStay.do",method=RequestMethod.GET)
	public ModelAndView brandStoryShillaStay() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("shillastay/brandStoryShillaStay");
		return mv;
	}
	
	/**
	 *	shillastayindex_findHotel.do
	 *	�Ŷ����� ȣ�� ã�� 
	 */
	@RequestMapping(value="/shillastayindex/findHotel.do",method=RequestMethod.GET)
	public ModelAndView aboutShillaStay(String loc) {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("loc",loc);
		mv.setViewName("shillastay/findHotel");
		return mv;
	}
	


	
	
	/**
	 *	thesholla.do
	 *	shillastay Ÿ���� ������ 
	 */
	@RequestMapping(value="theshilla.do",method=RequestMethod.GET)
	public ModelAndView theshollaindex(String hotelname) {
		ModelAndView mv = new ModelAndView();
		
		if(hotelname == null) {
			hotelname = "theshilla";
		}
		
		mv.addObject("hotelname", hotelname);
		mv.setViewName("theshilla/theshillaindex");
		return mv;
	}
}
