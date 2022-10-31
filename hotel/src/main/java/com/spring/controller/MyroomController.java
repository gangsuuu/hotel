package com.spring.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.MemberServiceImpl;
import com.spring.service.MyroomServiceImpl;
import com.spring.service.PageServiceImpl;
import com.hotel.vo.MyroomVO;
import com.hotel.vo.SessionVO;

@Controller
public class MyroomController {

	@Autowired 
	private MyroomServiceImpl myroomService;
	@Autowired 
	private PageServiceImpl pageService;
	
	
	@RequestMapping(value = "myroom.do",method = RequestMethod.GET)
	public ModelAndView selectAll(String rpage,String mid) {
		ModelAndView mv=new ModelAndView();
		Map<String, Integer> param = pageService.getPageResult(rpage, "myroom", myroomService,mid);
		ArrayList<MyroomVO> mlist=(ArrayList<MyroomVO>)myroomService.getSelect(mid,param.get("startCount"),param.get("endCount"));
		System.out.println(mlist.size());
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("rpage", param.get("rpage"));
		mv.addObject("pageSize", param.get("pageSize"));		
		mv.addObject("mlistsize", mlist.size());
		mv.addObject("mlist", mlist);
		mv.setViewName("/myroom/myroom");
		return mv;
		
	}
	
	@RequestMapping(value="myroomcancel.do",method= RequestMethod.POST)
	public ModelAndView delete(MyroomVO vo,HttpSession session) {
		ModelAndView mv=new ModelAndView();
		SessionVO svo= (SessionVO)session.getAttribute("svo");
		vo.setMid(svo.getMid());
		int result=myroomService.getmyroomDelete(vo);
		if(result==1) {
			mv.addObject("cancel_result", "ok");
			mv.setViewName("/myroom/cancel_result");
		}
		return mv;
		
	}
	
	@RequestMapping(value="cancel_result.do",method= RequestMethod.POST)
	public String cancel_result() {
		return "/myroom/cancel_result";
	}
	
	@RequestMapping(value="roombook.do",method= RequestMethod.POST)
	public ModelAndView roomcancel(MyroomVO vo) {
		ModelAndView mv = new ModelAndView();
		int isday= Integer.parseInt(vo.getRadatestart());
		int ieday= Integer.parseInt(vo.getRadateend());
		vo.setEday(ieday);
		vo.setSday(isday);
		
		mv.addObject("vo", vo);
		mv.setViewName("/myroom/roombook");
		
		return mv;
	}
	
	
	
}
