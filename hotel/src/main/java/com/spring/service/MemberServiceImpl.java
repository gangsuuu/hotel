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
	private HotelMemberDAO hotelMemberDAO; // �������ؽ�Ʈ�� �ٿ� ��ü ���� ������̾��� �ѷ��ֱ�.
	
	/**
	 * ���� ����
	 */
	@Override
	public SessionVO getLogin(HotelMemberVO vo) {
		return hotelMemberDAO.login(vo);
	}
	
	/**
	 * ȸ������ 
	 */
	@Override
	public int getJoinResult(HotelMemberVO vo) {		
		int result = hotelMemberDAO.insert(vo);
		
		return result;
	}
	/**
	 *  �α��� 
	 */
	@Override
	public int getLoginResult(HotelMemberVO vo) {			
		int result = hotelMemberDAO.select(vo);
		
		return result;
	}
	/**
	 *  ���̵� �ߺ�üũ
	 */
	@Override
	public int getIdCheck(String mid) {
		int result = hotelMemberDAO.idCheck(mid);
		
		return result;
	}
	//��й�ȣ ã�� �̸��Ϲ߼�
	@Override
	public void sendEmail(HotelMemberVO vo, String div) throws Exception {
		
		// Mail Server ����
		String charSet = "utf-8";
		String hostSMTP = "smtp.naver.com"; //���̹� �̿�� smtp.naver.com
		String hostSMTPid = "���� �̸��� �ּ�(������ ��� �̸��� �ּ�)";
		String hostSMTPpwd = "���� �̸��� ���(������ ��� �̸��� ���)";

		// ������ ��� EMail, ����, ����
		String fromEmail = "admin@hotel.co.kr";
		String fromName = "�Ŷ�����";
		String subject = "";
		String msg = "";

		if(div.equals("findpw")) {
			subject = "�Ŷ����� �ӽ� ��й�ȣ �Դϴ�.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += vo.getMid() + "���� �ӽ� ��й�ȣ �Դϴ�. ��й�ȣ�� �����Ͽ� ����ϼ���.</h3>";
			msg += "<p>�ӽ� ��й�ȣ : ";
			msg += vo.getPass() + "</p></div>";
		}

		// �޴� ��� E-Mail �ּ�
		String mail = vo.getHemail();
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(587); //���̹� �̿�� 465

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("���Ϲ߼� ���� : " + e);
		}
	}

	//��й�ȣã��
	@Override
	public void findPw(HttpServletResponse response, HotelMemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		int checkresult = hotelMemberDAO.memberCheck(vo);
		PrintWriter out = response.getWriter();
		// ���Ե� ���̵� ������
		if(checkresult == 0) {
			out.print("��ϵ��� ���� ȸ���Դϴ�.");
			out.close();
		
		}else {
			// �ӽ� ��й�ȣ ����
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			System.out.println(pw);
			vo.setPass(pw);
			// ��й�ȣ ����
			hotelMemberDAO.updatePw(vo);
			// ��й�ȣ ���� ���� �߼�
			sendEmail(vo, "findpw");

			out.print("�̸��Ϸ� �ӽ� ��й�ȣ�� �߼��Ͽ����ϴ�.");
			out.close();
		}
	}
	
}
