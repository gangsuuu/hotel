package com.spring.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.vo.NoticeVO;
import com.spring.service.NoticeServiceImpl;

@Controller
public class IndexController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	
	/**
	 *  index.do
	 */
	/*
	 * @RequestMapping(value="/shillaStay.do",method=RequestMethod.GET) public
	 * String header() { return "index"; }
	 */
	@RequestMapping(value="/shillaStay.do",method=RequestMethod.GET) 
	public ModelAndView header() {
		ModelAndView mv = new ModelAndView();
		ArrayList<NoticeVO> eventlist = noticeService.getRecentEvent();//최근 이벤트3건 
		mv.addObject("eventlist", eventlist);
		mv.setViewName("index");
		
		return mv;
	}
	/****************************
	 		shlliastay
	**************************** */

	
	
	
	
	/**
	 *	shillastayindex.do
	 *	shillastay 타입의 페이지 
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
	 *	shillastay hub의 about 호텔
	 *	 */
	@RequestMapping(value="/shillastayindex/aboutShillaStay.do",method=RequestMethod.GET)
	public ModelAndView aboutShillaStay() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("shillastay/aboutShillaStay");
		return mv;
	}
	
	/**
	 *	shillastayindex_brandStoryShillaStay.do
	 *	shillastay hub의 about 호텔
	 *	 */
	@RequestMapping(value="/shillastayindex/brandStoryShillaStay.do",method=RequestMethod.GET)
	public ModelAndView brandStoryShillaStay() {
		ModelAndView mv = new ModelAndView();
		
		
		mv.setViewName("shillastay/brandStoryShillaStay");
		return mv;
	}
	
	/**
	 *	shillastayindex_findHotel.do
	 *	신라스테이 호텔 찾기 
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
	 *	shillastay 타입의 페이지 
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
