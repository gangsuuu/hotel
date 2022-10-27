package com.spring.service;

import javax.servlet.http.HttpServletResponse;

import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public interface MemberService {
	
	/*
	 * 로그인 회원가입
	 */
	// int getLoginResult(HotelMemberVO vo); //로그인
	SessionVO getLoginResult(HotelMemberVO vo); //로그인
	int getJoinResult(HotelMemberVO vo); //회원가입 
	int getIdCheck(String mid); // 아이디 중복체크
	
	/*
	 * 아이디찾기 , 비밀번호 찾기
	 */
	public void sendEmail(HotelMemberVO vo, String div) throws Exception; //이메일발송
	public void sendEmail2(HotelMemberVO vo, String div) throws Exception; //이메일발송2 아이디찾기
	public void findPw(HttpServletResponse resp, HotelMemberVO vo) throws Exception; //비밀번호찾기
	public void findId(HttpServletResponse resp, HotelMemberVO vo) throws Exception; //아이디찾기
	
	/*
	 * 마이페이지
	 */
	int passUpdate(HotelMemberVO vo);//새비밀번호 변경
	int mbrpassCheck(HotelMemberVO vo); //현재비밀번호 체크
	int memberUpdateCheck(HotelMemberVO vo); // 프로필수정 업데이트
	HotelMemberVO getMemberContent(String mid); //회원 상세정보 
	
}
