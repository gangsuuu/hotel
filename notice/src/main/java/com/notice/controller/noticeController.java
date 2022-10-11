package com.notice.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.notice.dao.NoticeDAO;
import com.notice.service.NoticeServiceImpl;
import com.notice.service.PageServiceImpl;
import com.notice.vo.NoticeVO;

@Controller
public class noticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private PageServiceImpl pageService;
	
	/**
	 * event_list_search.do : 이벤트 검색 기능
	 */
	@RequestMapping(value="event_list_search.do", method=RequestMethod.GET)
		public ModelAndView event_list_search(String rpage,
				@RequestParam(defaultValue="ntitle") String search_option, //기본 검색 옵션값 제목
				@RequestParam(defaultValue="") String keyword //키워드 기본값 공백
				)throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.event_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// 검색 됬음을 알려주는 객체
		mv.setViewName("event_list_search");
		
			return mv;
		
	}
	/**
	 * notice_list_search.do : 공지 검색 기능
	 */
	@RequestMapping(value="notice_list_search.do", method=RequestMethod.GET)
	public ModelAndView notice_list_search(String rpage,
			@RequestParam(defaultValue="ntitle") String search_option, //기본 검색 옵션값 제목
			@RequestParam(defaultValue="") String keyword //키워드 기본값 공백
			)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.notice_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// 검색 됬음을 알려주는 객체
		mv.setViewName("notice_list_search");
		
		return mv;
		
	}
	
		
	
	
	/**
	 *notice_content.do : 이벤트 상세 정보 
	 */
	@RequestMapping(value="/event_content.do", method=RequestMethod.GET)
	public ModelAndView event_content(String nid) {
ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		if(vo != null){
			noticeService.getUpdateHits(nid);
		}
		mv.addObject("vo", vo);
		mv.setViewName("/event_content");
		return mv;
	}
	
	/**
	 *notice_content.do : 공지사항 상세 정보 
	 */
	@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content( String nid) {
ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		if(vo != null){
			noticeService.getUpdateHits(nid);
		}
		mv.addObject("vo", vo);
		mv.setViewName("/notice_content");
		return mv;
	}
	
	/**
	 * event_list.do : 이벤트 목록
	 */
	@RequestMapping(value="/event_list.do",method=RequestMethod.GET)
	public ModelAndView event_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.event_getList(param.get("startCount"), param.get("endCount"));
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
					mv.setViewName("event_list");
					
			
					return mv;
	}
	/**
	 * notice_list.do : 공지사항 목록
	 */
	@RequestMapping(value="/notice_list.do",method=RequestMethod.GET)
	public ModelAndView notice_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.getList(param.get("startCount"), param.get("endCount"));
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
					mv.setViewName("notice_list");
					
			
					return mv;
	}
}
