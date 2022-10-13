package com.hotel.dao;

import java.util.ArrayList;

import com.hotel.vo.HotelListVO;

public class HotelListDAO extends DBConn {
	
	/***********************************************
					0.Public
	 **********************************************/
	/**
	 *  getlogo
	 */
	public String getLogo(String hotelname) {
		String bsfile = "";
		String sql = "select HOTELCONTENTBSFILE from categoricontent where HOTELNAME = ? and HOTELFILEPOSITION = 'logo'";
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, hotelname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bsfile = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bsfile;
	}
	
	/***********************************************
					1.categori
	 **********************************************/
	/**
	 *	getCategori
	 *  hotelname에 따른 
	 *  header부분 카테고리 출력
	 */
	public ArrayList<HotelListVO> getCategori(String hotelname){
		String sql = "select categoriseq, categorigroup, categoridept, categoriname, categoritype, categorinum from hotel_categori where active='active' and hotelname = ? order by categorigroup asc, categoridept desc, categorinum asc";
		ArrayList<HotelListVO> list  = new ArrayList<HotelListVO>();
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, hotelname);
			
			rs = pstmt.executeQuery();
			while(rs.next()){
			HotelListVO vo = new HotelListVO();
			vo.setCategoriseq(rs.getString(1));
			vo.setCategorigroup(rs.getInt(2));
			vo.setCategoridept(rs.getInt(3));
			vo.setCategoriname(rs.getString(4));
			vo.setCategoritype(rs.getString(5));
			vo.setCategorinum(rs.getInt(6));
			list.add(vo);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 *	getHotelStyle
	 *	호텔 css 출력
	 */
	public HotelListVO getHotelStyle(String hotelname) {
		HotelListVO vo =  new HotelListVO();
		String sql = "select hotelcsstype from hotels where hotelname  = ?";
		
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, hotelname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setHotelcsstype(rs.getString(1));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	
	/**
	 *	selecthotelist
	 *	호텔 리스트 출력
	 */
	public ArrayList<HotelListVO> selecthotelist(){
		ArrayList<HotelListVO> list = new  ArrayList<HotelListVO>();
		String sql = "select hotelnum, hotelname, servicecentercall, checkin, checkout, hoteladdress, hotellocation, hotelcsstype from hotels order by hotelnum";
		try {
			getPreparedStatment(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				HotelListVO vo = new HotelListVO();
				vo.setHotelnum(rs.getInt(1));
				vo.setHotelname(rs.getString(2));
				vo.setServicecentercall(rs.getInt(3));
				vo.setCheckin(rs.getString(4));
				vo.setCheckout(rs.getString(5));
				vo.setHoteladdress(rs.getString(6));
				vo.setHotellocation(rs.getString(7));
				vo.setHotelcsstype(rs.getString(8));
				list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 *	selecOnethotelist
	 *	호텔 리스트 출력
	 */
	public HotelListVO selectOnehotelist(String hotelname){
		String sql = "select hotelnum, hotelname, servicecentercall, checkin, checkout, hoteladdress, hotellocation, hotelcsstype from hotels where hotelname = ?";
		HotelListVO vo = new HotelListVO();
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, hotelname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setHotelnum(rs.getInt(1));
				vo.setHotelname(rs.getString(2));
				vo.setServicecentercall(rs.getInt(3));
				vo.setCheckin(rs.getString(4));
				vo.setCheckout(rs.getString(5));
				vo.setHoteladdress(rs.getString(6));
				vo.setHotellocation(rs.getString(7));
				vo.setHotelcsstype(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return vo;
	}
	
	/**
	 * insertMainCategori
	 * 메인 카테고리 생성
	 * 
	 */
	public int insertCategori(HotelListVO vo) {
		int result = 0;
		String sql = "insert into hotel_categori values('c_'||seq_categori_list.nextval,?,?,?,?,?,?,'active')";
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, vo.getHotelname());
			pstmt.setInt(2, vo.getCategorigroup());
			pstmt.setInt(3, vo.getCategoridept());
			pstmt.setString(4, vo.getCategoriname());
			pstmt.setInt(5, vo.getCategorinum());
			pstmt.setString(6, vo.getCategoritype());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 	카테고리 출력
	 */
	public ArrayList<HotelListVO> selectCategoriList() {
		ArrayList<HotelListVO> list = new ArrayList<HotelListVO>();
		String sql = "select categoriseq, hotelname, categorigroup, categoridept,categoriname, categorinum, categoritype, active "
				+ "from hotel_categori order by categorigroup asc, categoridept asc,categorinum asc";
		try {
			getPreparedStatment(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
			HotelListVO vo = new HotelListVO();	
			vo.setCategoriseq(rs.getString(1));
			vo.setHotelname(rs.getString(2));
			vo.setCategorigroup(rs.getInt(3));
			vo.setCategoridept(rs.getInt(4));
			vo.setCategoriname(rs.getString(5));
			vo.setCategorinum(rs.getInt(6));
			vo.setCategoritype(rs.getString(7));
			vo.setActive(rs.getString(8));;
			list.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	/**
	 * categori_delete
	 * 카테고리 삭제
	 */
	public String categori_delete(HotelListVO vo) {
		String result = "";
		String sql; 
		if(vo.getCategoridept() == 1) {
			sql = "delete hotel_categori where categorigroup = ? and hotelname = ? ";
		}else{
			sql = "delete hotel_categori where categoriseq = ?";
		}
		try {
			getPreparedStatment(sql);
			if(vo.getCategoridept() == 1) {
				pstmt.setInt(1, vo.getCategorigroup());
				pstmt.setString(2, vo.getHotelname());
			}else {
				pstmt.setString(1, vo.getCategoriseq());
			}
			
			int success = pstmt.executeUpdate();
			if(success == 1) {
				result = "success";
			}else {
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * categori_del_update
	 * 카테고리 삭제
	 */
	public int categori_del_update(HotelListVO vo) {
		int result = 0;
		String sql; 
		if(vo.getCategoridept() == 1) {
			sql = "update hotel_categori set categorigroup = ? where hotelname = ? and categorigroup = ?";
		}else{
			sql = "update hotel_categori set categorinum = ? where hotelname = ? and categorigroup = ? and categorinum = ? and categoridept = 0";
		}
		try {
			getPreparedStatment(sql);
			if(vo.getCategoridept() == 1) {
				pstmt.setInt(1, vo.getNewcategorigroup());
				pstmt.setString(2, vo.getHotelname());
				pstmt.setInt(3, vo.getCategorigroup());
			}else {
				pstmt.setInt(1,vo.getNewcategorinum());
				pstmt.setString(2, vo.getHotelname());
				pstmt.setInt(3, vo.getCategorigroup());
				pstmt.setInt(4, vo.getCategorinum());
			}
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public int categori_update(HotelListVO vo) {
		int result = 0;
		String sql = "update hotel_categori set categoriname = ?, categorigroup = ?, categorinum = ?, active = ?  where categoriseq = ?"; 
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, vo.getCategoriname());
			pstmt.setInt(2, vo.getCategorigroup());
			pstmt.setInt(3, vo.getCategorinum());
			pstmt.setString(4, vo.getActive());
			pstmt.setString(5, vo.getCategoriseq());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/***********************************************
	  				2.hotel
	 ***********************************************/
	
	/**
	 *	호텔등록 하기 
	 */
	public int insert_hotel(HotelListVO vo) {
		int result = 0;
		String sql = "insert into hotels values(SEQU_hotels.nextval,?,?,?,?,?,?,?)";
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, vo.getHotelname());
			pstmt.setInt(2, vo.getServicecentercall());
			pstmt.setString(3, vo.getCheckin());
			pstmt.setString(4, vo.getCheckout());
			pstmt.setString(5, vo.getHoteladdress());
			pstmt.setString(6, vo.getHotellocation());
			pstmt.setString(7, vo.getHotelcsstype());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/***********************************************
			3.hotel_index_edit
	***********************************************/
	public int editHotelLogo(HotelListVO vo,String type) {
		int result = 0;
		String sql = ""; 
		if(type == "new") {
			sql = "insert into categoricontent values(?,'','logo',?,?,0,'')";
		}else {
			sql = "update categoricontent set hotelcontentfile = ?, hotelcontentbsfile = ? where hotelfileposition = 'logo' and hotelname =?";
		}
		try {
			getPreparedStatment(sql);
			if(type == "new"){
				pstmt.setString(1, vo.getHotelname());
				pstmt.setString(2, vo.getHotelcontentfile());
				pstmt.setString(3, vo.getHotelcontentbsfile());
			}else{
				pstmt.setString(1, vo.getHotelcontentfile());
				pstmt.setString(2, vo.getHotelcontentbsfile());
				pstmt.setString(3, vo.getHotelname());
			}
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
	/**
	 * gethotelindexfiles
	 */
	public ArrayList<HotelListVO> gethotelindexfiles(String hotelname){
		HotelListVO	vo = new HotelListVO();
		ArrayList<HotelListVO> list = new ArrayList<HotelListVO>();
		String sql = "select hotelfileposition, hotelcontentfile, hotelcontentbsfile, hotelcontentfilenum from categoricontent where hotelname = ?";
		try {
			getPreparedStatment(sql);
			pstmt.setString(1, hotelname);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				vo.setHotelfileposition(rs.getString(1));
				vo.setHotelcontentfile(rs.getString(2));
				vo.setHotelcontentbsfile(rs.getString(3));
				vo.setHotelcontentfilenum(rs.getInt(4));
				list.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
}
