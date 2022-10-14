package com.spring.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.ReplyInquiryVO;
import com.spring.service.FileServiceImpl;
import com.spring.service.InquiryServiceImpl;
import com.spring.service.PageServiceImpl;
import com.spring.service.ReplyInquiryServiceImpl;

@Controller
public class InquiryController {

	@Autowired
	private PageServiceImpl pageService;
	
	@Autowired
	private InquiryServiceImpl inquiryService;
	
	@Autowired
	private FileServiceImpl fileService;
	
	@Autowired
	private ReplyInquiryServiceImpl replyinquiryService;
	
	/**
	 * 메인컨트롤러에 footer넣기
	 * hotel_footer.do 호출
	 */
	@RequestMapping(value="/hotel_footer.do", method=RequestMethod.GET)
	public String hotel_footer() {
		return "/hotel_footer";
	}
	
	
	/**
	 * inquiry_list_search.do : 문의글 검색하기
	 */
	@RequestMapping(value="/inquiry_list_search.do", method=RequestMethod.POST)
	public ModelAndView inquiry_list_search(String rpage, String searchlist, String keyword) {
		ModelAndView mv = new ModelAndView();
		
		
		Map<String, Integer> param = pageService.getPageResult(rpage, "inquiry", inquiryService);			
		ArrayList<HotelInquiryVO> list = inquiryService.getSearch(param.get("startCount"),param.get("endCount"), searchlist, keyword);
		
				
		//ArrayList<HotelInquiryVO> list = dao.search(sqlsearch, startCount, endCount, searchlist, keyword);
		
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize",  param.get("pageSize"));
		mv.addObject("rpage", rpage);		
		mv.addObject("searchlist",searchlist);
		mv.addObject("keyword",keyword);
		mv.setViewName("/inquiry/inquiry_list");
				
		return mv;
	}
	
	/**
	 * inquiry_passCheck.do 호출 : 문의글 상세페이지 비밀번호 체크
	 */
	@ResponseBody
	@RequestMapping(value="/inquiry_passCheck.do", method=RequestMethod.GET)
	public String inquiry_passCheck(String iid, String pass) {
		//System.out.println(iid);
		//System.out.println(pass);
		
		int result = inquiryService.getPassCheck(iid, pass);
		String checkedpass ="fail";
		if(result == 1) {
			checkedpass = "ok";
		}
		
		return checkedpass;
	}
	
	
	/**
	 * inquiry_delete_check.do 호출 : 문의글 삭제처리
	 */
	@RequestMapping(value="/inquiry_delete_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_delete_check(String iid, HttpServletRequest request) 
	throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		int result = inquiryService.getDelete(iid);
		if(result == 1){
			//게시글 삭제 시, upload폴더에 존재하는 파일이 있다면 삭제하기
			fileService.fileDelete(vo, request);
			
			mv.setViewName("redirect:/inquiry_list.do");
		}else{
			mv.setViewName("errorpage");
		}
				
		return mv;
	}
	
	/**
	 * inquiry_update.do 호출 : 문의글 수정화면
	 */
	@RequestMapping(value="/inquiry_update.do", method=RequestMethod.GET)
	public ModelAndView inquiry_update(String iid) {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		//System.out.println(vo.getContent());
		
		//DB에 <br/>를 \r\n으로 변경해서 vo에 content에 넣어줘서 보여준다.
		vo.setContent(vo.getContent().replace("<br/>", "\r\n"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/inquiry/inquiry_update");
		return mv;
	}
	
	/**
	 * inquiry_update_check.do 호출 : 문의글 수정처리
	 */
	@RequestMapping(value="/inquiry_update_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_update_check(HotelInquiryVO vo, HttpServletRequest request)
	throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//기존파일이 존재하는 경우, 이름을 변수로 저장 - 맨위에 변수 선언!
		String old_filename = vo.getIsfile();
		
		//수정하고 상세페이지 변경해주기
		vo.setContent(vo.getContent().replace("\r\n","<br/>"));
		
		//수정 시, 새로운파일을 선택했는지 안했는지 확인
		vo = fileService.fileCheck(vo);
		int result = inquiryService.getUpdate(vo);
		
		if(result == 1) {
			// 새로운 파일을 upload폴더에 저장
			fileService.fileSave(vo, request);
			mv.setViewName("redirect:/inquiry_list.do");
		}else {
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
	
	/**
	 * inquiry_content.do 호출 : 문의 상세보기
	 */
	@RequestMapping(value="/inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView inquiry_content(String iid) {
		ModelAndView mv =  new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/inquiry/inquiry_content");
		return mv;
	}
	
	/**
	 * inquiry_my_list 호출 : 내문의함
	 */
	@RequestMapping(value="/inquiry_my_list.do", method=RequestMethod.GET)
	public String inquiry_my_list() {
		return "/inquiry/inquiry_my_list";
	}
	
	/**
	 * inquiry_list.do 호출 : 문의글 전체 리스트
	 */
	@RequestMapping(value="/inquiry_list.do", method=RequestMethod.GET)
	public ModelAndView inquiry_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Integer> param = pageService.getPageResult(rpage, "inquiry", inquiryService);			
		ArrayList<HotelInquiryVO> list = inquiryService.getBoardList(param.get("startCount"), param.get("endCount"));
		
		ArrayList<ReplyInquiryVO> reply = replyinquiryService.getIid();
		
		mv.addObject("reply", reply);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rpage", param.get("rpage"));		
		mv.setViewName("/inquiry/inquiry_list");
		
		return mv;
	}
	
	/**
	 * inquiry_write.do 호출 : 문의하기 글쓰기 화면
	 */
	@RequestMapping(value="/inquiry_write.do", method=RequestMethod.GET)
	public String inquiry_write() {
		return "/inquiry/inquiry_write";
	}
	
	/**
	 * inquiry_write_check.do 호출 : 문의글 쓰기 처리
	 */
	@RequestMapping(value="/inquiry_write_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_write_check(HotelInquiryVO vo, HttpServletRequest request) 
		throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//1. 파일이 있는지 없는 지 체크
		vo = fileService.fileCheck(vo);
		int result = inquiryService.getWriteResult(vo);
		
		if(result == 1){
			//2. upload폴더에 파일을 저장하는 작업 
			fileService.fileSave(vo, request);
			
			mv.setViewName("redirect:/inquiry_list.do");
		}else{
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
}
