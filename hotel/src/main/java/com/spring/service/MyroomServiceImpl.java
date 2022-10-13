package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.MyroomDAO;
import com.hotel.vo.MyroomVO;

public class MyroomServiceImpl implements MyroomService{
	
	@Autowired
	MyroomDAO myroomDao;

	@Override
	public List<MyroomVO> getSelect(String mid) {
		
		return myroomDao.selectAll(mid);
	}

	@Override
	public int getmyroomDelete(List<String> booknum) {
		return 0;
	}

}
