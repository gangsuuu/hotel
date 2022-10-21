package com.hotel.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HotelInquiryVO {

	//변수
	int rno, secret, secretnum, rcount;

	String iid, category, title, content, ifile, isfile, idate, hotelname, mid;
	

	//파일
	CommonsMultipartFile file1;

	
	//getter,setter	
	public String getMid() {
		return mid;
	}
	
	public void setMid(String mid) {
		this.mid = mid;
	}
	
	public String getHotelname() {
		return hotelname;
	}
	
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	
	public int getRcount() {
		return rcount;
	}
	
	public void setRcount(int rcount) {
		this.rcount = rcount;
	}
	
	public int getSecret() {
		return secret;
	}
	
	public void setSecret(int secret) {
		this.secret = secret;
	}
	
	public int getRno() {
		return rno;
	}
	
	public void setRno(int rno) {
		this.rno = rno;
	}
	
	public int getSecretnum() {
		return secretnum;
	}
	
	public void setSecretnum(int secretnum) {
		this.secretnum = secretnum;
	}
	
	public String getIid() {
		return iid;
	}
	
	public void setIid(String iid) {
		this.iid = iid;
	}
	
	public String getCategory() {
		return category;
	}
	
	public void setCategory(String category) {
		this.category = category;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
		
	public String getIfile() {
		return ifile;
	}
	
	public void setIfile(String ifile) {
		this.ifile = ifile;
	}
	
	public String getIsfile() {
		return isfile;
	}
	
	public void setIsfile(String isfile) {
		this.isfile = isfile;
	}
	
	public String getIdate() {
		return idate;
	}
	
	public void setIdate(String idate) {
		this.idate = idate;
	}
	
	public CommonsMultipartFile getFile1() {
		return file1;
	}
	
	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}
	
	
	
}


