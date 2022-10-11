package com.hotel.controller;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.service.BasketService;
import com.hotel.service.BasketServiceImpl;
import com.hotel.service.FileServiceImpl;
//import com.hotel.service.PageServiceImpl;
import com.hotel.vo.BasketVO;

@Controller
public class BasketController {
	
	@Autowired
	private BasketServiceImpl basketService;
	
	@Autowired
	private FileServiceImpl fileService;
	
	//@Autowired PageServiceImpl pageService;
	
	/*
	@RequestMapping(value="/delete_result.do",method=RequestMethod.POST)
	public ModelAndView delete_result(String bnum) {
		ModelAndView mv=new ModelAndView();
		
		//basketService.getDelete(bnum);
		mv.addObject("bnum",bnum);
		mv.setViewName("/main");
		
		return mv;
	}
	*/
	@RequestMapping(value="/delete_result.do",method=RequestMethod.POST)
	public ModelAndView delete_result(BasketVO vo,String bsfile,HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView();
		//System.out.println(bsfile);
		  int result=basketService.getDelete(vo.getBid());
		  fileService.fileDelete(bsfile, request);
		  if(result==1) {
			mv.addObject("result","delete_ok");
			mv.setViewName("/basket/delete");
			} 
		
		return mv;
	}
	
	
	@RequestMapping(value="/delete.do",method=RequestMethod.GET)
	  public ModelAndView delete_list() { 
		ModelAndView mv=new ModelAndView();
		ArrayList<BasketVO> blist=(ArrayList<BasketVO>)basketService.getList();
		mv.addObject("blist", blist);
		mv.setViewName("/basket/delete");
		return mv; 
	}
	 
	
	@RequestMapping(value="/main.do",method=RequestMethod.GET)
	public String main() {
		return "/main";
		
	}
	
	
	@RequestMapping(value="/list.do", method=RequestMethod.GET)
	public ModelAndView basket_list(){
		ModelAndView mv = new ModelAndView();
		ArrayList<BasketVO> blist = (ArrayList<BasketVO>)basketService.getList();
		mv.addObject("blist", blist);
		mv.setViewName("/basket/list");
		return mv;
	}
	
	

	@RequestMapping(value="/basketinsert.do",method=RequestMethod.POST)
	public ModelAndView basketInsert(BasketVO vo, HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView();
		vo=fileService.fileCheck(vo);
		int result=basketService.getInsert(vo);
		
		if(result==1) {
			fileService.fileSave(vo, request);
			mv.addObject("insert_result","ok");
			mv.setViewName("/main");
		}else {
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	@RequestMapping(value = "/update.do",method = RequestMethod.GET)
	public ModelAndView update_list(String bid) {
		ModelAndView mv=new ModelAndView();
		BasketVO vo=basketService.getSelect(bid);
		mv.addObject("vo",vo);
		mv.setViewName("/basket/update");
		return mv;
	}
	
	@RequestMapping(value="update_excute.do",method = RequestMethod.POST)
	public ModelAndView update_excute(BasketVO vo,HttpServletRequest request) throws Exception{
		ModelAndView mv=new ModelAndView();
		String old_filename = vo.getBsfile();
		
		vo=fileService.update_fileCheck(vo);
		int result=basketService.getUpdate(vo);
		if(result==1) {
			fileService.update_filesave(vo, request, old_filename);
			mv.addObject("result", "update_ok");
			mv.setViewName("/basket/update");
		}else {
			mv.setViewName("/error_page");
		}
		
		return mv;
	}

}











