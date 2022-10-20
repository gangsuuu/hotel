package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DiningController {
	@RequestMapping(value="shillastay/dining/resturant.do",method=RequestMethod.GET)
	public String resturant() {
		
		return "dining/resturant";
	}
	@RequestMapping(value="shillastay/dining/lounge.do",method=RequestMethod.GET)
	public String lounge() {
		
		return "dining/lounge";
	}
}
