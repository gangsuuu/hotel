package com.hotel.vo;

public class HotelMemberVO {

	String mid, pass, hname, hemail1, hemail2,
	haddr1, haddr2, hp, hpum1, hpum2, hpum3, zonecode;

	String hemail, pnumber;
	
	public void setHemail(String hemail) {
		this.hemail = hemail;
	}

	public String getHemail() {
		return hemail; //변경 
	}

	public String getZonecode() {
		return zonecode;
	}

	public void setZonecode(String zonecode) {
		this.zonecode = zonecode;
	}

	public String getPnumber() {
		if(pnumber == null) {
			return hpum1+"-"+hpum2+"-"+hpum3; //변경
		}else {
			return pnumber;
		}
	}
	public void setPnumber(String pnumber) {
		this.pnumber = pnumber;
	}

	public String getMid() {
		return mid;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	public String getHname() {
		return hname;
	}

	public void setHname(String hname) {
		this.hname = hname;
	}

	public String getHemail1() {
		return hemail1;
	}

	public void setHemail1(String hemail1) {
		this.hemail1 = hemail1;
	}

	public String getHemail2() {
		return hemail2;
	}

	public void setHemail2(String hemail2) {
		this.hemail2 = hemail2;
		setHemail(hemail1+"@"+hemail2);
	}

	public String getHaddr1() {
		return haddr1;
	}

	public void setHaddr1(String haddr1) {
		this.haddr1 = haddr1;
	}

	public String getHaddr2() {
		return haddr2;
	}

	public void setHaddr2(String haddr2) {
		this.haddr2 = haddr2;
	}

	public String getHp() {
		return hp;
	}

	public void setHp(String hp) {
		this.hp = hp;
	}

	public String getHpum1() {
		return hpum1;
	}

	public void setHpum1(String hpum1) {
		this.hpum1 = hpum1;
	}

	public String getHpum2() {
		return hpum2;
	}

	public void setHpum2(String hpum2) {
		this.hpum2 = hpum2;
	}

	public String getHpum3() {
		return hpum3;
	}

	public void setHpum3(String hpum3) {
		this.hpum3 = hpum3;
	}


}
	