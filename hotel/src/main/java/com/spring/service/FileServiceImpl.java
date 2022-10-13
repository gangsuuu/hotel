package com.spring.service;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import com.hotel.vo.BasketVO;
import com.hotel.vo.HotelInquiryVO;

public class FileServiceImpl {

	/************************************************************
			book	������
	 ***********************************************************/
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
	
	
	/************************************************************
			inquiry �����
	 ***********************************************************/
	/**
	 * ���Ǳ� �����ϱ� - ������ �ִ� ��� �����ϱ�
	 */
	public void fileDelete(HotelInquiryVO vo, HttpServletRequest request) throws Exception{
		//�Խñ� ���� ��, upload������ �����ϴ� ������ �ִٸ� �����ϱ�
		if(vo.getIsfile() != null) {//������ ������ ������,
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File old_file =  new File(path+vo.getIsfile());
			if(old_file.exists()) {//���������� �����ϸ�,
				old_file.delete();
			}
		}
	}//fileDelete-end
	
	/**
	 * ���Ǳ� �����ϱ� - ��������
	 */
	public void update_fileSave(HotelInquiryVO vo, HttpServletRequest request, String old_filename) 
	throws Exception {
		//���ο� ������ upload������ ����
		if(!vo.getFile1().getOriginalFilename().equals("")) {//���ο������� ���� O
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			
			File file = new File(path+vo.getIsfile());
			vo.getFile1().transferTo(file);
			
		//���� �� ���������� �ִ� ��쿣 ���������� ����
			File ofile = new File(path+old_filename);
			if(ofile.exists()) { //���������� �����ϸ�,
				ofile.delete();
			}
		}
	}//update_fileSave	
		
	/**
	 * ���Ǳ� �����ϱ� - ����üũ
	 */
	public HotelInquiryVO update_fileCheck(HotelInquiryVO vo) {
		//������, ���ο������� �����ߴ��� ���ߴ��� Ȯ��
		//���ο������� �̸��� �����������, ���������� ������Ʈ�� �ʿ䰡 ��� else���� ����.
		if(!vo.getFile1().getOriginalFilename().equals("")) {//���ο������� ���� O
			UUID uuid = UUID.randomUUID();
			vo.setIfile(vo.getFile1().getOriginalFilename());
			vo.setIsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}
		return vo;
	}//update_fileCheck
	
	/**
	 * ���Ǳ� ���� - ���� ����
	 */
	public void fileSave(HotelInquiryVO vo, HttpServletRequest request) throws Exception {
		//2. upload������ ������ �����ϴ� �۾� 
		if(!vo.getFile1().getOriginalFilename().equals("")) {
			//viewName�Ķ���Ϳ� HttpServletRequest request�߰��ϰ� import
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "\\resources\\upload\\";
			//System.out.println("path--> "+path);
			
			File file = new File(path+vo.getIsfile());
			vo.getFile1().transferTo(file);
		}
		
	}
	
	/**
	 * ���Ǳ� ���� - ����üũ
	 */
	public HotelInquiryVO fileCheck(HotelInquiryVO vo) {
		//1. ���� üũ ifile, isfile�� ����Ǵ� �̸� ����
		if(vo.getFile1().getOriginalFilename().equals("")) {
			vo.setIfile("");
			vo.setIsfile("");
		}else {
			
			UUID uuid = UUID.randomUUID(); //��ȿ�� ���ϸ��� �ߺ����� �ʰ� �������ش�.
			vo.setIfile(vo.getFile1().getOriginalFilename());
			vo.setIsfile(uuid+"_"+vo.getFile1().getOriginalFilename());
		}
		return vo;
	}
}
