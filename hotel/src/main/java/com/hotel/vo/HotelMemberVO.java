package com.hotel.vo;

public class HotelMemberVO {

	String mid, pass, hname, npass,hemail1,hemail2,
	haddr1, haddr2, hp, hpum1, hpum2, hpum3, zonecode,gender,ename1,ename2 ;
	String hemail, pnumber,ename;

	public String getAddr1() {
		return hemail1;
	}

	public void setAddr1(String addr1) {
		this.hemail1 = addr1;
	}

	public String getAdrr2() {
		return hemail2;
	}

	public void setAdrr2(String adrr2) {
		this.hemail2 = adrr2;
	}

	
	public String getNpass() {
		return npass;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getEname1() {
		return ename1;
	}

	public void setEname1(String ename1) {
		this.ename1 = ename1;
	}

	public String getEname2() {
		return ename2;
	}

	public void setEname2(String ename2) {
		this.ename2 = ename2;
	}

	public String getEname() {
		if(ename == null) {
			return ename2+ename1; //변경
		}else {
			return ename;
		}
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public void setNpass(String npass) {
		this.npass = npass;
	}

	
	
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
			return pnumber;
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
		setPnumber(hpum1+hpum2+hpum3);
	}


}
	