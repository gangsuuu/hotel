package com.hotel.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.service.BasketServiceImpl;
import com.hotel.service.BookServiceImpl;
import com.hotel.service.MemberServiceImpl;
import com.hotel.vo.BasketVO;
import com.hotel.vo.BookVO;
import com.hotel.vo.MemberVO;
import com.hotel.vo.SessionVO;

@Controller
public class BookController {
	
	@Autowired
	private MemberServiceImpl memberService;
	@Autowired 
	private BasketServiceImpl basketService;
	@Autowired
	private BookServiceImpl bookService;
	
	
	@RequestMapping(value="/bookinsert.do",method = RequestMethod.POST)
	public ModelAndView bookinsert(String bid) {
		ModelAndView mv=new ModelAndView();
		BasketVO vo=basketService.getSelect(bid);
		mv.addObject("vo",vo);
		mv.setViewName("/book/bookinsert");
		return mv;
	}
	
	@RequestMapping(value="/bookinsertresult.do",method=RequestMethod.POST)
	public ModelAndView bookInsert(BookVO vo) {
		ModelAndView mv=new ModelAndView();
		int days=Integer.parseInt(vo.getRadateend())-Integer.parseInt(vo.getRadatestart());
		int rprice=Integer.parseInt(vo.getPrice());
		int total=days*rprice;
		vo.setPrice(String.valueOf(total));
		
		int result=bookService.getInsert(vo);
		if(result ==1) {
			mv.addObject("book_result", "ok");
			mv.setViewName("/book/bookinsertresult");
		}else {
			mv.setViewName("error_page");
		}
		return mv;
		
		
	}
	

	
	
}




