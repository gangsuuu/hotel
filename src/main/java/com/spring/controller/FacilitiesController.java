package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class FacilitiesController {
	@RequestMapping(value="shillastay/facilities/businessRoom.do",method=RequestMethod.GET)
	public String businessRoom() {
		return "facilities/businessRoom";
	}
	@RequestMapping(value="shillastay/facilities/fitnessRoom.do",method=RequestMethod.GET)
	public String fitnessRoom() {
		return "facilities/fitnessRoom";
	}
	@RequestMapping(value="shillastay/facilities/meetingRoom.do",method=RequestMethod.GET)
	public String meetingRoom() {
		return "facilities/meetingRoom";
	}
}
