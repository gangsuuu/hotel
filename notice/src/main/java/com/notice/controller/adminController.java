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
	 * admin_event_list_search.do : 이벤트 검색 기능
	 */
	@RequestMapping(value="admin_event_list_search.do", method=RequestMethod.GET)
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
		mv.addObject("search", "search");									// 검색 됐음을 알려주는 객체
		mv.setViewName("admin/admin_event_list_search");
		
			return mv;
		
	}
	
	
	/**
	 * admin_notice_list_search.do : 공지 검색 기능
	 */
	@RequestMapping(value="admin_notice_list_search.do", method=RequestMethod.GET)
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
		mv.setViewName("admin/admin_notice_list_search");
		
		return mv;
		
	}
	

	/**
	 * admin_event_write_check.do : 이벤트 글쓰기 처리
	 */
	@RequestMapping(value="/admin_event_write_check.do", method=RequestMethod.POST)
	public ModelAndView admin_event_write(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//파일이 선택 되었는지 체크
		vo = fileService.fileCheck(vo);
		
		vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
		
		int result = noticeService.getWriteResult(vo);
		if(result == 1){	
			//파일 있는경우 upload 폴더에 파일 저장
			if(!vo.getNfile().equals("")) {
				//upload 폴더의 경로를 가져오기 위해, HttpServletRequest 객체를 파라미터로 가져옴!
				fileService.fileSave(vo, request);
			}
			mv.setViewName("redirect:/admin_event_list.do");
		}else{
			
			mv.setViewName("error_page");
		}
		
		
		return mv;
		
	}
	
	/**
	 * admin_notice_write_check.do : 공지사항 글쓰기 처리
	 */
	@RequestMapping(value="/admin_notice_write_check.do", method=RequestMethod.POST)
	public ModelAndView admin_notice_write(NoticeVO vo, HttpServletRequest request) 
	throws Exception{
		ModelAndView mv = new ModelAndView();

		//파일이 선택 되었는지 체크
				vo = fileService.fileCheck(vo);
				
				vo.setNcontent(vo.getNcontent().replace("\r\n", "<br>"));
				
				int result = noticeService.getWriteResult(vo);
				if(result == 1){	
					//파일 있는경우 upload 폴더에 파일 저장
					if(!vo.getNfile().equals("")) {
						//upload 폴더의 경로를 가져오기 위해, HttpServletRequest 객체를 파라미터로 가져옴!
						fileService.fileSave(vo, request);
					}
					mv.setViewName("redirect:/admin_notice_list.do");
				}else{

					mv.setViewName("error_page");
				}


				return mv;
	
	}
	
	/**
	 * admin_event_update_check.do : 이벤트 수정 처리
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
			//새로운 파일을 upload 폴더에 저장한 후 기존의 파일 삭제
			fileService.notice_filesave(vo, request, old_filename);

			mv.setViewName("redirect:/admin_event_list.do");
		}else{
			mv.setViewName("error_page");
		}

		return mv;
	}
	
	/**
	 * admin_notice_update_check.do : 공지사항 수정 처리
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
			//새로운 파일을 upload 폴더에 저장한 후 기존의 파일 삭제
			fileService.notice_filesave(vo, request, old_filename);
			
			mv.setViewName("redirect:/admin_notice_list.do");
		}else{
			mv.setViewName("error_page");
		}
		
		return mv;
	}
	
	
	
	/**
	 * admin_event_content.do : 이벤트 상세 정보 
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
	 * admin_notice_content.do : 공지사항 상세 정보 
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
	 * admin_event_update.do : 이벤트 수정화면 
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
	 * admin_notice_update.do : 공지사항 수정화면 
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
	 * admin_event_write.do : 이벤트 글쓰기
	 */
	@RequestMapping(value="/admin_event_write.do" , method=RequestMethod.GET)
	public String admin_event_write() {
		String result =  "admin/admin_event_write";
		return result;
	}
	
	/**
	 * admin_notice_write.do : 공지사항 글쓰기
	 */
	@RequestMapping(value="/admin_notice_write.do" , method=RequestMethod.GET)
	public String admin_notice_write() {
		String result =  "admin/admin_notice_write";
		return result;
	}
	

	/**
	 * admin_event_list.do : 이벤트 목록
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
	 * admin_notice_list.do : 공지사항 목록
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
