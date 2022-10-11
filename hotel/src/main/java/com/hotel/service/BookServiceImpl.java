package com.hotel.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.BookDAO;
import com.hotel.vo.BookVO;

public class BookServiceImpl implements BookService{
	@Autowired
	private BookDAO bookDao;

	@Override
	public int getInsert(BookVO vo) {
		return bookDao.bookinsert(vo);
	}

}
