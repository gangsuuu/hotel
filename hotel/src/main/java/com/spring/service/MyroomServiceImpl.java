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
	public List<MyroomVO> getSelect(String mid,int startCount,int endCount) {
		return myroomDao.selectAll(mid,startCount,endCount);
	}

	@Override
	public int getTotalCount(String mid) {
		return myroomDao.totalCount(mid);
	}
	
	@Override
	public int getmyroomDelete(MyroomVO vo) {
		return myroomDao.myroomdelete(vo);
	}


	

}
