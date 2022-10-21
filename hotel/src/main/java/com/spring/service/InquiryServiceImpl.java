package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.HotelInquiryDAO;
import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.SessionVO;

public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private HotelInquiryDAO hotelinquiryDao;
	
	/**
	 * 본인 문의글 리스트
	 */
	@Override
	public List<HotelInquiryVO> getMyList(String mid){
		return hotelinquiryDao.myselect(mid);
	}
	
	/**
	 * 문의글 검색 게시물 갯수 출력
	 */
	@Override
	public int getSearchCount(String searchlist, String keyword) {
		return hotelinquiryDao.searchCount(searchlist, keyword);
	}
	
	/**
	 * 나의 문의글 검색 처리 
	 */
	public ArrayList<HotelInquiryVO> getMySearch(String searchlist, String keyword, String mid){
		
		ArrayList<HotelInquiryVO> mlist = hotelinquiryDao.mysearch(searchlist, keyword, mid);
		
		return mlist;
	}
	
	/**
	 * 문의글 검색 처리
	 */
	@Override
	public ArrayList<HotelInquiryVO> getSearch(int startCount, int endCount, String searchlist, String keyword){
		ArrayList<HotelInquiryVO> list = hotelinquiryDao.search(startCount, endCount, searchlist, keyword);

		return list;
	}
	
	/**
	 * 문의글 상세보기 비번체크
	 */
	@Override
	public int getPassCheck(String iid, String pass) {
		//HotelInquiryDAO dao = new HotelInquiryDAO(); 
		//int result = hotelinquiryDao.passCheck(iid, pass);
		
		return hotelinquiryDao.passCheck(iid, pass);
	}
	
	/**
	 * 문의글 삭제 처리
	 */
	 @Override 
	 public int getDelete(String iid) {	
		return hotelinquiryDao.delete(iid);
	 }
	
	/**
	* 문의글 글 상세보기
	*/
	
	@Override 
	public HotelInquiryVO getContent(String iid) { 
		return hotelinquiryDao.select(iid); 
	 }
	 	
	/**
	 * 문의글 수정 처리
	 */
	
	 @Override 
	 public int getUpdate(HotelInquiryVO vo) { 
		 return hotelinquiryDao.update(vo); 
	  }
	  	
	/**
	 * 문의글 글쓰기 처리
	 */
	@Override 
	public int getWriteResult(HotelInquiryVO vo) { 
		return hotelinquiryDao.insert(vo); 
	}
			 
	/**
	 * 문의글 전체 글 수
	 */
	@Override
	public int getTotalCount(HotelInquiryVO vo) {
		return hotelinquiryDao.totalCount(vo);
	}

	/**
	 * 게시판 전체 글 리스트
	 */
	@Override
	public ArrayList<HotelInquiryVO> getBoardList(int startCount, int endCount) {
		ArrayList<HotelInquiryVO> list = hotelinquiryDao.select(startCount, endCount);

		return list;
	}

}
