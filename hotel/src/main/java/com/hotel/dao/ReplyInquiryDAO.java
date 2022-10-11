package com.hotel.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.ReplyInquiryVO;

public class ReplyInquiryDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * ������ ��� �����ϱ�
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
	 * ������ ��� �󼼺���
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
	 * ������ ���Ǳ� idd�� ã�� - ��ü �ޱ�
	 */
	public ArrayList<ReplyInquiryVO> selectIid() {
//		ArrayList<ReplyInquiryVO> reply = new ArrayList<ReplyInquiryVO>();
//		ReplyInquiryVO vo = new ReplyInquiryVO();
//		String sql = " select reid, recontent, redate, iid from reply_inquiry ";
//		
//		//System.out.println("Ȯ��");
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
	 * ������ ���Ǳ� �亯���
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
