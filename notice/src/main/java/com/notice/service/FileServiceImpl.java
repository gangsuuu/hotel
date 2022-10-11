package com.notice.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.notice.vo.NoticeVO;
import com.notice.service.NoticeServiceImpl;


public class FileServiceImpl {
	
	@Autowired
	private NoticeServiceImpl noticeService;

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
