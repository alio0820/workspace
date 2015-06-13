package com.etc.OurProgram.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.RequestAware;

import com.opensymphony.xwork2.ActionSupport;

public class FileUpLoadAction extends ActionSupport {
	private String datumName;
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

	

	


	public String getDatumName() {
		return datumName;
	}

	public void setDatumName(String datumName) {
		this.datumName = datumName;
	}

	public File getFf() {
		return ff;
	}

	public void setFf(File ff) {
		this.ff = ff;
	}

	
	
	public String fileDownLoad() throws Exception {
		
		fis = new FileInputStream("D:/MyDocument/workspace/OurProgram/WebRoot/fileupdown/"+datumName+".doc");
		fisFileName =datumName+".doc";
		return "success";
	}

	


	
	
	
}
