package com.spring.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.dao.NoticeDAO;
import com.hotel.vo.NoticeVO;

@Repository
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;
	
	/**
	 * ��ȸ�� ������Ʈ
	 */
	@Override
	public void getUpdateHits(String nid) {
		noticeDao.updateHits(nid);
	}
	
	/**
	 * event �˻�
	 */
	public ArrayList<NoticeVO> event_list_search(int startCount,int endCount,String search_option,String keyword){
		//NoticeDAO dao= new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.event_list_search(startCount, endCount, search_option, keyword);
		
		return list;
		
	}
	/**
	 * notice �˻�
	 */
	public ArrayList<NoticeVO> notice_list_search(int startCount,int endCount,String search_option,String keyword){
		//NoticeDAO dao= new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.notice_list_search(startCount, endCount, search_option, keyword);
		
		return list;
		
	}
	
	/**
	 * notice ���� ó��
	 */
	@Override
	public int getDelete(NoticeVO vo) {
		//NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.delete(vo);
		return result;
	}
	/**
	 * notice ���� ó��
	 */
	@Override
	public int getUpdate(NoticeVO vo) {
		//NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.update(vo);
		return result;
	}
	/**
	 * notice �۾��� ó��
	 */
	@Override
	public int getWriteResult(NoticeVO vo) {
		//NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.insert(vo);
		return result;
	}
/**
	 * notice �󼼺���
	 */
	@Override
	public NoticeVO getContent(String nid) {
		//NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = noticeDao.select(nid);
		return vo;
	}
	/**
	 * notice ��ü �ο��
	 */
	@Override
	public int getTotalCount() {
		NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.totalCount();	//DB���� ������ ��ü ���
		return result;
	}
	/**
	 * event ��ü ����Ʈ
	 */
	@Override
	public ArrayList<NoticeVO> event_getList(int startCount, int endCount){
		//NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.event_select(startCount,endCount);
		return list;
	}
	
	/**
	 * notice ��ü ����Ʈ
	 */
	@Override
	public ArrayList<NoticeVO> getList(int startCount, int endCount){
		//NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.select(startCount,endCount);
		return list;
	}
}

