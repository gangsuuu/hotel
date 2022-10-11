package com.spring.service;

import java.util.ArrayList;

import com.hotel.vo.ReplyInquiryVO;

public interface ReplyInquiryService {
	
	
	
	//문의글 답변등록 처리 
	int getWriteResult(ReplyInquiryVO vo);
	 
	//문의글 iid값 가져오기
	ArrayList<ReplyInquiryVO> getIid();
	
	//문의글 답변 상세보기 iid
	ReplyInquiryVO getRiid(String iid);

	//문의글 답변 삭제하기 iid
	int getDelte(String iid);
	
	
/*	
	//문의글 상세보기 비번체크
	int getPassCheck(String iid, String pass);
	
	//문의글 삭제 처리 
	int getDelete(String iid);
	
	//문의글 수정 처리 
	int getUpdate(HotelInquiryVO vo);
	
	//문의글 상세보기 
	HotelInquiryVO getContent(String iid);
	
	//문의글 전체 수
	int getTotalCount();
	
	//문의글 전체 리스트
	ArrayList<HotelInquiryVO> getBoardList(int startCount, int endCount);
*/	
}


