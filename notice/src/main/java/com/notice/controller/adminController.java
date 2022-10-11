package com.notice.controller;

import java.util.ArrayList;
import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.notice.dao.NoticeDAO;
import com.notice.service.FileServiceImpl;
import com.notice.service.NoticeServiceImpl;
import com.notice.vo.NoticeVO;
import com.notice.service.PageServiceImpl;

@Controller
public class adminController {
	
	@Autowired
	private NoticeServiceImpl noticeService;
	@Autowired
	private FileServiceImpl fileService;
	@Autowired
	private PageServiceImpl pageService;


	/**
	 * admin_event_list_search.do : �̺�Ʈ �˻� ���
	 */
	@RequestMapping(value="admin_event_list_search.do", method=RequestMethod.GET)
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
		mv.setViewName("admin/admin_event_list_search");
		
			return mv;
		
	}
	
	
	/**
	 * admin_notice_list_search.do : ���� �˻� ���
	 */
	@RequestMapping(value="admin_notice_list_search.do", method=RequestMethod.GET)
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
		mv.setViewName("admin/admin_notice_list_search");
		
		return mv;
		
	}
	

	/**
	 * admin_event_write_check.do : �̺�Ʈ �۾��� ó��
	 */
	@RequestMapping(value="/admin_event_write_check.do", method=RequestMethod.POST)
	public ModelAndView admin_event_write(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//������ ���� �Ǿ����� üũ
		vo = fileService.fileCheck(vo);
		
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
		
		int result = noticeService.getWriteResult(vo);
		if(result == 1){	
			//���� �ִ°�� upload ������ ���� ����
			if(!vo.getNfile().equals("")) {
				//upload ������ ��θ� �������� ����, HttpServletRequest ��ü�� �Ķ���ͷ� ������!
				fileService.fileSave(vo, request);
			}
			mv.setViewName("redirect:/admin_event_list.do");
		}else{
			
			mv.setViewName("error_page");
		}
		
		
		return mv;
		
	}
	
	/**
	 * admin_notice_write_check.do : �������� �۾��� ó��
	 */
	@RequestMapping(value="/admin_notice_write_check.do", method=RequestMethod.POST)
	public ModelAndView admin_notice_write(NoticeVO vo, HttpServletRequest request) 
	throws Exception{
		ModelAndView mv = new ModelAndView();

		//������ ���� �Ǿ����� üũ
				vo = fileService.fileCheck(vo);
				
				vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
				
				int result = noticeService.getWriteResult(vo);
				if(result == 1){	
					//���� �ִ°�� upload ������ ���� ����
					if(!vo.getNfile().equals("")) {
						//upload ������ ��θ� �������� ����, HttpServletRequest ��ü�� �Ķ���ͷ� ������!
						fileService.fileSave(vo, request);
					}
					mv.setViewName("redirect:/admin_notice_list.do");
				}else{

					mv.setViewName("error_page");
				}


				return mv;
	
	}
	
	/**
	 * admin_event_update_check.do : �̺�Ʈ ���� ó��
	 */
	@RequestMapping(value="/admin_event_update_check.do", method=RequestMethod.POST)
	public ModelAndView admin_event_update_check(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		ModelAndView mv = new ModelAndView();

		String old_filename = vo.getNsfile(); 
		
		vo = fileService.update_fileCheck(vo);
		
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
		
		int result = noticeService.getUpdate(vo);
		if(result ==1){
			//���ο� ������ upload ������ ������ �� ������ ���� ����
			fileService.notice_filesave(vo, request, old_filename);

			mv.setViewName("redirect:/admin_event_list.do");
		}else{
			mv.setViewName("error_page");
		}

		return mv;
	}
	
	/**
	 * admin_notice_update_check.do : �������� ���� ó��
	 */
	@RequestMapping(value="/admin_notice_update_check.do", method=RequestMethod.POST)
	public ModelAndView admin_notice_update_check(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		ModelAndView mv = new ModelAndView();
		
		String old_filename = vo.getNsfile(); 
		
		vo = fileService.update_fileCheck(vo);
		
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
		
		int result = noticeService.getUpdate(vo);
		if(result ==1){
			//���ο� ������ upload ������ ������ �� ������ ���� ����
			fileService.notice_filesave(vo, request, old_filename);
			
			mv.setViewName("redirect:/admin_notice_list.do");
		}else{
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	
	
	/**
	 * admin_event_content.do : �̺�Ʈ �� ���� 
	 */
	@RequestMapping(value="/admin_event_content.do", method=RequestMethod.GET)
	public ModelAndView admin_event_content(String nid) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		if(vo != null){
			noticeService.getUpdateHits(nid);
		}
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_event_content");
		return mv;
	}
	
	/**
	 * admin_notice_content.do : �������� �� ���� 
	 */
	@RequestMapping(value="/admin_notice_content.do", method=RequestMethod.GET)
	public ModelAndView admin_notice_content(String nid) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		if(vo != null){
			noticeService.getUpdateHits(nid);
		}
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_notice_content");
		return mv;
	}
	
	/**
	 * admin_event_update.do : �̺�Ʈ ����ȭ�� 
	 */
	@RequestMapping(value="/admin_event_update.do", method=RequestMethod.GET)
	public ModelAndView admin_event_update(String nid) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		
		vo.setNcontent(vo.getNcontent().replace("<br>","\r\n"));
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_event_update");
		return mv;
	}
	
	/**
	 * admin_notice_update.do : �������� ����ȭ�� 
	 */
	@RequestMapping(value="/admin_notice_update.do", method=RequestMethod.GET)
	public ModelAndView admin_notice_update(String nid) {
		ModelAndView mv = new ModelAndView();
		
		NoticeVO vo = noticeService.getContent(nid);
		
		vo.setNcontent(vo.getNcontent().replace("<br>","\r\n"));
		
		mv.addObject("vo",vo);
		mv.setViewName("/admin/admin_notice_update");
		return mv;
	}
	
	/**
	 * admin_event_write.do : �̺�Ʈ �۾���
	 */
	@RequestMapping(value="/admin_event_write.do" , method=RequestMethod.GET)
	public String admin_event_write() {
		String result =  "admin/admin_event_write";
		return result;
	}
	
	/**
	 * admin_notice_write.do : �������� �۾���
	 */
	@RequestMapping(value="/admin_notice_write.do" , method=RequestMethod.GET)
	public String admin_notice_write() {
		String result =  "admin/admin_notice_write";
		return result;
	}
	

	/**
	 * admin_event_list.do : �̺�Ʈ ���
	 */
	@RequestMapping(value="/admin_event_list.do" , method=RequestMethod.GET)
	ModelAndView admin_event_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.event_getList(param.get("startCount"), param.get("endCount"));
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
		mv.setViewName("admin/admin_event_list");
			
	
			return mv;
	}
	
	/**
	 * admin_notice_list.do : �������� ���
	 */
	@RequestMapping(value="/admin_notice_list.do" , method=RequestMethod.GET)
	ModelAndView admin_notice_list(String rpage) {
		ModelAndView mv = new ModelAndView();

		Map<String, Integer> param = pageService.getPageResult(rpage, "notice", noticeService);
		
		ArrayList<NoticeVO> list = noticeService.getList(param.get("startCount"), param.get("endCount"));
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rPage", param.get("rPage"));
			mv.setViewName("admin/admin_notice_list");
			
	
			return mv;
	}
}
