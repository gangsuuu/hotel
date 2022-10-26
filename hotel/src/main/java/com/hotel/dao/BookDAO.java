package com.hotel.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.vo.BookVO;

public class BookDAO extends DBConn{
	String namespace="mapper.book";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int totalCount() {
		return sqlSession.selectOne("mapper.book.totalcount");
	}
	
	public int bookinsert(BookVO vo) {
		
		return sqlSession.insert(namespace+".insert",vo);
	}

}
