package com.spring.service;

import javax.servlet.http.HttpServletResponse;

import com.hotel.vo.HotelMemberVO;

public interface MemberService {
	
	
	int getLoginResult(HotelMemberVO vo); //�α���
	int getJoinResult(HotelMemberVO vo); //ȸ������ 
	int getIdCheck(String hid); // ���̵� �ߺ�üũ
	public void sendEmail(HotelMemberVO vo, String div) throws Exception; //�̸��Ϲ߼�
	public void findPw(HttpServletResponse resp, HotelMemberVO vo) throws Exception; //��й�ȣã��
	
		
}
