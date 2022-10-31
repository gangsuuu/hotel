package com.spring.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.vo.BasketVO;
import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;
import com.spring.service.BasketServiceImpl;
import com.spring.service.MemberServiceImpl;
import com.spring.service.PageServiceImpl;



@Controller
public class LoginController {

   @Autowired
   private MemberServiceImpl MemberService;
   
   @Autowired 
   private BasketServiceImpl basketService;
   @Autowired 
   private PageServiceImpl pageService;
   
   

   /**
    * logout.do : 로그아웃
    */
   @RequestMapping(value="/logout.do", method=RequestMethod.GET)
   public ModelAndView logout(HttpSession session) {
      ModelAndView mv = new ModelAndView();
      
      SessionVO svo = (SessionVO)session.getAttribute("svo");
      
      if(svo != null) {
         session.invalidate();   //세션 정보 삭제
         mv.addObject("logout_result","ok"); 

      }
      
      mv.setViewName("redirect:/shillaStay.do");
      
      return mv;
      
   }
   
   /**
    * loginCheck.do : 로그인 처리
    */
   @RequestMapping(value="/loginCheck.do", method=RequestMethod.POST)
   public ModelAndView loginCheck(HotelMemberVO vo, HttpSession session) {
      
      ModelAndView mv = new ModelAndView();
      
      SessionVO svo = MemberService.getLoginResult(vo); 
      
      if(svo != null) {
         svo.getLoginresult();
         
         if(svo.getLoginresult() == 1){
      
            session.setAttribute("svo", svo);
            mv.addObject("login_result","ok");
            mv.setViewName("redirect:/shillaStay.do");
         }
      }else{
         mv.addObject("login_result","fail");
         mv.setViewName("/login/login");
      }
            
      return mv;
   }
   
   /**
    * loginCheck.do : 로그인 폼 화면
    */
   @RequestMapping(value="/login.do", method=RequestMethod.GET)
   public ModelAndView login(String auth) {
      ModelAndView mv = new ModelAndView();
      mv.addObject("auth", auth);
      mv.setViewName("/login/login");
      return mv;
   }
   
   
   /********** 조진희 **************/
   @RequestMapping(value="/book.do",method=RequestMethod.GET)
   public ModelAndView booklist(String rpage) {
      ModelAndView mv = new ModelAndView();
      Map<String, Integer> param = pageService.getPageResult(rpage, "basket", basketService);
      
       ArrayList<BasketVO> blist=(ArrayList<BasketVO>)basketService.getList(param.get("startCount"), param.get("endCount"));
      mv.addObject("dbCount", param.get("dbCount"));
      mv.addObject("rpage", param.get("rpage"));
      mv.addObject("pageSize", param.get("pageSize"));
       mv.addObject("basketlist", blist);
      mv.setViewName("/book/book");
      return mv;
   }
   
   
   
}
