package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CustomerServiceController {
		
	//introhotel
	@RequestMapping(value="/guestservice/introhotel.do",method=RequestMethod.GET)
	public String introhotelService() {
		return "service/introhotelService";
	}
		
	//viewGuestService
	@RequestMapping(value="/guestservice/viewGuestService.do",method=RequestMethod.GET)
	public String viewGuestService() {
		return "service/viewGuestService";
	}
		
}
