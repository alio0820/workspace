package com.bean;

public class PostBean {
	private String PostId;		//公告ID
	private String sortNo;		//序号
	private String title;		//标题
	private String content;		//内容
	private int readNum;		//阅读数
	private int replayNum;		//回复数
	private int praiseNum;		//点赞数
	private int nicePost;		//是否精品帖
	private int top;			//是否置顶
	private String inputTime;		//发布时间
	private String inputUser;		//发布者
	private String inputUserName;	//发布者名称
	private String userHead;		//头像
	private int userRank;			//等级
	private String updateTime;		//更新时间
	private int isInUse;			//是否使用
	public String getPostId() {
		return PostId;
	}
	public void setPostId(String postId) {
		PostId = postId;
	}
	public String getSortNo() {
		return sortNo;
	}
	public void setSortNo(String sortNo) {
		this.sortNo = sortNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadNum() {
		return readNum;
	}
	public void setReadNum(int readNum) {
		this.readNum = readNum;
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
	public int getNicePost() {
		return nicePost;
	}
	public void setNicePost(int nicePost) {
		this.nicePost = nicePost;
	}
	public int getTop() {
		return top;
	}
	public void setTop(int top) {
		this.top = top;
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
