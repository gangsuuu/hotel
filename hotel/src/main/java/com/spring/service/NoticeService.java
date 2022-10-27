package com.spring.service;

import java.util.ArrayList;

import org.springframework.stereotype.Service;

import com.hotel.vo.NoticeVO;

@Service
public interface NoticeService {

	void getUpdateHits(String nid); //게시글 업데이트
	ArrayList<NoticeVO> notice_list_search(int startCount,int endCount,String search_option,String keyword);
	ArrayList<NoticeVO> event_list_search(int startCount,int endCount,String search_option,String keyword);
	//public int getDelete(String nid);
	public int getUpdate(NoticeVO vo);
	public int getDelete(NoticeVO vo);
	public int getWriteResult(NoticeVO vo);
	public NoticeVO getContent(String nid);
	public int getNoticeTotalCount();
	public int getEventTotalCount();
	public int getNoticeSearchTotalCount(String search_option, String keyword);
	public int getEventSearchTotalCount(String search_option, String keyword);
	public ArrayList<NoticeVO> getList(int startCount, int endCount);
	public ArrayList<NoticeVO> event_getList(int startCount, int endCount);
	public ArrayList<NoticeVO> getRecentEvent();//최근이벤트
}
