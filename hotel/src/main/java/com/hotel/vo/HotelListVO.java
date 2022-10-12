package com.hotel.vo;

import java.io.File;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class HotelListVO {
	
	String hotelname,checkin,checkout,hoteladdress,hotellocation,hotelcsstype;
	int hotelnum,servicecentercall;
	
	public String getHotelname() {
		return hotelname;
	}
	public void setHotelname(String hotelname) {
		this.hotelname = hotelname;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public String getHoteladdress() {
		return hoteladdress;
	}
	public void setHoteladdress(String hoteladdress) {
		this.hoteladdress = hoteladdress;
	}
	public String getHotellocation() {
		return hotellocation;
	}
	public void setHotellocation(String hotellocation) {
		this.hotellocation = hotellocation;
	}
	public String getHotelcsstype() {
		return hotelcsstype;
	}
	public void setHotelcsstype(String hotelcsstype) {
		this.hotelcsstype = hotelcsstype;
	}
	public int getHotelnum() {
		return hotelnum;
	}
	public void setHotelnum(int hotelnum) {
		this.hotelnum = hotelnum;
	}
	public int getServicecentercall() {
		return servicecentercall;
	}
	public void setServicecentercall(int servicecentercall) {
		this.servicecentercall = servicecentercall;
	}
	
	public String getCategoriseq() {
		return categoriseq;
	}
	public void setCategoriseq(String categoriseq) {
		this.categoriseq = categoriseq;
	}

	String categoriname,active,categoritype,categoriseq;
	int categoridept,categorinum,categorigroup,newcategorinum,newcategorigroup;

	public int getNewcategorinum() {
		return newcategorinum;
	}
	public void setNewcategorinum(int newcategorinum) {
		this.newcategorinum = newcategorinum;
	}
	public int getNewcategorigroup() {
		return newcategorigroup;
	}
	public void setNewcategorigroup(int newcategorigroup) {
		this.newcategorigroup = newcategorigroup;
	}
	public int getCategorigroup() {
		return categorigroup;
	}
	public void setCategorigroup(int categorigroup) {
		this.categorigroup = categorigroup;
	}
	public String getCategoritype() {
		return categoritype;
	}
	public void setCategoritype(String categoritype) {
		this.categoritype = categoritype;
	}
	public String getCategoriname() {
		return categoriname;
	}
	public void setCategoriname(String categoriname) {
		this.categoriname = categoriname;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public int getCategoridept() {
		return categoridept;
	}
	public void setCategoridept(int categoridept) {
		this.categoridept = categoridept;
	}
	public int getCategorinum() {
		return categorinum;
	}
	public void setCategorinum(int categorinum) {
		this.categorinum = categorinum;
	}
	
	String hotelfileposition, hotelcontentfile, hotelcontentbsfile, categoricontent;
	int hotelcontentfilenum;
	CommonsMultipartFile categorifile1;

	public String getHotelfileposition() {
		return hotelfileposition;
	}
	public void setHotelfileposition(String hotelfileposition) {
		this.hotelfileposition = hotelfileposition;
	}
	public String getHotelcontentfile() {
		return hotelcontentfile;
	}
	public void setHotelcontentfile(String hotelcontentfile) {
		this.hotelcontentfile = hotelcontentfile;
	}
	public String getHotelcontentbsfile() {
		return hotelcontentbsfile;
	}
	public void setHotelcontentbsfile(String hotelcontentbsfile) {
		this.hotelcontentbsfile = hotelcontentbsfile;
	}
	public String getCategoricontent() {
		return categoricontent;
	}
	public void setCategoricontent(String categoricontent) {
		this.categoricontent = categoricontent;
	}
	public int getHotelcontentfilenum() {
		return hotelcontentfilenum;
	}
	public void setHotelcontentfilenum(int hotelcontentfilenum) {
		this.hotelcontentfilenum = hotelcontentfilenum;
	}
	public CommonsMultipartFile getCategorifile1() {
		return categorifile1;
	}
	public void setCategorifile1(CommonsMultipartFile categorifile1) {
		this.categorifile1 = categorifile1;
	}
	
	
	
}
