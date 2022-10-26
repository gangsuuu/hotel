package com.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.MyroomVO;

public class MyroomDAO extends DBConn{
	
	String namespace="mapper.myroom";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int totalCount(String mid) {
		return sqlSession.selectOne(namespace+".totalcount",mid);
	}
	
	public List<MyroomVO> selectAll(String mid,int startCount, int endCount) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mid", mid);
		param.put("start",String.valueOf(startCount));
		param.put("end", String.valueOf(endCount));
		return sqlSession.selectList(namespace+".selectAll", param);
	}
	
	public int myroomdelete(MyroomVO vo) {
		int count=0;
		for(String bm : vo.getBooknumck()) {
			Map<String,String> param=new HashMap<String, String>();
			param.put("mid", vo.getMid());
			param.put("booknum", bm);
			count=sqlSession.delete(namespace+".deletMyroom", param);
		}
		return count;
	}

}
