package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.HotelInquiryDAO;
import com.hotel.vo.HotelInquiryVO;

public class InquiryServiceImpl implements InquiryService {

	@Autowired
	private HotelInquiryDAO hotelinquiryDao;
	
	
	/**
	 * ���Ǳ� �˻� �Խù� ���� ���
	 */
	@Override
	public int getSearchCount(String searchlist, String keyword) {
		return hotelinquiryDao.searchCount(searchlist, keyword);
	}
	
	
	/**
	 * ���Ǳ� �˻� ó��
	 */
	@Override
	public ArrayList<HotelInquiryVO> getSearch(int startCount, int endCount, String searchlist, String keyword){
		ArrayList<HotelInquiryVO> list = hotelinquiryDao.search(startCount, endCount, searchlist, keyword);

		return list;
	}
	
	/**
	 * ���Ǳ� �󼼺��� ���üũ
	 */
	@Override
	public int getPassCheck(String iid, String pass) {
		//HotelInquiryDAO dao = new HotelInquiryDAO(); 
		//int result = hotelinquiryDao.passCheck(iid, pass);
		
		return hotelinquiryDao.passCheck(iid, pass);
	}
	
	/**
	 * ���Ǳ� ���� ó��
	 */
	 @Override 
	 public int getDelete(String iid) {	
		return hotelinquiryDao.delete(iid);
	 }
	
	/**
	* ���Ǳ� �� �󼼺���
	*/
	
	@Override 
	public HotelInquiryVO getContent(String iid) { 
		return hotelinquiryDao.select(iid); 
	 }
	 	
	/**
	 * ���Ǳ� ���� ó��
	 */
	
	 @Override 
	 public int getUpdate(HotelInquiryVO vo) { 
		 return hotelinquiryDao.update(vo); 
	  }
	  	
	/**
	 * ���Ǳ� �۾��� ó��
	 */
	@Override 
	public int getWriteResult(HotelInquiryVO vo) { 
		return hotelinquiryDao.insert(vo); 
	}
			 
	/**
	 * ���Ǳ� ��ü �� ��
	 */
	@Override
	public int getTotalCount() {
		return hotelinquiryDao.totalCount();
	}

	/**
	 * �Խ��� ��ü �� ����Ʈ
	 */
	@Override
	public ArrayList<HotelInquiryVO> getBoardList(int startCount, int endCount) {
		ArrayList<HotelInquiryVO> list = hotelinquiryDao.select(startCount, endCount);

		return list;
	}

}