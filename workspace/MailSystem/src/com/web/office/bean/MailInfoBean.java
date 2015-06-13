package com.web.office.bean;

public class MailInfoBean {
	private String subject;				//主题
	private String preSubject;			//前一封主题
	private String nextSubject;			//后一封主题
	private String from;				//发件人
	private String receive;				//收件人
	private String sentDate;			//发送时间
	private String sentTime;			//发送时间戳
	private String replied;				//已回复
	private String deleted;				//已删除
	private String draft;				//草稿
	private String flagged;				//已标记
	private String read;				//已读
	private String recent;				//最近
	private String priority;			//是否需要回执
	private String size;				//邮件大小
	private String attachment;			//附件路径
	private String content;				//邮件正文
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getPreSubject() {
		return preSubject;
	}
	public void setPreSubject(String preSubject) {
		this.preSubject = preSubject;
	}
	public String getNextSubject() {
		return nextSubject;
	}
	public void setNextSubject(String nextSubject) {
		this.nextSubject = nextSubject;
	}
	public String getFrom() {
		return from;
	}
	public void setFrom(String from) {
		this.from = from;
	}
	public String getReceive() {
		return receive;
	}
	public void setReceive(String receive) {
		this.receive = receive;
	}
	public String getSentDate() {
		return sentDate;
	}
	public void setSentDate(String sentDate) {
		this.sentDate = sentDate;
	}
	public String getSentTime() {
		return sentTime;
	}
	public void setSentTime(String sentTime) {
		this.sentTime = sentTime;
	}
	public String getReplied() {
		return replied;
	}
	public void setReplied(String replied) {
		this.replied = replied;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getDraft() {
		return draft;
	}
	public void setDraft(String draft) {
		this.draft = draft;
	}
	public String getFlagged() {
		return flagged;
	}
	public void setFlagged(String flagged) {
		this.flagged = flagged;
	}
	public String getRecent() {
		return recent;
	}
	public void setRecent(String recent) {
		this.recent = recent;
	}
	public String getRead() {
		return read;
	}
	public void setRead(String read) {
		this.read = read;
	}
	public String getPriority() {
		return priority;
	}
	public void setPriority(String priority) {
		this.priority = priority;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getAttachment() {
		return attachment;
	}
	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
}
