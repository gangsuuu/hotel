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

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.ReplyInquiryVO;
import com.spring.service.FileServiceImpl;
import com.spring.service.InquiryServiceImpl;
import com.spring.service.PageServiceImpl;
import com.spring.service.ReplyInquiryServiceImpl;

@Controller
public class AdminController {

	@Autowired
	private PageServiceImpl pageService;
	
	@Autowired
	private InquiryServiceImpl inquiryService;
	
	@Autowired
	private FileServiceImpl fileService;
		
	@Autowired
	private ReplyInquiryServiceImpl replyinquiryService;
	
	
	/**
	 * 관리자 고객문의 답변 삭제처리
	 * reply_delete_check.do
	 */
	@RequestMapping(value="/reply_delete_check.do", method=RequestMethod.POST)
	public ModelAndView reply_delete_check(String iid, HttpServletRequest request) 
	throws Exception {
		ModelAndView mv = new ModelAndView();
		
		ReplyInquiryVO vo = replyinquiryService.getRiid(iid);
		int result = replyinquiryService.getDelte(iid);
				
		mv.setViewName("redirect:/admin_inquiry_list.do");
		return mv;
	}
	
	
	/**
	 * 관리자 고객문의 답변글 상세보기
	 * ajax : admin_reply_content_json
	 */
	@ResponseBody
	@RequestMapping(value="admin_reply_content_json.do", method=RequestMethod.GET,
			produces="text/plain;charset=UTF-8")
	public String admin_reply_content_json(String iid) {
		
		//System.out.println(iid);
		
		ReplyInquiryVO vo = replyinquiryService.getRiid(iid);
		Gson gson = new Gson();
		JsonObject jobject = new JsonObject();
		if(vo != null) {
			jobject.addProperty("reid", vo.getReid());
			jobject.addProperty("recontent", vo.getRecontent());
			jobject.addProperty("redate", vo.getRedate());
			jobject.addProperty("iid", vo.getIid());
			jobject.addProperty("hcount", vo.getHcount());		
			jobject.addProperty("reply", 1);		
		}else {
			jobject.addProperty("reply", 0);		
			
		}
		
		return gson.toJson(jobject);
		
	}
	
	
	/**
	 * 관리자 고객문의 답변등록 처리
	 */
	@RequestMapping(value="/admin_reply_check.do", method=RequestMethod.POST)
	public ModelAndView admin_reply_check(ReplyInquiryVO vo, HttpServletRequest request) 
													throws Exception {
		ModelAndView mv = new ModelAndView();
			
		//DB 연동
		//1. hotel_inquiry 테이블 저장 --> iid 생성
		int result = replyinquiryService.getWriteResult(vo);
		
		/*if(result == 1) {
			//2. iid값을 가져오기
			//ReplyInquiryVO iid = replyinquiryService.getIid();
			
			//3. iid를 레퍼런스하는 reply_inquiry 테이블 저장

			//int result2 = replyinquiryService.getWriteResult(vo);
			
		}*/		
		
		mv.setViewName("redirect:/admin_inquiry_list.do");
		
		return mv;
	}
	
	
	
	/**
	 * 관리자 고객문의 문의글 수정처리
	 */
	@RequestMapping(value="/admin_inquiry_update_check.do", method=RequestMethod.POST)
	public ModelAndView admin_inquiry_update_check(HotelInquiryVO vo, HttpServletRequest request)
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
			mv.setViewName("redirect:/admin_inquiry_list.do");
		}else {
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
	
	
	/**
	 * 관리자 고객문의 문의글 수정화면
	 */
	@RequestMapping(value="/admin_inquiry_update.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_update(String iid) {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		//System.out.println(vo.getContent());
		
		//DB에 <br/>를 \r\n으로 변경해서 vo에 content에 넣어줘서 보여준다.
		vo.setContent(vo.getContent().replace("<br/>", "\r\n"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_inquiry_update");
		return mv;
	}	
	
	
	/**
	 * 관리자 고객문의 문의글 상세페이지
	 */
	@RequestMapping(value="/admin_inquiry_content.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_content(String iid) {
		ModelAndView mv =  new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_inquiry_content");
		return mv;
	}
	
	
	/**
	 * 관리자 고객문의 문의글 전체 리스트
	 */
	@RequestMapping(value="/admin_inquiry_list.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_list(String rpage) {
		ModelAndView mv = new ModelAndView();
		
		Map<String, Integer> param = pageService.getPageResult(rpage, "inquiry", inquiryService);
		
		ArrayList<HotelInquiryVO> list = inquiryService.getBoardList(param.get("startCount"), param.get("endCount"));
		
		ArrayList<ReplyInquiryVO> reply = replyinquiryService.getIid();
		
		
		mv.addObject("reply", reply);
		mv.addObject("list", list);
		mv.addObject("dbCount", param.get("dbCount"));
		mv.addObject("pageSize", param.get("pageSize"));
		mv.addObject("rpage", param.get("rpage"));		
		mv.setViewName("/admin/admin_inquiry_list");
		
		return mv;
	}
	
	
	
}
