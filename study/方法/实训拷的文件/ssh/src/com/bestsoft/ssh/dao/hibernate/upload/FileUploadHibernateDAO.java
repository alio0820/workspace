package com.bestsoft.ssh.dao.hibernate.upload;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.bestsoft.ssh.bean.upload.FileUpload;
import com.bestsoft.ssh.dao.upload.IFileUploadDAO;

public class FileUploadHibernateDAO extends HibernateDaoSupport implements
		IFileUploadDAO {

	@SuppressWarnings("unchecked")
	public List<FileUpload> getFileUploads(String tmpId){
		return getHibernateTemplate().find("FROM FileUpload WHERE fileSrcName = '"+tmpId +"'");
	}
	
	@SuppressWarnings("unchecked")
	public FileUpload getFileUploadByPackAndName(String srcName,String saveName){
		List list =  getHibernateTemplate().find("FROM FileUpload WHERE fileSrcName ='"+srcName+"' AND fileSaveName = '"+saveName+"'");
	    FileUpload fileUpload = null;
		if(list.size()>0){
	    	fileUpload = (FileUpload)list.get(0);
	    }
		return fileUpload;
	}

	public void save(FileUpload fileUpload) {
		getHibernateTemplate().save(fileUpload);
	}

	@SuppressWarnings("unchecked")
	public void deleteFileUpload(Class clazz, Serializable id) {
		getHibernateTemplate().delete(this.getFileUpload(clazz, id));
		
	}

	@SuppressWarnings("unchecked")
	public FileUpload getFileUpload(Class clazz, Serializable id) {
		return (FileUpload)getHibernateTemplate().get(clazz, id);
	}

	@SuppressWarnings("unchecked")
	public void deleteAll(Collection entities) {
		getHibernateTemplate().deleteAll(entities);
		
	}
}
