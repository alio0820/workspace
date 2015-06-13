package com.bestsoft.ssh.databean;

public class UploadFile {
	
	/**
	 * 文件名称
	 */
	private String name;
	/**
	 *路径,相对项目根目录的路径 
	 */
	private String path;
	/**
	 * 文件类型
	 */
	private String type;
	/**
	 * 文件大小(单位：字节)
	 */
	private double  size;
	
	/**
	 * 计算上传的百分比
	 */
	private int percent;

	/**
	 * 已经上传的大小
	 */
	private double uploaded;
	
	/**
	 * 上传成功的标记
	 * 
	 */
	public int flagUpload;
	
	/**
	 * 上传速度  kb/ms
	 * 
	 */
	public String speedSecond;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getPercent() {
		return percent;
	}
	public void setPercent(int percent) {
		this.percent = percent;
	}
	public double getUploaded() {
		return uploaded;
	}
	public void setUploaded(double uploaded) {
		this.uploaded = uploaded;
	}
	public double getSize() {
		return size;
	}
	public void setSize(double size) {
		this.size = size;
	}
	public int getFlagUpload() {
		return flagUpload;
	}
	public void setFlagUpload(int flagUpload) {
		this.flagUpload = flagUpload;
	}
	public String getSpeedSecond() {
		return speedSecond;
	}
	public void setSpeedSecond(String speedSecond) {
		this.speedSecond = speedSecond;
	}
}
