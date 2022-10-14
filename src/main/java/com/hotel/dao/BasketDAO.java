package com.hotel.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.BasketVO;

public class BasketDAO extends DBConn{
	String namespace="mapper.basket";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	public int totalCount() {
		return sqlSession.selectOne("mapper.basket.totalcount");
	}
	
	
	public List<BasketVO> selectAll(){ 
		
		return sqlSession.selectList(namespace+".selectAll"); 
		
	}
	
	
	public int delete(String bid) {
		return sqlSession.delete(namespace+".delete",bid);
	}
	
	public int insert(BasketVO vo) {
		 
		return sqlSession.insert("mapper.basket.insert", vo);
		
	}
	
	public BasketVO select(String bid) {
		return sqlSession.selectOne(namespace+".select",bid);
	}
	
	public int update(BasketVO vo) {
		return sqlSession.update(namespace+".update",vo);
	}
	
	
	
	
	
}
