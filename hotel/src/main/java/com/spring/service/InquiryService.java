package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.hotel.vo.HotelInquiryVO;

public interface InquiryService {
	
	//문의글 검색 - 게시물 출력
	int getSearchCount(String searchlist, String keyword);
	
	//문의글 검색
	ArrayList<HotelInquiryVO> getSearch(int startCount, int endCount, String searchlist, String keyword);
	
	//문의글 상세보기 비번체크
	int getPassCheck(String iid, String pass);
	
	//문의글 삭제 처리 
	int getDelete(String iid);
	
	//문의글 수정 처리 
	int getUpdate(HotelInquiryVO vo);
	
	//문의글 상세보기 
	HotelInquiryVO getContent(String iid);
	
	//문의글 글쓰기 처리 
	int getWriteResult(HotelInquiryVO vo);
	 
	//문의글 전체 수
	int getTotalCount();
	
	//문의글 전체 리스트
	ArrayList<HotelInquiryVO> getBoardList(int startCount, int endCount);
	
	//본인 문의글 리스트
	List<HotelInquiryVO> getMyList(String mid);
}

