package com.hotel.vo;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class NoticeVO {

	String nid, ntag, ntitle, ncontent, nfile, nsfile, ndate, search_option, keyword;
	Integer nhits, rno;
	CommonsMultipartFile file1;

	public String getSearch_option() {
		return search_option;
	}

	public void setSearch_option(String search_option) {
		this.search_option = search_option;
	}

	public CommonsMultipartFile getFile1() {
		return file1;
	}

	public void setFile1(CommonsMultipartFile file1) {
		this.file1 = file1;
	}

	public void setRno(Integer rno) {
		this.rno = rno;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getNid() {
		return nid;
	}

	public void setNid(String nid) {
		this.nid = nid;
	}

	public String getNtag() {
		return ntag;
	}

	public void setNtag(String ntag) {
		this.ntag = ntag;
	}

	public String getNtitle() {
		return ntitle;
	}

	public void setNtitle(String ntitle) {
		this.ntitle = ntitle;
	}

	public String getNcontent() {
		return ncontent;
	}

	public void setNcontent(String ncontent) {
		this.ncontent = ncontent;
	}

	public String getNfile() {
		return nfile;
	}

	public void setNfile(String nfile) {
		this.nfile = nfile;
	}

	public String getNsfile() {
		return nsfile;
	}

	public void setNsfile(String nsfile) {
		this.nsfile = nsfile;
	}

	public String getNdate() {
		return ndate;
	}

	public void setNdate(String ndate) {
		this.ndate = ndate;
	}

	public Integer getNhits() {
		return nhits;
	}

	public void setNhits(Integer nhits) {
		this.nhits = nhits;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}
}
