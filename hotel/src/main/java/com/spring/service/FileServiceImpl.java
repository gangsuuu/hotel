package com.spring.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.hotel.vo.HotelInquiryVO;

public class FileServiceImpl {

	/**
	 * 문의글 삭제하기 - 파일이 있는 경우 삭제하기
	 */
	public void fileDelete(HotelInquiryVO vo, HttpServletRequest request) throws Exception{
		//게시글 삭제 시, upload폴더에 존재하는 파일이 있다면 삭제하기
		if(vo.getIsfile() != null) {//삭제할 파일이 있으면,
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File old_file =  new File(path+vo.getIsfile());
			if(old_file.exists()) {//기존폴더가 존재하면,
				old_file.delete();
			}
		}
	}//fileDelete-end
	
	/**
	 * 문의글 수정하기 - 파일저장
	 */
	public void update_fileSave(HotelInquiryVO vo, HttpServletRequest request, String old_filename) 
	throws Exception {
		//새로운 파일을 upload폴더에 저장
		if(!vo.getFile1().getOriginalFilename().equals("")) {//새로운파일을 선택 O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getIsfile());
			vo.getFile1().transferTo(file);
			
		//저장 후 기존파일이 있는 경우엔 기존파일은 삭제
			File ofile = new File(path+old_filename);
			if(ofile.exists()) { //기존파일이 존재하면,
				ofile.delete();
			}
		}
	}//update_fileSave	
		
	/**
	 * 문의글 수정하기 - 파일체크
	 */
	public HotelInquiryVO update_fileCheck(HotelInquiryVO vo) {
		//수정시, 새로운파일을 선택했는지 안했는지 확인
		//새로운파일은 이름을 만들어주지만, 기존파일은 업데이트할 필요가 없어서 else하지 않음.
		if(!vo.getFile1().getOriginalFilename().equals("")) {//새로운파일을 선택 O
			UUID uuid = UUID.randomUUID();
			vo.setIfile(vo.getFile1().getOriginalFilename());
			vo.setIsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}
		return vo;
	}//update_fileCheck
	
	/**
	 * 문의글 쓰기 - 파일 저장
	 */
	public void fileSave(HotelInquiryVO vo, HttpServletRequest request) throws Exception {
		//2. upload폴더에 파일을 저장하는 작업 
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			//viewName파라미터에 HttpServletRequest request추가하고 import
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			//System.out.println("path--> "+path);
			
			File file = new File(path+vo.getIsfile());
			vo.getFile1().transferTo(file);
		}
		
	}
	
	/**
	 * 문의글 쓰기 - 파일체크
	 */
	public HotelInquiryVO fileCheck(HotelInquiryVO vo) {
		//1. 파일 체크 ifile, isfile에 저장되는 이름 생성
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setIfile("");
			vo.setIsfile("");
		}else {
			
			UUID uuid = UUID.randomUUID(); //유효한 파일명을 중복되지 않게 생성해준다.
			vo.setIfile(vo.getFile1().getOriginalFilename());
			vo.setIsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}
		return vo;
	}
}
