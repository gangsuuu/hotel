package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AccommodationController {
	
	//allrooms
	@RequestMapping(value="accommodation/allrooms.do",method=RequestMethod.GET)
	public String allrooms() {
		return "viewAccmo/allrooms";
	}
	
	//deluxe
	@RequestMapping(value="accommodation/deluxe.do",method=RequestMethod.GET)
	public String deluxe() {
		return "viewAccmo/deluxe";
	}
	//deluxOndol
	@RequestMapping(value="accommodation/deluxeOnDol.do",method=RequestMethod.GET)
	public String deluxOndol() {
		return "viewAccmo/deluxeOnDol";
	}
	
	//grand
	@RequestMapping(value="accommodation/grand.do",method=RequestMethod.GET)
	public String grand() {
		return "viewAccmo/grand";
	}
	
	//primierDeluex
	@RequestMapping(value="accommodation/primierDeluxe.do",method=RequestMethod.GET)
	public String primierDeluex() {
		return "viewAccmo/primierDeluxe";
	}
	
	//standard
	@RequestMapping(value="accommodation/standard.do",method=RequestMethod.GET)
	public String standard() {
		return "viewAccmo/standard";
	}
}
