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
	 * ������Ʈ�ѷ��� footer�ֱ�
	 * hotel_footer.do ȣ��
	 */
	@RequestMapping(value="/hotel_footer.do", method=RequestMethod.GET)
	public String hotel_footer() {
		return "/hotel_footer";
	}
	
	
	/**
	 * inquiry_list_search.do : ���Ǳ� �˻��ϱ�
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
	 * inquiry_passCheck.do ȣ�� : ���Ǳ� �������� ��й�ȣ üũ
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
	 * inquiry_delete_check.do ȣ�� : ���Ǳ� ����ó��
	 */
	@RequestMapping(value="/inquiry_delete_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_delete_check(String iid, HttpServletRequest request) 
	throws Exception {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		int result = inquiryService.getDelete(iid);
		if(result == 1){
			//�Խñ� ���� ��, upload������ �����ϴ� ������ �ִٸ� �����ϱ�
			fileService.fileDelete(vo, request);
			
			mv.setViewName("redirect:/inquiry_list.do");
		}else{
			mv.setViewName("errorpage");
		}
				
		return mv;
	}
	
	/**
	 * inquiry_update.do ȣ�� : ���Ǳ� ����ȭ��
	 */
	@RequestMapping(value="/inquiry_update.do", method=RequestMethod.GET)
	public ModelAndView inquiry_update(String iid) {
		ModelAndView mv = new ModelAndView();
		
		HotelInquiryVO vo = inquiryService.getContent(iid);
		//System.out.println(vo.getContent());
		
		//DB�� <br/>�� \r\n���� �����ؼ� vo�� content�� �־��༭ �����ش�.
		vo.setContent(vo.getContent().replace("<br/>", "\r\n"));
		
		mv.addObject("vo", vo);
		mv.setViewName("/inquiry/inquiry_update");
		return mv;
	}
	
	/**
	 * inquiry_update_check.do ȣ�� : ���Ǳ� ����ó��
	 */
	@RequestMapping(value="/inquiry_update_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_update_check(HotelInquiryVO vo, HttpServletRequest request)
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
			mv.setViewName("redirect:/inquiry_list.do");
		}else {
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
	
	/**
	 * inquiry_content.do ȣ�� : ���� �󼼺���
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
	 * inquiry_my_list ȣ�� : ��������
	 */
	@RequestMapping(value="/inquiry_my_list.do", method=RequestMethod.GET)
	public String inquiry_my_list() {
		return "/inquiry/inquiry_my_list";
	}
	
	/**
	 * inquiry_list.do ȣ�� : ���Ǳ� ��ü ����Ʈ
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
	 * inquiry_write.do ȣ�� : �����ϱ� �۾��� ȭ��
	 */
	@RequestMapping(value="/inquiry_write.do", method=RequestMethod.GET)
	public String inquiry_write() {
		return "/inquiry/inquiry_write";
	}
	
	/**
	 * inquiry_write_check.do ȣ�� : ���Ǳ� ���� ó��
	 */
	@RequestMapping(value="/inquiry_write_check.do", method=RequestMethod.POST)
	public ModelAndView inquiry_write_check(HotelInquiryVO vo, HttpServletRequest request) 
		throws Exception{
		ModelAndView mv = new ModelAndView();
		
		//1. ������ �ִ��� ���� �� üũ
		vo = fileService.fileCheck(vo);
		int result = inquiryService.getWriteResult(vo);
		
		if(result == 1){
			//2. upload������ ������ �����ϴ� �۾� 
			fileService.fileSave(vo, request);
			
			mv.setViewName("redirect:/inquiry_list.do");
		}else{
			mv.setViewName("errorpage");
		}
		
		return mv;
	}
}
