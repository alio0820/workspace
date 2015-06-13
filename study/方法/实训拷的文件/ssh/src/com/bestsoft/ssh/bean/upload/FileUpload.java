package com.bestsoft.ssh.bean.upload;

/**
 * FileUpload entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FileUpload implements java.io.Serializable {
	private static final long serialVersionUID = 7995776093446545422L;
	private String fileId;
	private String fileSrcName;
	private String fileSaveName;
	private String fileUrl;
	private String uploadTime;
	private Integer deleteFlag;
	private String memo;
	private Integer prepare1;
	private String prepare2;
	private String prepare3;

	// Constructors

	/** default constructor */
	public FileUpload() {
	}

	/** minimal constructor */
	public FileUpload(String fileId) {
		this.fileId = fileId;
	}

	/** full constructor */
	public FileUpload(String fileId, String fileSrcName, String fileSaveName,
			String fileUrl, String uploadTime, Integer deleteFlag, String memo,
			Integer prepare1, String prepare2, String prepare3) {
		this.fileId = fileId;
		this.fileSrcName = fileSrcName;
		this.fileSaveName = fileSaveName;
		this.fileUrl = fileUrl;
		this.uploadTime = uploadTime;
		this.deleteFlag = deleteFlag;
		this.memo = memo;
		this.prepare1 = prepare1;
		this.prepare2 = prepare2;
		this.prepare3 = prepare3;
	}

	// Property accessors

	public String getFileId() {
		return this.fileId;
	}

	public void setFileId(String fileId) {
		this.fileId = fileId;
	}

	public String getFileSrcName() {
		return this.fileSrcName;
	}

	public void setFileSrcName(String fileSrcName) {
		this.fileSrcName = fileSrcName;
	}

	public String getFileSaveName() {
		return this.fileSaveName;
	}

	public void setFileSaveName(String fileSaveName) {
		this.fileSaveName = fileSaveName;
	}

	public String getFileUrl() {
		return this.fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	public String getUploadTime() {
		return this.uploadTime;
	}

	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}

	public Integer getDeleteFlag() {
		return this.deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	public String getMemo() {
		return this.memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	public Integer getPrepare1() {
		return this.prepare1;
	}

	public void setPrepare1(Integer prepare1) {
		this.prepare1 = prepare1;
	}

	public String getPrepare2() {
		return this.prepare2;
	}

	public void setPrepare2(String prepare2) {
		this.prepare2 = prepare2;
	}

	public String getPrepare3() {
		return this.prepare3;
	}

	public void setPrepare3(String prepare3) {
		this.prepare3 = prepare3;
	}

}