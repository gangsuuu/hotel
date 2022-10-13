package com.hotel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelMemberVO;

public class HotelMemberDAO extends DBConn{


@Autowired
private SqlSessionTemplate sqlSession;

	/*
	 * 비밀번호변경
	 */
	public int updatePw(HotelMemberVO vo) {
		return sqlSession.update("mapper.hotel.member.updatePw", vo);
	}
	/*
	 * 회원 조회(아이디,이메일)
	 */
	public int memberCheck(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.hotel.member.memberCheck", vo);
	}

	/*
	 * insert : 회원가입
	 */
	public int insert(HotelMemberVO vo) {
		return sqlSession.insert("mapper.hotel.member.join",vo);	//오토와이어드id값.dcl("네임스페이스.id값, 파라미터값) 메퍼에서 받아온다.
	}
	
	
	/*
	 * select : 로그인
	 */
	public int select(HotelMemberVO vo) {
		
		
		return sqlSession.selectOne("mapper.hotel.member.login",vo);
	}
	

	
	/*
	 * idCheck : 아이디 중복 체크
	 */
	public int idCheck(String hid) {
	
		return sqlSession.selectOne("mapper.hotel.member.idcheck",hid);
		
	}
	
	
	/*
	 * select : 로그인
			public int select(HotelMemberVO vo) {
		
		
		return 0; 초안
		
	마이바티스
		
		
	/**		
	 *idCheck : 아이디 중복체크
	 */
	/*public int idCheck(String id) {
		int result = 0;
		String sql = "select count(id) from cgv_member "
				+ " where id=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	} jdbc
	
	 */
	
	
	
	
}










  



















 



