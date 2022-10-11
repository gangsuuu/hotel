package com.spring.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.ReplyInquiryDAO;
import com.hotel.vo.ReplyInquiryVO;

public class ReplyInquiryServiceImpl implements ReplyInquiryService {

	@Autowired
	private ReplyInquiryDAO replyinquiryDao;
	
	
	/**
	 * 문의글 답변 삭제하기
	 */
	public int getDelte(String iid) {
		return replyinquiryDao.delete(iid);
	}
	
	
	/**
	 *  문의글 답변 상세보기
	 */
	public ReplyInquiryVO getRiid(String iid) {
		return replyinquiryDao.select(iid);
	}
	
	
	/**
	 * 문의글 답변쓰기 처리
	 */
	@Override
	public int getWriteResult(ReplyInquiryVO vo) {
		return replyinquiryDao.insert(vo);
	}

	
	/**
	 * 문의글 iid 가져오기
	 */
	@Override
	public ArrayList<ReplyInquiryVO> getIid() {
		return replyinquiryDao.selectIid();
	}
	
	
	
}
