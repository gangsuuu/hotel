package com.spring.service;

import javax.servlet.http.HttpServletResponse;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	
	int getLoginResult(HotelMemberVO vo); //로그인
	int getJoinResult(HotelMemberVO vo); //회원가입 
	int getIdCheck(String mid); // 아이디 중복체크
	public void sendEmail(HotelMemberVO vo, String div) throws Exception; //이메일발송
	public void findPw(HttpServletResponse resp, HotelMemberVO vo) throws Exception; //비밀번호찾기
	SessionVO getLogin(HotelMemberVO vo);//세션저장
		
}
