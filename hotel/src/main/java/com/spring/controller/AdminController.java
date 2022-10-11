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
	 * ������ ������ �亯 ����ó��
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
	 * ������ ������ �亯�� �󼼺���
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
	 * ������ ������ �亯��� ó��
	 */
	@RequestMapping(value="/admin_reply_check.do", method=RequestMethod.POST)
	public ModelAndView admin_reply_check(ReplyInquiryVO vo, HttpServletRequest request) 
													throws Exception {
		ModelAndView mv = new ModelAndView();
			
		//DB ����
		//1. hotel_inquiry ���̺� ���� --> iid ����
		int result = replyinquiryService.getWriteResult(vo);
		
		/*if(result == 1) {
			//2. iid���� ��������
			//ReplyInquiryVO iid = replyinquiryService.getIid();
			
			//3. iid�� ���۷����ϴ� reply_inquiry ���̺� ����

			//int result2 = replyinquiryService.getWriteResult(vo);
			
		}*/		
		
		mv.setViewName("redirect:/admin_inquiry_list.do");
		
		return mv;
	}
	
	
	
	/**
	 * ������ ������ ���Ǳ� ����ó��
	 */
	@RequestMapping(value="/admin_inquiry_update_check.do", method=RequestMethod.POST)
	public ModelAndView admin_inquiry_update_check(HotelInquiryVO vo, HttpServletRequest request)
	throws Exception {
		ModelAndView mv = new ModelAndView();
		
		//���������� �����ϴ� ���, �̸��� ������ ���� - ������ ���� ����!
		String old_filename = vo.getIsfile();
		
		//�����ϰ� �������� �������ֱ�
		vo.setContent(vo.getContent().replace("\r\n","<br/>"));
		
		//���� ��, ���ο������� �����ߴ��� ���ߴ��� Ȯ��
		vo = fileService.fileCheck(vo);
		int result = inquiryService.getUpdate(vo);
		
		if(result == 1) {
			// ���ο� ������ upload������ ����
			fileService.fileSave(vo, request);
			mv.setViewName("redirect:/admin_inquiry_list.do");
		}else {
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
	
	
	/**
	 * ������ ������ ���Ǳ� ����ȭ��
	 */
	@RequestMapping(value="/admin_inquiry_update.do", method=RequestMethod.GET)
	public ModelAndView admin_inquiry_update(String iid) {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		//System.out.println(vo.getContent());
		
		//DB�� <br/>�� \r\n���� �����ؼ� vo�� content�� �־��༭ �����ش�.
		vo.setContent(vo.getContent().replace("<br/>", "\r\n"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/admin/admin_inquiry_update");
		return mv;
	}	
	
	
	/**
	 * ������ ������ ���Ǳ� ��������
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
	 * ������ ������ ���Ǳ� ��ü ����Ʈ
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
