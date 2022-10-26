package com.hotel.dao;



import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.MemberVO;
import com.hotel.vo.SessionVO;

public class MemberDAO extends DBConn{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int totalCount(MemberVO vo) {
		return sqlSession.selectOne("mapper.member.totalcount",vo);
	}

	public SessionVO login(MemberVO vo) {
		return sqlSession.selectOne("mapper.member.login",vo);
	}
}
