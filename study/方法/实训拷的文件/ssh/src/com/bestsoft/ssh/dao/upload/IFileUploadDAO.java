package com.bestsoft.ssh.dao.upload;

import java.io.Serializable;
import java.util.Collection;
import java.util.List;
import com.bestsoft.ssh.bean.upload.FileUpload;
public interface IFileUploadDAO {
	public List<FileUpload> getFileUploads(String tmpId);
	@SuppressWarnings("unchecked")
	public FileUpload getFileUploadByPackAndName(String srcName,String saveName);
    public void save(FileUpload fileUpload);
    @SuppressWarnings("unchecked")
	public FileUpload getFileUpload(Class clazz, Serializable id);
    @SuppressWarnings("unchecked")
	public void deleteFileUpload(Class clazz, Serializable id);
    @SuppressWarnings("unchecked")
	public void deleteAll(Collection entities);
}
