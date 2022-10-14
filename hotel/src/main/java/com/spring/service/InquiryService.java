package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.hotel.vo.HotelInquiryVO;

public interface InquiryService {
	
	//���Ǳ� �˻� - �Խù� ���
	int getSearchCount(String searchlist, String keyword);
	
	//���Ǳ� �˻�
	ArrayList<HotelInquiryVO> getSearch(int startCount, int endCount, String searchlist, String keyword);
	
	//���Ǳ� �󼼺��� ���üũ
	int getPassCheck(String iid, String pass);
	
	//���Ǳ� ���� ó�� 
	int getDelete(String iid);
	
	//���Ǳ� ���� ó�� 
	int getUpdate(HotelInquiryVO vo);
	
	//���Ǳ� �󼼺��� 
	HotelInquiryVO getContent(String iid);
	
	//���Ǳ� �۾��� ó�� 
	int getWriteResult(HotelInquiryVO vo);
	 
	//���Ǳ� ��ü ��
	int getTotalCount();
	
	//���Ǳ� ��ü ����Ʈ
	ArrayList<HotelInquiryVO> getBoardList(int startCount, int endCount);
	
	//���� ���Ǳ� ����Ʈ
	List<HotelInquiryVO> getMyList(String mid);
}

