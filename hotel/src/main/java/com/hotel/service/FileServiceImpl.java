package com.hotel.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.hotel.vo.BasketVO;

public class FileServiceImpl {
	
	public void fileSave(BasketVO vo, HttpServletRequest request) throws Exception {
		// upload ������ bsfile ������ ���� ���� ���ε� ó��
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getBsfile());
			vo.getFile1().transferTo(file);
		}
	}
	
	/**
	 * �������� ���� : �� �輼 �� ������ �����ϸ� �����ϱ�
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
	 * �������� ���ε� : ���� üũ �� bfile, bsfile ����
	 */
	public BasketVO fileCheck(BasketVO vo) {
		//vo��ü��(�ѿ��� �� ����üũ �� bfile, bsfile�� ����Ǵ� �̸� ����)
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
	 * ���������� �ִ� ��� update�� ����üũ
	 */
	public BasketVO update_fileCheck(BasketVO vo) {
		if(vo.getFile1() != null) {	//���ο� ���ϰ�ü�� �ִ��� ����üũ �ϴ� ��쿡�� null�� ���
			if(!vo.getFile1().getOriginalFilename().equals("")) { //���ο� ���ϼ��� O
				
				UUID uuid = UUID.randomUUID();
				
				vo.setBfile(vo.getFile1().getOriginalFilename());
				vo.setBsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
			}
		}
		return vo;
	}
	
	/**
	 * update�� ���� ����ε�(������ �ִ� ���������� ����)
	 */
	public void update_filesave(BasketVO vo, HttpServletRequest request, String old_filename) 
			throws Exception {
		//���ο� ������ upload ������ ����
		if(!vo.getFile1().getOriginalFilename().equals("")) { //���ο� ���ϼ��� O
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "\\resources\\upload\\";
		//System.out.println(path);
		
		File file = new File(path+vo.getBsfile());
		vo.getFile1().transferTo(file);
		
		//���������� �ִ� ��쿡�� ���� ����
		File ofile = new File(path+old_filename);
		if(ofile.exists()) {
		ofile.delete();
		}
	}
}
	
}
