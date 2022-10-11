package com.hotel.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.service.MyroomServiceImpl;
import com.hotel.vo.MyroomVO;
import com.hotel.vo.SessionVO;

@Controller
public class MyroomController {

	@Autowired 
	private MyroomServiceImpl myroomService;
	
	@RequestMapping(value = "myroom.do",method = RequestMethod.GET)
	public ModelAndView selectAll(String mid) {
		ModelAndView mv=new ModelAndView();
		ArrayList<MyroomVO> mlist=(ArrayList<MyroomVO>)myroomService.getSelect(mid);
		mv.addObject("mlist", mlist);
		mv.setViewName("/myroom/myroom");
		return mv;
		
	}
	
}
