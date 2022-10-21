package com.spring.service;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.ReplyInquiryDAO;
import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.ReplyInquiryVO;

public class ReplyInquiryServiceImpl implements ReplyInquiryService {

	@Autowired
	private ReplyInquiryDAO replyinquiryDao;
	
	
	/**
	 * 문의글 검색
	 */
	@Override
	public ArrayList<HotelInquiryVO> getSearch(int startCount, int endCount, String searchlist, String keyword){
		ArrayList<HotelInquiryVO> list = replyinquiryDao.search(startCount, endCount, searchlist, keyword);

		return list;
	}
	
	
	/**
	 * 문의글 답변 삭제하기
	 */
	public int getDelte(String iid) {
		return replyinquiryDao.delete(iid);
	}
	
	
	/**
	 * 미답변 문의글 보기
	 */
	@Override
	public ArrayList<HotelInquiryVO> replynoList(int startCount, int endCount) {
		ArrayList<HotelInquiryVO> list = replyinquiryDao.select(startCount, endCount);

		return list;
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
