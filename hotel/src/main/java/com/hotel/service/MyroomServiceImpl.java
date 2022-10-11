package com.hotel.service;

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

}
