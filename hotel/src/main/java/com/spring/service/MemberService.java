package com.spring.service;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	//�α��� ó�� �޼���(DB �����ϴ� �̸��� �ٸ��� �ؼ� ������ ���δ�)
	SessionVO getLoginResult(HotelMemberVO vo);
	
}

