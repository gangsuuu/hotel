package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.HotelMemberDAO;
import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private HotelMemberDAO memberDao;
	

	/**
	 * �α��� ó��
	 */
	@Override
	public SessionVO getLoginResult(HotelMemberVO vo) {	
		return memberDao.select(vo);
	}
}
