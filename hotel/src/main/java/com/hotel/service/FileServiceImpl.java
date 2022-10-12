package com.hotel.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hotel.vo.BasketVO;

public class FileServiceImpl {
	
	public void fileSave(BasketVO vo, HttpServletRequest request) throws Exception {
		// upload 폴더에 bsfile 명으로 실제 파일 업로드 처리
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getBsfile());
			vo.getFile1().transferTo(file);
		}
	}
	
	/**
	 * 사진파일 삭제 : 방 삭세 시 파일이 존재하면 삭제하기
	 */
	public void fileDelete(String bsfile, HttpServletRequest request) throws Exception{
		if(bsfile != null) {
			String path=request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			File old_file = new File(path+bsfile);
			if(old_file.exists()) {
				old_file.delete();
			}
		}
	}
	
	/**
	 * 사진파일 업로드 : 파일 체크 후 bfile, bsfile 생성
	 */
	public BasketVO fileCheck(BasketVO vo) {
		//vo객체의(넘오온 값 파일체크 후 bfile, bsfile에 저장되는 이름 생성)
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setBfile("");
			vo.setBsfile("");
		}else {
			UUID uuid = UUID.randomUUID();
			vo.setBfile(vo.getFile1().getOriginalFilename());
			vo.setBsfile(uuid + "_" + vo.getFile1().getOriginalFilename());
		}
		
		return  vo;
	}
	/**
	 * 사진파일이 있는 경우 update시 파일체크
	 */
	public BasketVO update_fileCheck(BasketVO vo) {
		if(vo.getFile1() != null) {	//새로운 파일객체가 있는지 여부체크 하는 경우에는 null을 사용
			if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
				
				UUID uuid = UUID.randomUUID();
				
				vo.setBfile(vo.getFile1().getOriginalFilename());
				vo.setBsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}
	
	/**
	 * update시 파일 재업로드(기존에 있는 사진파일은 삭제)
	 */
	public void update_filesave(BasketVO vo, HttpServletRequest request, String old_filename) 
			throws Exception {
		//새로운 파일을 upload 폴더에 저장
		if(!vo.getFile1().getOriginalFilename().equals("")) { //새로운 파일선택 O
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "\\resources\\upload\\";
		//System.out.println(path);
		
		File file = new File(path+vo.getBsfile());
		vo.getFile1().transferTo(file);
		
		//기존파일이 있는 경우에는 파일 삭제
		File ofile = new File(path+old_filename);
		if(ofile.exists()) {
		ofile.delete();
		}
	}
}
	
}
