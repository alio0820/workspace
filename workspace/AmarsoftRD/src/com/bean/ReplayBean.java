package com.bean;

public class ReplayBean {
	private String replayId;	//回复ID
	private String replay4Id;	//被回复的Id
	private int grade;			//级别
	private int replayNum;		//回复数
	private int praiseNum;		//点赞数
	private String comment;		//回复的内容
	private String inputUser;	//回复者
	private String inputUserName;//回复者名称
	private String userHead;	//头像
	private int userRank;	//等级
	private String inputTime;	//回复的时间
	private String updateTime;	//更新的时间
	public String getReplayId() {
		return replayId;
	}
	public void setReplayId(String replayId) {
		this.replayId = replayId;
	}
	public String getReplay4Id() {
		return replay4Id;
	}
	public void setReplay4Id(String replay4Id) {
		this.replay4Id = replay4Id;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getReplayNum() {
		return replayNum;
	}
	public void setReplayNum(int replayNum) {
		this.replayNum = replayNum;
	}
	public int getPraiseNum() {
		return praiseNum;
	}
	public void setPraiseNum(int praiseNum) {
		this.praiseNum = praiseNum;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getInputUser() {
		return inputUser;
	}
	public void setInputUser(String inputUser) {
		this.inputUser = inputUser;
	}
	public String getInputUserName() {
		return inputUserName;
	}
	public void setInputUserName(String inputUserName) {
		this.inputUserName = inputUserName;
	}
	public String getUserHead() {
		return userHead;
	}
	public void setUserHead(String userHead) {
		this.userHead = userHead;
	}
	public int getUserRank() {
		return userRank;
	}
	public void setUserRank(int userRank) {
		this.userRank = userRank;
	}
	public String getInputTime() {
		return inputTime;
	}
	public void setInputTime(String inputTime) {
		this.inputTime = inputTime;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	
}
