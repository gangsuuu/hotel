package com.hotel.vo;

public class MyroomVO {
	String mid,bid,radatestart,radateend,price,brname,booknum,bsfile;
	String[] booknumck;
	int rno;
	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	int sday,eday;
	
	public int getSday() {
		return sday;
	}

	public void setSday(int sday) {
		this.sday = sday;
	}

	public int getEday() {
		return eday;
	}

	public void setEday(int eday) {
		this.eday = eday;
	}

	public String[] getBooknumck() {
		return booknumck;
	}

	public String getBsfile() {
		return bsfile;
	}

	public void setBsfile(String bsfile) {
		this.bsfile = bsfile;
	}

	public void setBooknumck(String[] booknumck) {
		this.booknumck = booknumck;
	}

	public String getBooknum() {
		return booknum;
	}

	public void setBooknum(String booknum) {
		this.booknum = booknum;
	}
	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getBid() {
		return bid;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getRadatestart() {
		return radatestart;
	}

	public void setRadatestart(String radatestart) {
		this.radatestart = radatestart;
	}

	public String getRadateend() {
		return radateend;
	}

	public void setRadateend(String radateend) {
		this.radateend = radateend;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public String getBrname() {
		return brname;
	}

	public void setBrname(String brname) {
		this.brname = brname;
	}
	
	
}
