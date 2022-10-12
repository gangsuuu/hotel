package com.hotel.service;

import java.util.ArrayList;
import java.util.List;

import com.hotel.vo.MyroomVO;

public interface MyroomService {
	
	List<MyroomVO> getSelect(String mid);
	int getmyroomDelete(List<String> booknum);

}
