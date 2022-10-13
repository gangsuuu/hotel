package com.hotel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.HotelMemberVO;

public class HotelMemberDAO extends DBConn{


@Autowired
private SqlSessionTemplate sqlSession;

	/*
	 * ��й�ȣ����
	 */
	public int updatePw(HotelMemberVO vo) {
		return sqlSession.update("mapper.hotel.member.updatePw", vo);
	}
	/*
	 * ȸ�� ��ȸ(���̵�,�̸���)
	 */
	public int memberCheck(HotelMemberVO vo) {
		return sqlSession.selectOne("mapper.hotel.member.memberCheck", vo);
	}

	/*
	 * insert : ȸ������
	 */
	public int insert(HotelMemberVO vo) {
		return sqlSession.insert("mapper.hotel.member.join",vo);	//������̾��id��.dcl("���ӽ����̽�.id��, �Ķ���Ͱ�) ���ۿ��� �޾ƿ´�.
	}
	
	
	/*
	 * select : �α���
	 */
	public int select(HotelMemberVO vo) {
		
		
		return sqlSession.selectOne("mapper.hotel.member.login",vo);
	}
	

	
	/*
	 * idCheck : ���̵� �ߺ� üũ
	 */
	public int idCheck(String hid) {
	
		return sqlSession.selectOne("mapper.hotel.member.idcheck",hid);
		
	}
	
	
	/*
	 * select : �α���
			public int select(HotelMemberVO vo) {
		
		
		return 0; �ʾ�
		
	���̹�Ƽ��
		
		
	/**		
	 *idCheck : ���̵� �ߺ�üũ
	 */
	/*public int idCheck(String id) {
		int result = 0;
		String sql = "select count(id) from cgv_member "
				+ " where id=?";
		
		try {
			getPreparedStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				result = rs.getInt(1);
			}			
			close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	} jdbc
	
	 */
	
	
	
	
}










  



















 



