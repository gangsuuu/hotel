package com.spring.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.HotelMemberDAO;
import com.hotel.vo.HotelMemberVO;
import com.hotel.vo.SessionVO;

public class MemberServiceImpl implements MemberService {
	
	
	@Autowired
	private HotelMemberDAO hotelMemberDAO; // 서블릿컨텍스트에 다오 객체 생성 오토와이어드로 뿌려주기.
	
	/**
	 * 세션 연동
	 */
	@Override
	public SessionVO getLogin(HotelMemberVO vo) {
		return hotelMemberDAO.login(vo);
	}
	
	/**
	 * 회원가입 
	 */
	@Override
	public int getJoinResult(HotelMemberVO vo) {		
		int result = hotelMemberDAO.insert(vo);
		
		return result;
	}
	/**
	 *  로그인 
	 */
	@Override
	public int getLoginResult(HotelMemberVO vo) {			
		int result = hotelMemberDAO.select(vo);
		
		return result;
	}
	/**
	 *  아이디 중복체크
	 */
	@Override
	public int getIdCheck(String mid) {
		int result = hotelMemberDAO.idCheck(mid);
		
		return result;
	}
	//비밀번호 찾기 이메일발송
	@Override
	public void sendEmail(HotelMemberVO vo, String div) throws Exception {
		
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "서버 이메일 주소(보내는 사람 이메일 주소)";
		String hostSMTPpwd = "서버 이메일 비번(보내는 사람 이메일 비번)";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "admin@hotel.co.kr";
		String fromName = "신라스테이";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "신라스테이 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMid() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += vo.getPass() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = vo.getHemail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //네이버 이용시 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
	}

	//비밀번호찾기
	@Override
	public void findPw(HttpServletResponse response, HotelMemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		int checkresult = hotelMemberDAO.memberCheck(vo);
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if(checkresult == 0) {
			out.print("등록되지 않은 회원입니다.");
			out.close();
		
		}else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			System.out.println(pw);
			vo.setPass(pw);
			// 비밀번호 변경
			hotelMemberDAO.updatePw(vo);
			// 비밀번호 변경 메일 발송
			sendEmail(vo, "findpw");

			out.print("이메일로 임시 비밀번호를 발송하였습니다.");
			out.close();
		}
	}
	
}
