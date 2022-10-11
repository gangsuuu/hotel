package com.hotel.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.MyroomVO;

public class MyroomDAO extends DBConn{
	
	String namespace="mapper.myroom";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public List<MyroomVO> selectAll(String mid) {
		return sqlSession.selectList(namespace+".selectAll", mid);
	}

}
