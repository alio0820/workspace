package com.bestsoft.ssh.web.action.upload;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import com.bestsoft.ssh.bean.upload.FileUpload;
import com.bestsoft.ssh.comm.DateTime;
import com.bestsoft.ssh.comm.FileUtil;
import com.bestsoft.ssh.comm.PropertiesReader;
import com.bestsoft.ssh.comm.Util;
import com.bestsoft.ssh.databean.UploadFile;
import com.bestsoft.ssh.service.upload.IFileUploadService;
import com.opensymphony.xwork2.ActionSupport;
public class UploadFileAction extends ActionSupport{
	private static final long serialVersionUID = -161997309853991226L;
	private String url;
	private String tempUrl;
	private String control;
	private String attachId;
	private String fileId;
	private String messageInfo;
	private  String percentString = "";
	private Integer percent=0;
	public static final int BUFFER_SIZE = 16 * 1024;
	// 用String数组来封装多个上传文件类型
	private String[] uploadContentType;
	// 保存文件的目录路径(通过依赖注入)
	private String savePath;
	private UploadFile uploadFile;
	private File upload;
	private List<FileUpload> fileUploads;
	private IFileUploadService fileUploadService;
	
	public HttpSession getCurrentSession() {
		HttpSession session = null;
		session = ServletActionContext.getRequest().getSession();
		return session;
	}
	class UploadThread implements Runnable {
		//在当前线程中上传的文件.
		private File from ;
		//保存到服务器硬盘上的位置.
		private File to ;
		//HttpSession需要传递过来，直接以ServletActionContext.getRequest.getSession将会抛出NullPointerException.
		private HttpSession httpSession;
		//构造方法，用来传址.
		public UploadThread(File src, File dst,HttpSession httpSession) {
			this.from = src;
			this.to = dst;
			this.httpSession = httpSession;
		}
		//线程中处理上传.
		public void run() {
			copy(from,to,httpSession);
		}
		
	}	
	@SuppressWarnings("unchecked")
	public String ajaxRequest(){
		if(control.equals("addFile")){
			PropertiesReader reader = PropertiesReader.getIntance();
			FileUtil.delAllFile(reader.getProperty("struts.multipart.saveDir"));
			fileUploads = fileUploadService.getFileUploads(attachId);
		}else if(control.equals("delFile")){
			FileUpload file = (FileUpload)fileUploadService.getFileUpload(FileUpload.class,fileId);
			String fileUrl = ServletActionContext.getServletContext()
			.getRealPath("/WEB-INF/" + file.getFileUrl());
			FileUtil.delFile(fileUrl);//删除文件夹中的文件
			fileUploadService.deleteFileUpload(FileUpload.class,fileId);//删除数据库中的文件
			
		}else if(control.equals("emptyFile")){
			setSavePath("/upload/default/"+attachId);
			String fileUrl = ServletActionContext.getServletContext()
			.getRealPath("/WEB-INF/" + this.getSavePath());
			FileUtil.delAllFile(fileUrl);
			List list  = fileUploadService.getFileUploads(attachId);
			if(list.size()>0){
				fileUploadService.deleteAll(list);
			}
		}else if(control.equals("cancleFile")){
			Thread thread = (Thread)getCurrentSession().getAttribute("thread");
			thread.interrupt();
			PropertiesReader reader = PropertiesReader.getIntance();
			FileUtil.delAllFile(reader.getProperty("struts.multipart.saveDir"));
			UploadFile uploadFile = (UploadFile)getCurrentSession().getAttribute("uploadFile");
			if(uploadFile!=null){
				String fileUrl = ServletActionContext.getServletContext()
				.getRealPath("/WEB-INF/" + uploadFile.getPath()+"/"+uploadFile.getName());
				FileUtil.delFile(fileUrl);//删除文件夹中的文件
			}
			getCurrentSession().removeAttribute("uploadFile");
		}
		return "showAjax";
	}
	@SuppressWarnings({ "unchecked", "static-access" })
	public String iframeRequest(){
		HttpSession httpSession = getCurrentSession();
		String info = "";
		httpSession.removeAttribute("info");
		if(httpSession.getAttribute("anErrorMessage")!=null && !httpSession.getAttribute("anErrorMessage").equals("")){
			httpSession.setAttribute("info","error");
			httpSession.removeAttribute("anErrorMessage");
			return "percentAjax";
		}		
		if(url!=null && !url.equals("")){
			tempUrl = url.substring(url.lastIndexOf("\\")+1,url.length());
			FileUpload fileUpload = fileUploadService.getFileUploadByPackAndName(attachId, tempUrl);
			if(fileUpload!=null){  //如果附件存在
				info = "exist";
				
			}else{
					info = "upload";
					setSavePath("/upload/default/"+attachId);//设置存放路径   具体查看upload下目录结构
					// 根据服务器的文件保存地址和原文件名创建目录文件全路径
					String dstPath = ServletActionContext.getServletContext()
					.getRealPath("/WEB-INF/" + this.getSavePath())
					+ "/" + tempUrl;
					File dstFile = new File(dstPath);
					File dirFile = new File(ServletActionContext.getServletContext().getRealPath("/WEB-INF/" + this.getSavePath()));
					boolean isDir = dirFile.isDirectory();
					if(!isDir){//目录不存在则先建目录
						try{
							dirFile.mkdirs();
						}catch (Exception e) {
							File delFile = new File(ServletActionContext.getServletContext()
									.getRealPath(this.getSavePath())
									+ "/" + tempUrl);
							delFile.delete();
							return ERROR;
						}
					}
					String fileType = getExtention(tempUrl);
					UploadFile uploadFile = new UploadFile();
					uploadFile.setName(tempUrl);
					uploadFile.setType(fileType);
					uploadFile.setPath(this.getSavePath());
					uploadFile.setSize(upload.length());
					httpSession.setAttribute("uploadFile",uploadFile);
					httpSession.setAttribute("fileSrcName",attachId);
					UploadThread uh = new UploadThread(upload,dstFile,httpSession);
					Thread th = new Thread(uh);
					httpSession.setAttribute("thread",th);
					try {
						@SuppressWarnings("unused")
						InputStream in = null;
						in = new BufferedInputStream(new FileInputStream(upload), BUFFER_SIZE);
					} catch (Exception e) {
						try {
							th.sleep(1000);
						} catch (InterruptedException e1) {
							info = "exception";
							th.interrupt(); 
							httpSession.setAttribute("info",info);
						}
					}
					th.start();
		     }
		}
		httpSession.setAttribute("info",info);
		return "percentAjax";
	}
	
	// 源文件对象复制成目标文件对象
	@SuppressWarnings("unchecked")
	protected  void copy(File src, File dst,HttpSession httpSession) {
		InputStream in = null;
		OutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(src), BUFFER_SIZE);
			out = new BufferedOutputStream(new FileOutputStream(dst),
					BUFFER_SIZE);
			byte[] buffer = new byte[BUFFER_SIZE];
			int len = 0;
			while ((len = in.read(buffer)) > 0) {
				out.write(buffer, 0, len);
				out.flush();
				Thread.sleep(30);
				UploadFile uploadFile = (UploadFile)httpSession.getAttribute("uploadFile");
				//计算已传多少
				uploadFile.setUploaded(uploadFile.getUploaded()+len);
				//计算上传百分比
				uploadFile.setPercent((int)(uploadFile.getUploaded()*100/uploadFile.getSize()));
//				uploadFile.setSpeedSecond(speedSecond)
				httpSession.setAttribute("uploadFile", uploadFile);
			}
		} catch (Exception e) {
			String info = "exception";
			httpSession.setAttribute("info",info);
		} finally {
			if (null != in) {
				try {
					in.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (null != out) {
				try {
					out.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}	
	@SuppressWarnings("unchecked")
	public  String returnValue() {
		try {
			Thread.sleep(200);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HttpSession session = getCurrentSession();
		String info = (String)session.getAttribute("info");
		if(info!=null){
			if(info.equals("upload")){
				uploadFile = (UploadFile)session.getAttribute("uploadFile");
				String fileSrcName = (String)session.getAttribute("fileSrcName");
				if(uploadFile!=null && uploadFile.getPercent()==100){
					FileUpload fileUpload = new FileUpload();
					fileUpload.setDeleteFlag(0);
					fileUpload.setFileId(Util.getUUID());
					fileUpload.setFileSaveName(uploadFile.getName());
					fileUpload.setFileSrcName(fileSrcName);
					fileUpload.setFileUrl(uploadFile.getPath()+"/"+uploadFile.getName());
					fileUpload.setUploadTime(DateTime.getStringDate());
					fileUploadService.save(fileUpload);
					session.removeAttribute("uploadFile");
					PropertiesReader reader = PropertiesReader.getIntance();
					FileUtil.delAllFile(reader.getProperty("struts.multipart.saveDir"));
					messageInfo = "";
					return "successAjax";
				}
				session.setAttribute("uploadFile",uploadFile);
			}else if(info.equals("exist")){
				messageInfo = "该附件已存在,请重新选择!";
				session.removeAttribute("info");
			}else if(info.equals("exception")){
				messageInfo = "服务器忙,请重新上传!";
				session.removeAttribute("info");
			}else if(info.equals("error")){
				messageInfo = "该附件大小超过30M,请重新选择!";
				session.removeAttribute("info");
			}
		}
		return "percentAjax";
	}
	//获取文件后缀名
    public static String getExtention(String fileName)  {
    	int length = fileName.length();
        int pos = fileName.lastIndexOf(".");
        if(fileName.equals("")||pos<0||length==pos){
        	return "unknow";
        }
        return fileName.substring(pos+1);
   } 
	/**
	 * 检查是否附件已存在
	 */
	@SuppressWarnings("unchecked")
	public boolean existFile(String tempUrl,HashMap fileMap){	
		if(fileMap!=null){			
			Iterator it = fileMap.keySet().iterator();
			while(it.hasNext()){
				String flagUrl = (String)it.next();
				if(flagUrl.equals(tempUrl)){
					return true;  //代表此附件已经存在
				}
			}
		}
		return false;
	}
	/** 　
	*　替换文件上传中出现的错误信息 　
	*　*/
	@Override
	public void addActionError(String anErrorMessage) {
		HttpSession httpSession = getCurrentSession();
		httpSession.removeAttribute("info");
		//这里要先判断一下，是我们要替换的错误，才处理
		if(anErrorMessage.startsWith("the request was rejected because its size")){
			httpSession.setAttribute("anErrorMessage", "anErrorMessage");
//			//这些只是将原信息中的文件大小提取出来。
//			Matcher m = Pattern.compile("\\d+").matcher(anErrorMessage); 
//			@SuppressWarnings("unused")
//			String s1 = "";
//			if(m.find()){
//				s1 = m.group();
//			}
//			@SuppressWarnings("unused")
//			String s2 = "";
//			if(m.find()){
//				s2 = m.group();
//			}
//			super.addActionError("你上传的文件(" + s1 + ")超过允许的大小(" + s2 + ")");
//		}
		}else{//不是则不管它 　
//			super.addActionError(anErrorMessage);
		}
	}		
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getControl() {
		return control;
	}
	public void setControl(String control) {
		this.control = control;
	}
	public String getMessageInfo() {
		return messageInfo;
	}

	public void setMessageInfo(String messageInfo) {
		this.messageInfo = messageInfo;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}

	public String getTempUrl() {
		return tempUrl;
	}
	public void setTempUrl(String tempUrl) {
		this.tempUrl = tempUrl;
	}
	public String getPercentString() {
		return percentString;
	}
	public void setPercentString(String percentString) {
		this.percentString = percentString;
	}
	public Integer getPercent() {
		return percent;
	}
	public void setPercent(Integer percent) {
		this.percent = percent;
	}
	public UploadFile getUploadFile() {
		return uploadFile;
	}
	public void setUploadFile(UploadFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getAttachId() {
		return attachId;
	}

	public void setAttachId(String attachId) {
		this.attachId = attachId;
	}

	public List<FileUpload> getFileUploads() {
		return fileUploads;
	}

	public void setFileUploads(List<FileUpload> fileUploads) {
		this.fileUploads = fileUploads;
	}

	public String getFileId() {
		return fileId;
	}
	public void setFileId(String fileId) {
		this.fileId = fileId;
	}
	public IFileUploadService getFileUploadService() {
		return fileUploadService;
	}
	public void setFileUploadService(IFileUploadService fileUploadService) {
		this.fileUploadService = fileUploadService;
	}

}
