package com.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MainController {
	/**
	 * admin_left_bar.do
	 */
	@RequestMapping(value="/admin_left_bar.do", method=RequestMethod.GET)
	public String admin_left_bar() {
		return "admin_left_bar";
	}
	/**
	 * left_bar.do
	 */
	@RequestMapping(value="/left_bar.do", method=RequestMethod.GET)
	public String left_bar() {
		return "left_bar";
	}
}
