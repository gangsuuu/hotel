package com.hotel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.dao.BasketDAO;
import com.hotel.vo.BasketVO;

public class BasketServiceImpl implements BasketService{
	
	@Autowired
	private BasketDAO basketDao;
	
	
	
	@Override
	public int getTotalCount() {
		return basketDao.totalCount();
	}

	@Override
	public int getInsert(BasketVO vo) {
		return basketDao.insert(vo);
	}
	
	
	 @Override 
	 public List<BasketVO> getList(){ 
		  return basketDao.selectAll();
	 }
	
	@Override
	public int getDelete(String bid) {
		return basketDao.delete(bid);
	}
	
	@Override
	public BasketVO getSelect(String bid) {
		return basketDao.select(bid);
	}

	@Override
	public int getUpdate(BasketVO vo) {
		return basketDao.update(vo);
	}

	
	 
	
	

}
