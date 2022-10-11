package com.hotel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public class HotelMemberDAO {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/**
	 * select : ·Î±×ÀÎ
	 */
	public SessionVO select(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.member.login", vo);
	}
	
	
}
