package com.test.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class FileUpLoadAction extends ActionSupport {
	
	private File ff;
	private String ffFileName;
	private String ffContentType;	
	
	private InputStream fis;
	private String fisFileName;
	
	

	public String getFisFileName() {
		return fisFileName;
	}

	public void setFisFileName(String fisFileName) {
		this.fisFileName = fisFileName;
	}

	public InputStream getFis() {
		return fis;
	}

	public void setFis(InputStream fis) {
		this.fis = fis;
	}

	public String getFfFileName() {
		return ffFileName;
	}

	public void setFfFileName(String ffFileName) {
		this.ffFileName = ffFileName;
	}

	public String getFfContentType() {
		return ffContentType;
	}

	public void setFfContentType(String ffContentType) {
		this.ffContentType = ffContentType;
	}

	public File getFf() {
		return ff;
	}

	public void setFf(File ff) {
		this.ff = ff;
	}

	@Override
	public String execute() throws Exception {
		
		System.out.println(ffFileName);
		System.out.println(ffContentType);
		FileOutputStream fos = new FileOutputStream("d:/aa.exe");
		FileInputStream fis = new FileInputStream(ff);
		byte[] b = new byte[1024];
		while(fis.read(b)!=-1){
			fos.write(b);
		}
		fos.close();
		fis.close();
		return "success";
	}
	
	public String fileDownLoad() throws Exception {
		fis = new FileInputStream("d:/aa.txt");
		fisFileName = "zhouqi.txt";
		
		
		return "success";
	}

	


	
	
	
}
