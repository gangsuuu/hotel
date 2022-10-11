package com.hotel.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.hotel.vo.BasketVO;

public interface BasketService {
	
	int getTotalCount();
	int getInsert(BasketVO vo);
	List<BasketVO> getList();
	int getDelete(String bid);
	BasketVO getSelect(String bid);
	int getUpdate(BasketVO vo);
	
	
}
