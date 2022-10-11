package com.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.MemberDAO;
import com.hotel.vo.MemberVO;
import com.hotel.vo.SessionVO;

public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberdao;

	@Override
	public SessionVO getLogin(MemberVO vo) {
		return memberdao.login(vo);
	}

}
