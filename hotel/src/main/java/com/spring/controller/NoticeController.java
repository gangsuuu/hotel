package com.spring.controller;

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

import com.hotel.dao.NoticeDAO;
import com.hotel.vo.NoticeVO;
import com.spring.service.NoticeServiceImpl;
import com.spring.service.PageServiceImpl;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private PageServiceImpl pageService;
	
	/**
	 * 공지사항 링크페이지 (완성 전 공지사항 링크페이지)
	 */
	@RequestMapping(value="notice_home.do", method=RequestMethod.GET)
	public String notice_home() {
		return "/notice/notice_home";
	}
	
	
	/**
	 * event_list_search.do : 이벤트 검색 기능
	 */
	@RequestMapping(value="event_list_search.do", method=RequestMethod.GET)
		public ModelAndView event_list_search(String rpage,
				@RequestParam(defaultValue="ntitle") String search_option, //기본 검색 옵션값 제목
				@RequestParam(defaultValue="") String keyword //키워드 기본값 공백
				)throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String, Integer> param = pageService.getNoticeSearchResult(rpage, "event", noticeService, search_option, keyword);
		
		ArrayList<NoticeVO> list = noticeService.event_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("listSize", list.size());//검색된 문의글 없으면 표시하기 위해 1,0값으로 넣기! (안넣으면 nullpoint오류나옴)
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rpage", param.get("rpage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// 검색 됬음을 알려주는 객체
		mv.setViewName("/notice/event_list_search");
		
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
		Map<String, Integer> param = pageService.getNoticeSearchResult(rpage, "notice", noticeService, search_option, keyword);
		
		ArrayList<NoticeVO> list = noticeService.notice_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("listSize", list.size());//검색된 문의글 없으면 표시하기 위해 1,0값으로 넣기! (안넣으면 nullpoint오류나옴)
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rpage", param.get("rpage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// 검색 됬음을 알려주는 객체
		mv.setViewName("/notice/notice_list_search");
		
		return mv;
		
	}

	
	/**
	 *notice_content.do : 공지사항 상세 정보 (이벤트 포함)
	 */
	@RequestMapping(value="/notice_content.do", method=RequestMethod.GET)
	public ModelAndView notice_content( String nid) {
ModelAndView mv = new ModelAndView();
		NoticeVO vo = noticeService.getContent(nid);
		if(vo != null){
			noticeService.getUpdateHits(nid);
		}
		mv.addObject("vo", vo);
		if(vo.getNtag().equals("event")) {
			mv.setViewName("/notice/event_content");	
		}else {
			mv.setViewName("/notice/notice_content");
		}
		return mv;
	}
	
	/**
	 * event_list.do : 이벤트 목록
	 */
	@RequestMapping(value="/event_list.do",method=RequestMethod.GET)
	public ModelAndView event_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Integer> param = pageService.getPageResult(rpage, "event", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.event_getList(param.get("startCount"), param.get("endCount"));
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rpage", param.get("rpage"));
					mv.setViewName("/notice/event_list");
					
			
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
		mv.addObject("rpage", param.get("rpage"));
					mv.setViewName("/notice/notice_list");
					
			
					return mv;
	}
}
