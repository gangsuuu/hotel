package com.spring.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.service.BasketServiceImpl;
import com.spring.service.BookServiceImpl;
import com.spring.service.MemberServiceImpl;
import com.hotel.vo.BasketVO;
import com.hotel.vo.BookVO;
import com.hotel.vo.SessionVO;

@Controller
public class BookController {
   
   
   @Autowired 
   private BasketServiceImpl basketService;
   @Autowired
   private BookServiceImpl bookService;
   
   
   @RequestMapping(value="/bookinsert.do",method = RequestMethod.GET)
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
      vo.setPrice(String.valueOf(vo.getPrice()));
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



