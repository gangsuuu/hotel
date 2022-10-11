package com.hotel.service;



import com.hotel.vo.MemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	SessionVO getLogin(MemberVO vo);

}
