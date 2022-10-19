package com.spring.controller;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hotel.dao.HotelListDAO;
import com.hotel.vo.HotelListVO;


@Controller
public class PublicController {
	
	/**
	 *  header.do
	 */
	@RequestMapping(value="/header.do",method=RequestMethod.GET)
	public String header() {
		return "header";
	}
	
	/**
	 *  /shllastya/hotelinfo.do
	 */
	@RequestMapping(value="/shillaStay/hotelinfo.do",method=RequestMethod.GET)
	public String shllastya_hotelinfo() {
		return "footerpage/hotelinfo";
	}
	
	/**
	 *  /shllastya/hotelMap.do
	 */
	@RequestMapping(value="/shillaStay/hotelMap.do",method=RequestMethod.GET)
	public String hotelmap() {
		return "footerpage/hotelmap";
	}
	
	/**
	 *  footer.do
	 */
	@RequestMapping(value="/shillaStay/hotellocation.do",method=RequestMethod.GET)
	public String hotellocation() {
		return "footerpage/location";
	}
	
	/**
	 *  footer.do
	 */
	@RequestMapping(value="/shillaStay/gallery.do",method=RequestMethod.GET)
	public String hotelgallery() {
		return "footerpage/gallery";	
	}
	
	/**
	 *  footer.do
	 */
	@RequestMapping(value="/footer.do",method=RequestMethod.GET)
	public String footer() {
		return "footer";
	}
	
	
	
	
	
	
	
	
	
	
	/**
	 * header_gethotellist
	 * 호텔리스트 출력
	 */
	@ResponseBody
	@RequestMapping(value="/header_gethotellist.do",method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String header_gethotellist() {
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		JsonArray jarray  = new JsonArray();
		Gson  gson =  new Gson();
		ArrayList<HotelListVO> list = dao.selecthotelist();
		for(HotelListVO vo : list){
			JsonObject jo = new JsonObject();
			jo.addProperty("hotelnum", vo.getHotelnum());
			jo.addProperty("hotelname",vo.getHotelname());
			jo.addProperty("servicecentercall",vo.getServicecentercall());
			jo.addProperty("checkin",vo.getCheckin());
			jo.addProperty("checkout",vo.getCheckout());
			jo.addProperty("hoteladdress",vo.getHoteladdress());
			jo.addProperty("hotellocation",vo.getHotellocation());
			jo.addProperty("hotelcsstype",vo.getHotelcsstype());
			jarray.add(jo);			
		}//for end
		jobject.add("hotellist", jarray);
		return gson.toJson(jobject); 
	}
	/**
	 * header_getCategori
	 * 공통으로 들어가는 헤더에서 호텔에 따른 출력
	 */
	@ResponseBody
	@RequestMapping(value="/header_getCategori.do",method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String header_getCategori(String hotelname){
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		JsonArray jarray  = new JsonArray();
		Gson  gson =  new Gson();
		
		ArrayList<HotelListVO> list = dao.getCategori(hotelname);
		String logoSrc = dao.getLogo(hotelname);
		for(HotelListVO vo : list){
			JsonObject jo = new JsonObject();
			jo.addProperty("categoriseq", vo.getCategoriseq());
			jo.addProperty("categorigroup",vo.getCategorigroup());
			jo.addProperty("categoridept",vo.getCategoridept());
			jo.addProperty("categoriname",vo.getCategoriname());
			jo.addProperty("categoritype",vo.getCategoritype());
			jo.addProperty("categorinum",vo.getCategorinum());
			jarray.add(jo);			
		}//for end
		HotelListVO vo = new HotelListVO();
		vo = dao.getHotelStyle(hotelname);
		jobject.addProperty("logoSrc", logoSrc);
		jobject.addProperty("style", vo.getHotelcsstype());
		jobject.add("categori", jarray);
		return gson.toJson(jobject); 
	}
	/**
	 *  getcategorimenu.do
	 *  카테고리 리스트 얻기
	 */
	@RequestMapping(value="/getcategorimenu.do",method= RequestMethod.GET,produces="application/text; charset=UTF-8")
	public String getcategorimenu(String hotelname) {
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		JsonArray jarray  = new JsonArray();
		Gson  gson =  new Gson();
		ArrayList<HotelListVO> list = dao.getCategori(hotelname);
		for(HotelListVO vo : list){
			JsonObject jo = new JsonObject();
			jo.addProperty("categoriseq", vo.getCategoriseq());
			jo.addProperty("categorigroup",vo.getCategorigroup());
			jo.addProperty("categoridept",vo.getCategoridept());
			jo.addProperty("categoriname",vo.getCategoriname());
			jo.addProperty("categoritype",vo.getCategoritype());
			jo.addProperty("categorinum",vo.getCategorinum());
			jarray.add(jo);			
		}//for end
		HotelListVO vo = new HotelListVO();
		vo = dao.getHotelStyle(hotelname);
		jobject.addProperty("style", vo.getHotelcsstype());
		jobject.add("categori", jarray);
		return gson.toJson(jobject); 
	}
	
	/**
	 * footer_gethotellist
	 * 호텔리스트 출력
	 */
	@ResponseBody
	@RequestMapping(value="/footer_gethotellist.do",method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String footer_gethotellist(String hotelname) {
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		Gson  gson =  new Gson();
		HotelListVO vo = dao.selectOnehotelist(hotelname);
			jobject.addProperty("hotelnum", vo.getHotelnum());
			jobject.addProperty("hotelname",vo.getHotelname());
			jobject.addProperty("servicecentercall",vo.getServicecentercall());
			jobject.addProperty("checkin",vo.getCheckin());
			jobject.addProperty("checkout",vo.getCheckout());
			jobject.addProperty("hoteladdress",vo.getHoteladdress());
			jobject.addProperty("hotellocation",vo.getHotellocation());
			jobject.addProperty("hotelcsstype",vo.getHotelcsstype());
		return gson.toJson(jobject); 
	}
	/**
	 * getLogo.do
	 */
	
	
}
