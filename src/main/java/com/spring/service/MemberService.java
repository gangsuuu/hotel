package com.spring.service;

import javax.servlet.http.HttpServletResponse;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	
	int getLoginResult(HotelMemberVO vo); //�α���
	int getJoinResult(HotelMemberVO vo); //ȸ������ 
	int getIdCheck(String mid); // ���̵� �ߺ�üũ
	public void sendEmail(HotelMemberVO vo, String div) throws Exception; //�̸��Ϲ߼�
	public void findPw(HttpServletResponse resp, HotelMemberVO vo) throws Exception; //��й�ȣã��
	SessionVO getLogin(HotelMemberVO vo);//��������
		
}
