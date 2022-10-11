package com.spring.service;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	//로그인 처리 메서드(DB 연동하는 이름과 다르게 해서 보안을 높인다)
	SessionVO getLoginResult(HotelMemberVO vo);
	
}

