package com.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.HotelSearchVO;
import com.hotel.vo.ReplyInquiryVO;

public class ReplyInquiryDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * 관리자 검색
	 */
	public ArrayList<HotelInquiryVO> search(int startCount, int endCount, String searchlist, String keyword){
		
		HotelSearchVO vo = new HotelSearchVO();
		vo.setStart(startCount);
		vo.setEnd(endCount);
		vo.setSearchlist(searchlist);
		vo.setKeyword(keyword);
		
		List<HotelInquiryVO> list = sqlSession.selectList("mapper.reply.search", vo);
		
		return (ArrayList<HotelInquiryVO>)list;
	}	
	
	
	
	/**
	 * 관리자 답글 삭제하기
	 */
	public int delete(String iid) {
//		int result = 0;
//		String sql = " DELETE FROM REPLY_INQUIRY WHERE IID = ? ";
//		
//		try {
//			getPreparedStatment(sql);
//			pstmt.setString(1, iid);
//			
//			result = pstmt.executeUpdate();
//
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		return sqlSession.delete("mapper.reply.delete",iid);
	}
	
	/**
	 * 관리자 미답변 보기
	 */
	public ArrayList<HotelInquiryVO> select(int startCount, int endCount){
		
		//파라미터를 Map으로 정의
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("start", startCount);
		param.put("end", endCount);
		
		List<HotelInquiryVO> list = sqlSession.selectList("mapper.reply.replynone", param);
		
		return (ArrayList<HotelInquiryVO>)list;
	}
	
	/**
	 * 관리자 답글 상세보기
	 */
	public ReplyInquiryVO select(String iid) {
//		ReplyInquiryVO vo = new ReplyInquiryVO();
//		
//		String sql = " select iid, reid, recontent, redate, hcount from "
//				+ "    (select iid, reid, recontent, redate, count(hcount) hcount from "
//				+ "        (select ri.iid, reid, recontent, redate, hi.iid hcount "
//				+ "        from reply_inquiry ri, hotel_inquiry hi where ri.iid = hi.iid(+)) "
//				+ "    group by iid, reid, recontent, redate) "
//				+ " where iid = ? ";
//		
//		//String sql = " select reid, recontent, redate, iid from reply_inquiry"
//		//		+ " where iid = ? ";
//		
//		try {
//			getPreparedStatment(sql);
//			pstmt.setString(1, iid);
//			rs = pstmt.executeQuery();
//				while(rs.next()) {
//					vo.setIid(rs.getString(1));
//					vo.setReid(rs.getString(2));
//					vo.setRecontent(rs.getString(3));
//					vo.setRedate(rs.getString(4));
//					vo.setHcount(rs.getInt(5));
//				}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		
//		//System.out.println(iid);
		
		return sqlSession.selectOne("mapper.reply.content",iid);
		
	}
	
	/**
	 * 관리자 문의글 idd값 찾기 - 전체 받기
	 */
	public ArrayList<ReplyInquiryVO> selectIid() {
//		ArrayList<ReplyInquiryVO> reply = new ArrayList<ReplyInquiryVO>();
//		ReplyInquiryVO vo = new ReplyInquiryVO();
//		String sql = " select reid, recontent, redate, iid from reply_inquiry ";
//		
//		//System.out.println("확인");
//		
//		try {
//			getPreparedStatment(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				vo.setReid(rs.getString(1));
//				vo.setRecontent(rs.getString(2));
//				vo.setRedate(rs.getString(3));
//				vo.setIid(rs.getString(4));
//					
//				reply.add(vo);
//					
//			}
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		List<ReplyInquiryVO> reply = sqlSession.selectList("mapper.reply.list");
		
		return (ArrayList<ReplyInquiryVO>)reply;
	}
	
	
	
	/**
	 * 관리자 문의글 답변등록
	 */
	public int insert(ReplyInquiryVO vo) {
		
//		int result = 0;
//		String sql = " insert into reply_inquiry values('re_'||sequ_reply_inquiry.nextval, ?, sysdate, ?) ";
//		
//		try {
//			getPreparedStatment(sql);
//			pstmt.setString(1, vo.getRecontent());
//			pstmt.setString(2, vo.getIid());
//			
//			result = pstmt.executeUpdate();
//			
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
		
		return sqlSession.insert("mapper.reply.insert", vo);
	}
	
		
}
