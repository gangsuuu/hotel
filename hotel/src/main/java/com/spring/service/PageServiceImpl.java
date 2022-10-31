package com.spring.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelInquiryVO;

public class PageServiceImpl {

	@Autowired
	private InquiryServiceImpl inquiryService;
	
	@Autowired
	private NoticeServiceImpl noticeService;

	/***조진희*****/
	
	@Autowired
	private BasketServiceImpl basketService;
	
	@Autowired
	private BookServiceImpl bookService;
	
	@Autowired
	private MyroomServiceImpl myroomService; 
	
	/******* 김수민 ***********/
	
	/**
	 * 페이징 처리
	 */
	public Map<String, Integer> getPageResult(String rpage, String serviceName, Object service) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = 0;	//DB에서 가져온 전체 행수
		
		if(serviceName.equals("inquiry")) {
			HotelInquiryVO vo = new HotelInquiryVO();
			vo.setRcount(0);
			inquiryService = (InquiryServiceImpl)service;
			dbCount = inquiryService.getTotalCount(vo);
			//pageSize=10; 여기서 페이지 사이즈 조절도 가능하다.
		
		}else if(serviceName.equals("notice")) {
			noticeService = (NoticeServiceImpl)service;
			dbCount = noticeService.getNoticeTotalCount();
			pageSize = 10;
		}else if(serviceName.equals("event")) {
			noticeService = (NoticeServiceImpl)service;
			dbCount = noticeService.getEventTotalCount();
			pageSize = 10;
		}else if(serviceName.equals("inquiry_replyno")) {
			HotelInquiryVO vo = new HotelInquiryVO();
			vo.setRcount(1);
			inquiryService = (InquiryServiceImpl)service;
			dbCount = inquiryService.getTotalCount(vo);
		}else if(serviceName.equals("basket")) {
			basketService = (BasketServiceImpl)service;
			dbCount = basketService.getTotalCount();
		}else if(serviceName.equals("book")) {
			bookService = (BookServiceImpl)service;
			dbCount = bookService.getTotalCount();
		}
				
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
				
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		//리턴타입인 Map에 데이터를 추가
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("rpage", reqPage);
		param.put("pageCount", pageCount);
		
		return param;
	}
	
	/**
	 * 마이 페이징 처리
	 */
	public Map<String, Integer> getMyPageResult(String rpage, String serviceName, Object service, String mid) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = 0;	//DB에서 가져온 전체 행수
		
		if(serviceName.equals("inquiry")) {
			HotelInquiryVO vo = new HotelInquiryVO();
			vo.setRcount(0);
			inquiryService = (InquiryServiceImpl)service;
			dbCount = inquiryService.getTotalCount(vo);
			//pageSize=10; 여기서 페이지 사이즈 조절도 가능하다.
		
		}else if(serviceName.equals("inquiry_replyno")) {
			HotelInquiryVO vo = new HotelInquiryVO();
			vo.setRcount(1);
			inquiryService = (InquiryServiceImpl)service;
			dbCount = inquiryService.getTotalCount(vo);
		}else if(serviceName.equals("myinquiry")) {
			inquiryService = (InquiryServiceImpl)service;
			dbCount = inquiryService.getMyCount(mid);
		}
				
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
				
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		//리턴타입인 Map에 데이터를 추가
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("rpage", reqPage);
		param.put("pageCount", pageCount);
		
		return param;
	}
	
	
	/******* 조진희 ***********/
	
	
	/**
	 * 페이징 처리
	 */
	public Map<String, Integer> getPageResult(String rpage, String serviceName, Object service,String mid) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 4;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = 0;	//DB에서 가져온 전체 행수
	
		if(serviceName.equals("myroom")) {
			myroomService = (MyroomServiceImpl)service;
			dbCount = myroomService.getTotalCount(mid);
		}
		
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
			pageCount = dbCount/pageSize;
		}else{
			pageCount = dbCount/pageSize+1;
		}
		
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		//리턴타입인 map에 데이터 추가
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("rpage", reqPage);
		param.put("pageCount", pageCount);
		
		return param;
		
	}
	
	/**
	 * 김민재
	 */
	public Map<String, Integer> getNoticeSearchResult(String rpage, String serviceName, Object service, String search_option, String keyword) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		
		//페이징 처리 - startCount, endCount 구하기
		int startCount = 0;
		int endCount = 0;
		int pageSize = 7;	//한페이지당 게시물 수
		int reqPage = 1;	//요청페이지	
		int pageCount = 1;	//전체 페이지 수
		int dbCount = 0;	//DB에서 가져온 전체 행수
		
		if(serviceName.equals("notice")) {
			noticeService = (NoticeServiceImpl)service;
			dbCount = noticeService.getNoticeSearchTotalCount(search_option, keyword);
			pageSize = 10;
		}else if(serviceName.equals("event")) {
			noticeService = (NoticeServiceImpl)service;
			dbCount = noticeService.getEventSearchTotalCount(search_option, keyword);
			pageSize = 10;
		}
				
		//총 페이지 수 계산
		if(dbCount % pageSize == 0){
				pageCount = dbCount/pageSize;
			}else{
				pageCount = dbCount/pageSize+1;
			}
				
		//요청 페이지 계산
		if(rpage != null){
			reqPage = Integer.parseInt(rpage);
			startCount = (reqPage-1) * pageSize+1;
			endCount = reqPage *pageSize;
		}else{
			startCount = 1;
			endCount = pageSize;
		}
		
		//리턴타입인 Map에 데이터를 추가
		param.put("startCount", startCount);
		param.put("endCount", endCount);
		param.put("dbCount", dbCount);
		param.put("pageSize", pageSize);
		param.put("rpage", reqPage);
		param.put("pageCount", pageCount);
		
		return param;
	}
	
}

