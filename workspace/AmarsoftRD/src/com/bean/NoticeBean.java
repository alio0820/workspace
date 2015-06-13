package com.bean;

public class NoticeBean {
	private String noticeId;		//公告ID
	private int sortNo;			//序号
	private String title;			//标题
	private String appellation;		//称呼
	private String content;			//内容
	private String department;		//发布部门
	private String inputTime;		//发布时间
	private String inputUser;		//发布者
	private String updateTime;		//更新时间
	private int isInUse;			//是否使用
	public String getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(String noticeId) {
		this.noticeId = noticeId;
	}
	public int getSortNo() {
		return sortNo;
	}
	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAppellation() {
		return appellation;
	}
	public void setAppellation(String appellation) {
		this.appellation = appellation;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getInputTime() {
		return inputTime;
	}
	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	public String getInputUser() {
		return inputUser;
	}
	public void setInputUser(String inputUser) {
		this.inputUser = inputUser;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public int getIsInUse() {
		return isInUse;
	}
	public void setIsInUse(int isInUse) {
		this.isInUse = isInUse;
	}
}
