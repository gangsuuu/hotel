package com.hotel.vo;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.hotel.dao.HotelListDAO;



@Controller
public class AdminController {
	
	/************************************************************
	 						admin categori
	 ***********************************************************/
	@RequestMapping(value="/admin_hotel_categori.do",method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public ModelAndView admin_hotel_categori() {
		ModelAndView mv = new ModelAndView();
		HotelListDAO dao = new HotelListDAO();
		ArrayList<HotelListVO> list = dao.selecthotelist();
		
		mv.addObject("list",list);
		mv.setViewName("admin/Categori");
		return mv;
	}
	
	/**
	 * admin_categorilist.do
	 */
	@ResponseBody
	@RequestMapping(value="/admin_categorilist.do",method=RequestMethod.GET, produces="application/text; charset=UTF-8")
	public String admin_categorilist() {
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		JsonArray jarray = new JsonArray();
		Gson gson = new Gson();
		ArrayList<HotelListVO> list = dao.selectCategoriList();
		for(HotelListVO vo : list) {
			JsonObject jo = new JsonObject();
			jo.addProperty("categoriseq",vo.getCategoriseq());
			jo.addProperty("hotelname",vo.getHotelname());
			jo.addProperty("categorigroup",vo.getCategorigroup());
			jo.addProperty("categoridept",vo.getCategoridept());
			jo.addProperty("categoriname",vo.getCategoriname());
			jo.addProperty("categorinum",vo.getCategorinum());
			jo.addProperty("active",vo.getActive());
			jo.addProperty("type",vo.getCategoritype());
			jarray.add(jo);
		}
		jobject.add("categori",jarray);
		return gson.toJson(jobject);
	}
	
	/**
	 * categori_edit_insert
	 * 뉴카테고리 등록
	 */
	@ResponseBody
	@RequestMapping(value="/admin_categori_insert.do")
	public HashMap<String, Object> categori_edit_insert(@RequestParam String data) throws Exception{
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		 ArrayList<HashMap<String, String>> list 
         = new ArrayList<HashMap<String,String>>(); 
		
		list = mapper.readValue(data, new TypeReference<ArrayList<HashMap<String,String>>>() {});
		if(list.size() == 0) {
			result.put("empty", "empty");
		}else{
			int insert_result;
			for(int i = 0; i < list.size(); i++) {
				//System.err.println("list순서 "+i+" 번째");
				HashMap<String,String> test = list.get(i);
				HotelListVO vo = new HotelListVO();
				vo.setHotelname(test.get("hotelname"));
				vo.setCategoridept(Integer.parseInt(test.get("categoridept")));
				vo.setCategorigroup(Integer.parseInt((test.get("categorigroup"))));
				vo.setCategoriname(test.get("categoriname"));
				vo.setCategorinum(Integer.parseInt(test.get("categorinum")));
				vo.setCategoritype(test.get("categoritype"));
				
				HotelListDAO dao = new HotelListDAO();
				
				insert_result = dao.insertCategori(vo);
			}
		}
		return result;
	}
	
	/**
	 * admin_categori_update
	 * 뉴카테고리 등록
	 */
	@ResponseBody
	@RequestMapping(value="/admin_categori_update.do")
	public HashMap<String, Object> admin_categori_update(@RequestParam String data) throws Exception{
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		ObjectMapper mapper = new ObjectMapper();
		
		ArrayList<HashMap<String, String>> list 
		= new ArrayList<HashMap<String,String>>(); 
		
		list = mapper.readValue(data, new TypeReference<ArrayList<HashMap<String,String>>>() {});
		
		if(list.size() == 0) {
			result.put("empty", "empty");
		}else{
			int insert_result;
			for(int i = 0; i < list.size(); i++) {
				HashMap<String,String> test = list.get(i);
				HotelListVO vo = new HotelListVO();
				
				
				vo.setCategorigroup(Integer.parseInt(test.get("categorigroup")));
				vo.setCategorinum(Integer.parseInt(test.get("categorinum")));
				vo.setCategoriname(test.get("categoriname"));
				vo.setActive(test.get("active"));
				vo.setCategoriseq(test.get("categoriseq"));
				
				HotelListDAO dao = new HotelListDAO();
				insert_result = dao.categori_update(vo);
				 
			}
		}
		return result;
	}
	
	
	/**
	 *  admin_categorid_del
	 *  카테고리제거
	 */
	@ResponseBody
	@RequestMapping(value="/admin_categorid_del.do", method=RequestMethod.POST,  produces="application/text; charset=UTF-8")
	public String admin_categorid_del(@RequestParam HashMap<String, String> data)throws Exception{
		String result = ""; 
		
		if(data.size() == 0) {
			
		}else{
			HotelListVO vo = new HotelListVO();
			vo.setHotelname(data.get("hotelname"));
			vo.setCategoridept(Integer.parseInt(data.get("categoridept")));
			vo.setCategorigroup(Integer.parseInt(data.get("categorigroup")));
			vo.setCategoriseq(data.get("categoriseq"));
			HotelListDAO dao = new HotelListDAO();
			
			result = dao.categori_delete(vo);
		}
		return result;
	}
	
	/**
	 * admin_categorid_del_update
	 * 카테고리 삭제 후 나머지 업데이트
	 */
	@ResponseBody
	@RequestMapping(value="/admin_categorid_del_update.do")
	public HashMap<String, Object> admin_categorid_del_update(@RequestParam String data) throws Exception{
		HashMap<String, Object> result = new HashMap<String, Object>();
		ObjectMapper mapper = new ObjectMapper();
		ArrayList<HashMap<String, String>> list 
        = new ArrayList<HashMap<String,String>>(); 
		
		list = mapper.readValue(data, new TypeReference<ArrayList<HashMap<String,String>>>() {});
		if(list.size() == 0) {
			result.put("empty", "empty");
		}else{
			int insert_result;
			for(int i = 0; i < list.size(); i++) {
				HashMap<String,String> test = list.get(i);
				HotelListVO vo = new HotelListVO();
				vo.setHotelname(test.get("hotelname"));
				vo.setCategoridept(Integer.parseInt(test.get("categoridept")));
				if(vo.getCategoridept() == 1) {
					vo.setCategorigroup(Integer.parseInt((test.get("categorigroup"))));
					vo.setNewcategorigroup(Integer.parseInt((test.get("changegroup"))));
				}else {
					vo.setCategorigroup(Integer.parseInt((test.get("categorigroup"))));
					vo.setCategorinum(Integer.parseInt(test.get("categorinum")));
					vo.setNewcategorinum(Integer.parseInt(test.get("changenum")));
				}
				HotelListDAO dao = new HotelListDAO();
				
				insert_result = dao.categori_del_update(vo);
			}
		}
		return result;
	}
	/************************************************************
						admin hotel
	 ***********************************************************/
	
	/**
	 * createhotel.do
	 * 호텔등록 페이지 출력
	 */
	@RequestMapping(value="/createhotel.do",method=RequestMethod.GET,  produces="application/text; charset=UTF-8")
	public ModelAndView createhotel() {
		ModelAndView mv = new ModelAndView();
		HotelListDAO dao = new HotelListDAO();
		ArrayList<HotelListVO> list = dao.selecthotelist();
		
		mv.addObject("list",list);
		mv.setViewName("admin/createhotel");
		return mv;
	}
	
	/**
	 *  insert_hotel.do
	 *  호텔 등록하기
	 */
	@RequestMapping(value="/insert_hotel.do",method=RequestMethod.POST)
	public ModelAndView insert_hotel(HotelListVO vo) {
		ModelAndView mv = new ModelAndView();
		HotelListDAO dao = new HotelListDAO();
		int result = dao.insert_hotel(vo);
		if(result == 1) {
			mv.setViewName("admin/createhotel");
		}
		return mv;
	}
	
	/************************************************************
						admin edit hotel
	 ***********************************************************/
	/**
	 *  edite_index.do
	 *  호텔 등록하기
	 */
	@RequestMapping(value="/edite_index.do",method=RequestMethod.GET)
	public ModelAndView edite_index() {
		ModelAndView mv = new ModelAndView();		
		HotelListDAO dao = new HotelListDAO();
		ArrayList<HotelListVO> list = dao.selecthotelist();
		mv.addObject("list",list);
		mv.setViewName("admin/hoteledit");
		return mv;
	}
	
	/**
	 *  edit_index_getfiles
	 */
	@ResponseBody
	@RequestMapping(value="/edit_index_getfiles.do",method=RequestMethod.GET)
	public String edit_index_getfiles(String hotelname) {
		HotelListDAO dao = new HotelListDAO();
		JsonObject jobject = new JsonObject();
		JsonArray jarray = new JsonArray();
		Gson gson = new Gson();
		ArrayList<HotelListVO> list = dao.gethotelindexfiles(hotelname);
		for(HotelListVO vo : list) {
			JsonObject jo = new JsonObject();
			jo.addProperty("position",vo.getHotelfileposition());
			jo.addProperty("filename",vo.getHotelcontentfile());
			jo.addProperty("bsfilename",vo.getHotelcontentbsfile());
			jo.addProperty("positionnum",vo.getHotelcontentfilenum());
			jarray.add(jo);
		}
		jobject.add("file", jarray);
		
		
		
		return gson.toJson(jobject);
	}
	
	
	
	
	/**
	 * indexEdit_Logo.do
	 * 호텔 logo 수정
	 */
	@ResponseBody
	@RequestMapping(value="/indexEdit_logo.do",method=RequestMethod.POST)
	public String hotelEditlogo(HotelListVO vo, HttpServletRequest request) throws Exception{
		String result = "";
		HotelListDAO dao = new HotelListDAO();
			if(vo.getCategorifile1().getOriginalFilename().equals("")) {
				result = "false";
			}else {
				String oldfile = vo.getHotelcontentbsfile();
				
				UUID uuid = UUID.randomUUID();
				vo.setHotelcontentfile(vo.getCategorifile1().getOriginalFilename());
				vo.setHotelcontentbsfile(uuid+vo.getCategorifile1().getOriginalFilename());
				int resultDao = dao.editHotelLogo(vo);
				if(resultDao == 1) {
					if(!vo.getCategorifile1().getContentType().equals("")) {
						String path = request.getSession().getServletContext().getRealPath("/");
						path += "\\resources\\upload\\";
						File file = new File(path+vo.getHotelcontentbsfile());
						vo.getCategorifile1().transferTo(file);
						result = "success";
						
						File rfile = new File(path + oldfile);
						if(rfile.exists()) {
							rfile.delete();
						}
					}	
				}
			}
		return result;
	}
}
