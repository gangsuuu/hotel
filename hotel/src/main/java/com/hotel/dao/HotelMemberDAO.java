package com.hotel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public class HotelMemberDAO extends DBConn{


@Autowired
private SqlSessionTemplate sqlSession;
 	
     /*
      * 회원 정보 불러오기
      */
	public HotelMemberVO memberContent(String mid) {
		return sqlSession.selectOne("mapper.hotel.member.memberContent",mid);
	}
    /*
 	 * 프로필수정(마이페이지)
 	 */
	public int memberUpdate(HotelMemberVO vo) {
		return sqlSession.update("mapper.hotel.member.memberUpdate", vo);
	}

    /*
	* 현재비밀번호변경 (마이페이지)
	*/
	public int mbrpassCheck(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.hotel.member.mbrpassCheck", vo);
	}
	/*
  	* 새비밀번호변경 (마이페이지)
  	*/
	public int updateMppw(HotelMemberVO vo) {
		return sqlSession.update("mapper.hotel.member.updateMppw", vo);
	}

	/*
	 * 비밀번호변경 (이메일전송)
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
	 * 회원 조회(name,폰번호)
	 * 
	 */
	public int nameCheck(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.hotel.member.nameCheck", vo);
	}
	/*
	 * 아이디찾기 mid 이메일
	 */
	public HotelMemberVO findId(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.hotel.member.findId", vo);
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
	public SessionVO select(HotelMemberVO vo) {
		
		
		return sqlSession.selectOne("mapper.hotel.member.login",vo);
	}
	
	
	/*
	 * idCheck : 아이디 중복 체크
	 */
	public int idCheck(String mid) {
	
		return sqlSession.selectOne("mapper.hotel.member.idcheck",mid);
		
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










  



















 



