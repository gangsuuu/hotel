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
	 * �������� : �Խñ� ������ upload ������ �����ϴ� ������ �ִٸ� �����ϱ�
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
	 * �������� : ������ �ִ� ��� update�� ���� ����
	 */
	public void notice_filesave(NoticeVO vo, HttpServletRequest request, String old_filename) throws Exception{
		if(!vo.getFile1().getOriginalFilename().equals("")) { 
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";

			File file = new File(path+vo.getNsfile());
			vo.getFile1().transferTo(file);

			//���� �� ���������� �ִ� ��쿡�� ���� ����
			File ofile = new File(path+old_filename);
			if(ofile.exists()) {
				ofile.delete();
			}
		}
	}



	/**
	 * �������� : ������ �ִ� ��� update�� ���� üũ
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
	 * �������� : ���� ���ε� ������ ����
	 */
	public void fileSave(NoticeVO vo, HttpServletRequest request) 
			throws Exception{
		//upload ������ ������ ����
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "\\resources\\upload\\";
		//System.out.println(path);

		File file = new File(path+vo.getNsfile());
		vo.getFile1().transferTo(file);

	}


	/**
	 * �������� : ���� üũ �� nfile, nsfile ����	
	 */
	public NoticeVO fileCheck(NoticeVO vo) {
		//vo��ü�� ���� üũ �� nfile, nsfile�� ����Ǵ� �̸� ����
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
