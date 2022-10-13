package com.spring.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.hotel.vo.BasketVO;
import com.hotel.vo.HotelInquiryVO;
import com.hotel.vo.NoticeVO;

public class FileServiceImpl {

	/************************************************************
			book	조진희
	 ***********************************************************/
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
	
	
	/************************************************************
			inquiry 김수민
	 ***********************************************************/
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
	
	/************************************************
	 * 김민재
	 ************************************************/
	
	
	/**
	 * 공지사항 : 게시글 삭제시 upload 폴더에 존재하는 파일이 있다면 삭제하기
	 */
	public void fileDelete(NoticeVO vo,HttpServletRequest request) throws Exception {
		if(vo.getNsfile() != null) {				

			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			File old_file = new File(path+vo.getNsfile());

			if(old_file.exists()) {

				old_file.delete();

			}	
		}
	}
	
	

	/**
	 * 공지사항 : 파일이 있는 경우 update시 파일 저장
	 */
	public void notice_filesave(NoticeVO vo, HttpServletRequest request, String old_filename) throws Exception{
		if(!vo.getFile1().getOriginalFilename().equals("")) { 
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";

			File file = new File(path+vo.getNsfile());
			vo.getFile1().transferTo(file);

			//저장 후 기존파일이 있는 경우에는 파일 삭제
			File ofile = new File(path+old_filename);
			if(ofile.exists()) {
				ofile.delete();
			}
		}
	}



	/**
	 * 공지사항 : 파일이 있는 경우 update시 파일 체크
	 */
	public NoticeVO update_fileCheck(NoticeVO vo) {
		if(!vo.getFile1().getOriginalFilename().equals("")) { 

			UUID uuid = UUID.randomUUID();

			vo.setNfile(vo.getFile1().getOriginalFilename());
			vo.setNsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}
		return vo;
	}

	/**
	 * 공지사항 : 파일 업로드 폴더에 저장
	 */
	public void fileSave(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		//upload 폴더에 파일을 저장
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "\\resources\\upload\\";
		//System.out.println(path);

		File file = new File(path+vo.getNsfile());
		vo.getFile1().transferTo(file);

	}


	/**
	 * 공지사항 : 파일 체크 후 nfile, nsfile 생성	
	 */
	public NoticeVO fileCheck(NoticeVO vo) {
		//vo객체의 파일 체크 후 nfile, nsfile에 저장되는 이름 생성
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setNfile("");
			vo.setNsfile("");
		}else {

			UUID uuid = UUID.randomUUID();
			vo.setNfile(vo.getFile1().getOriginalFilename());
			vo.setNsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}

		return vo;

	}
}
