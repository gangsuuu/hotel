package com.notice.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.notice.dao.NoticeDAO;
import com.notice.vo.NoticeVO;

@Repository
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;
	
	/**
	 * 조회수 업데이트
	 */
	@Override
	public void getUpdateHits(String nid) {
		noticeDao.updateHits(nid);
	}
	
	/**
	 * event 검색
	 */
	public ArrayList<NoticeVO> event_list_search(int startCount,int endCount,String search_option,String keyword){
		//NoticeDAO dao= new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.event_list_search(startCount, endCount, search_option, keyword);
		
		return list;
		
	}
	/**
	 * notice 검색
	 */
	public ArrayList<NoticeVO> notice_list_search(int startCount,int endCount,String search_option,String keyword){
		//NoticeDAO dao= new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.notice_list_search(startCount, endCount, search_option, keyword);
		
		return list;
		
	}
	
	/**
	 * notice 삭제 처리
	 */
	/*@Override
	public int getDelete(String nid) {
		NoticeDAO dao = new NoticeDAO();
		int result = dao.delete(nid);
		return result;
	}*/
	/**
	 * notice 수정 처리
	 */
	@Override
	public int getUpdate(NoticeVO vo) {
		//NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.update(vo);
		return result;
	}
	/**
	 * notice 글쓰기 처리
	 */
	@Override
	public int getWriteResult(NoticeVO vo) {
		//NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.insert(vo);
		return result;
	}
/**
	 * notice 상세보기
	 */
	@Override
	public NoticeVO getContent(String nid) {
		//NoticeDAO dao = new NoticeDAO();
		NoticeVO vo = noticeDao.select(nid);
		return vo;
	}
	/**
	 * notice 전체 로우수
	 */
	@Override
	public int getTotalCount() {
		NoticeDAO dao = new NoticeDAO();
		int result = noticeDao.totalCount();	//DB에서 가져온 전체 행수
		return result;
	}
	/**
	 * event 전체 리스트
	 */
	@Override
	public ArrayList<NoticeVO> event_getList(int startCount, int endCount){
		//NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.event_select(startCount,endCount);
		return list;
	}
	
	/**
	 * notice 전체 리스트
	 */
	@Override
	public ArrayList<NoticeVO> getList(int startCount, int endCount){
		//NoticeDAO dao = new NoticeDAO();
		ArrayList<NoticeVO> list = noticeDao.select(startCount,endCount);
		return list;
	}
}

