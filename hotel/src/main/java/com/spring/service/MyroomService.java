package com.spring.service;

import java.util.ArrayList;
import java.util.List;

import com.hotel.vo.MyroomVO;

public interface MyroomService {
	
	List<MyroomVO> getSelect(String mid,int startCount, int endCount);
	
	int getmyroomDelete(MyroomVO vo);
	int getTotalCount(String mid);
}
