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
	 * event_list_search.do : �̺�Ʈ �˻� ���
	 */
	@RequestMapping(value="event_list_search.do", method=RequestMethod.GET)
		public ModelAndView event_list_search(String rpage,
				@RequestParam(defaultValue="ntitle") String search_option, //�⺻ �˻� �ɼǰ� ����
				@RequestParam(defaultValue="") String keyword //Ű���� �⺻�� ����
				)throws Exception {

		ModelAndView mv = new ModelAndView();
		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.event_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// �˻� ������ �˷��ִ� ��ü
		mv.setViewName("event_list_search");
		
			return mv;
		
	}
	/**
	 * notice_list_search.do : ���� �˻� ���
	 */
	@RequestMapping(value="notice_list_search.do", method=RequestMethod.GET)
	public ModelAndView notice_list_search(String rpage,
			@RequestParam(defaultValue="ntitle") String search_option, //�⺻ �˻� �ɼǰ� ����
			@RequestParam(defaultValue="") String keyword //Ű���� �⺻�� ����
			)throws Exception {
		
		ModelAndView mv = new ModelAndView();
		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.notice_list_search(param.get("startCount"), param.get("endCount"), search_option, keyword);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
		mv.addObject("keyword",keyword);
		mv.addObject("search", "search");									// �˻� ������ �˷��ִ� ��ü
		mv.setViewName("notice_list_search");
		
		return mv;
		
	}
	
		
	
	
	/**
	 *notice_content.do : �̺�Ʈ �� ���� 
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
	 *notice_content.do : �������� �� ���� 
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
	 * event_list.do : �̺�Ʈ ���
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
	 * notice_list.do : �������� ���
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
