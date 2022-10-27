package com.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hotel.vo.NoticeVO;


@Repository
public class NoticeDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 최근 이벤트 3건
	 */
	public ArrayList<NoticeVO> getRecentEvent(){
		List<NoticeVO> list = sqlSession.selectList("mapper.notice.revent");
		return (ArrayList<NoticeVO>)list;
	}
	
	
	/**
	 * insert : 공지사항 글쓰기 
	 */
	
	public int insert(NoticeVO vo) {
		return sqlSession.insert("mapper.notice.insert", vo);
	}
	
	/**
	 * update : 공지사항 업데이트 
	 */
	public int update(NoticeVO vo) {
		return sqlSession.update("mapper.notice.update", vo);
	}
	
	/**
	 * delete : 공지사항 업데이트 
	 */
	public int delete(NoticeVO vo) {
		return sqlSession.delete("mapper.notice.delete", vo);
	}	
	
	/**
	 * select : 공지사항 상세보기
	 */
	public NoticeVO select(String nid) {
		return sqlSession.selectOne("mapper.notice.content", nid);
	}
	
	/**
	 * notice_list : 공지사항 리스트
	 */
	
	public ArrayList<NoticeVO> select(int startCount, int endCount) {
		
		
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<NoticeVO> list = sqlSession.selectList("mapper.notice.notice_list", param);
		return (ArrayList<NoticeVO>)list;
	}
	/**
	 * event_list : 이벤트 리스트
	 */
	
	public ArrayList<NoticeVO> event_select(int startCount, int endCount) {
		
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<NoticeVO> list = sqlSession.selectList("mapper.notice.event_list", param);
		return (ArrayList<NoticeVO>)list;
	}
	
	/**
	 * noticesearchtotalCount : 공지 검색 페이징 처리 게시물 총 갯수
	 */
	public int noticeSearchTotalCount(String search_option, String keyword) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("search_option", String.valueOf(search_option));
		param.put("keyword", String.valueOf(keyword));
		

		return sqlSession.selectOne("mapper.notice.noticesearchtotalcount",param);
	}
	/**
	 * eventsearchtotalCount : 이벤트 검색 페이징 처리 게시물 총 갯수
	 */
	public int eventSearchTotalCount(String search_option, String keyword) {
		Map<String,String> param = new HashMap<String,String>();
		param.put("search_option", String.valueOf(search_option));
		param.put("keyword", String.valueOf(keyword));
		

		return sqlSession.selectOne("mapper.notice.eventsearchtotalcount",param);
	}
	/**
	 * noticetotalCount : 공지 페이징 처리 게시물 총 갯수
	 */
	public int noticeTotalCount() {
		return sqlSession.selectOne("mapper.notice.noticetotalcount");
	}
	/**
	 * eventtotalCount : 이벤트 페이징 처리 게시물 총 갯수
	 */
	public int eventTotalCount() {
		return sqlSession.selectOne("mapper.notice.eventtotalcount");
	}
	/**
	 * updateHits : 조회수 업데이트
	 */
	public int updateHits(String nid) {
		
		return sqlSession.update("mapper.notice.updatehits",nid);
	}
	
	/**
	 * notice_search : 검색 기능
	 */
	public ArrayList<NoticeVO> notice_list_search(int startCount, int endCount, String search_option, String keyword) {
		
		//Map 타입의 객체를 생성하고 start, end라는 키이름으로 파라미터를 넘긴다.
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("search_option", String.valueOf(search_option));
		param.put("keyword", String.valueOf(keyword));
		

		List<NoticeVO> list = sqlSession.selectList("mapper.notice.notice_search",param);
		return (ArrayList<NoticeVO>)list;
	}
	/**
	 * event_search : 검색 기능
	 */
	public ArrayList<NoticeVO> event_list_search(int startCount, int endCount, String search_option, String keyword) {
		
		//Map 타입의 객체를 생성하고 start, end라는 키이름으로 파라미터를 넘긴다.
		Map<String,String> param = new HashMap<String,String>();
		param.put("start", String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		param.put("search_option", String.valueOf(search_option));
		param.put("keyword", String.valueOf(keyword));


		List<NoticeVO> list = sqlSession.selectList("mapper.notice.event_search",param);
		return (ArrayList<NoticeVO>)list;
	}
}