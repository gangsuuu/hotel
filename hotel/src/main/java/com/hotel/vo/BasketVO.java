package com.hotel.vo;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class BasketVO {
	
	String bid,brname,bprice,bfile,bsfile;
	String[] allbid;
	int rno;

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public String[] getAllbid() {
		return allbid;
	}

	public void setAllbid(String[] allbid) {
		this.allbid = allbid;
	}

	CommonsMultipartFile file1;
	
	//private List<BasketVO> basketVolist;
	

	/*
	 * public List<BasketVO> getBasketVolist() { return basketVolist; }
	 * 
	 * public void setBasketVolist(List<BasketVO> basketVolist) { this.basketVolist
	 * = basketVolist; }
	 */

	public String getBfile() {
		return bfile;
	}

	public void setBfile(String bfile) {
		this.bfile = bfile;
	}

	public String getBsfile() {
		return bsfile;
	}

	public void setBsfile(String bsfile) {
		this.bsfile = bsfile;
	}

	public CommonsMultipartFile getFile1() {
		return file1;
	}

	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}

	public String getBid() {
		return bid;
	}

	public String getBprice() {
		return bprice;
	}

	public void setBprice(String bprice) {
		this.bprice = bprice;
	}

	public void setBid(String bid) {
		this.bid = bid;
	}

	public String getBrname() {
		return brname;
	}

	public void setBrname(String brname) {
		this.brname = brname;
	}

	
}
