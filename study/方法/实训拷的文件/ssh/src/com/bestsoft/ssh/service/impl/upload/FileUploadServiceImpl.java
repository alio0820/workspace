package com.bestsoft.ssh.service.impl.upload;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import com.bestsoft.ssh.bean.upload.FileUpload;
import com.bestsoft.ssh.dao.upload.IFileUploadDAO;
import com.bestsoft.ssh.service.upload.IFileUploadService;

public class FileUploadServiceImpl implements
		IFileUploadService {

    private IFileUploadDAO fileUploadHibernateDAO;
	public List<FileUpload> getFileUploads(String tmpId) {
		return fileUploadHibernateDAO.getFileUploads(tmpId);
	}
	public FileUpload getFileUploadByPackAndName(String srcName, String saveName) {
		return fileUploadHibernateDAO.getFileUploadByPackAndName(srcName, saveName);
	}
	public void save(FileUpload fileUpload) {
		fileUploadHibernateDAO.save(fileUpload);
	}
	@SuppressWarnings("unchecked")
	public void deleteFileUpload(Class clazz, Serializable id) {
		fileUploadHibernateDAO.deleteFileUpload(clazz, id);
		
	}
	@SuppressWarnings("unchecked")
	public void deleteAll(Collection entities) {
		fileUploadHibernateDAO.deleteAll(entities);
		
	}
	@SuppressWarnings("unchecked")
	public FileUpload getFileUpload(Class clazz, Serializable id) {
		return fileUploadHibernateDAO.getFileUpload(clazz, id);
	}
	public void setFileUploadHibernateDAO(IFileUploadDAO fileUploadHibernateDAO) {
		this.fileUploadHibernateDAO = fileUploadHibernateDAO;
	}

}
