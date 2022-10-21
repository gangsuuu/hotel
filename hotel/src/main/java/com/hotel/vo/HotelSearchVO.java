package com.hotel.vo;


public class HotelSearchVO {

	//º¯¼ö
	int start, end;

	String searchlist, keyword, mid;

	
	//gettersetter
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public String getSearchlist() {
		return searchlist;
	}

	public void setSearchlist(String searchlist) {
		this.searchlist = searchlist;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	
}


