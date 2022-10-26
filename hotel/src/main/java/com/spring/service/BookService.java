package com.spring.service;

import com.hotel.vo.BookVO;

public interface BookService {
	int getInsert(BookVO vo);
	int getTotalCount();
}
