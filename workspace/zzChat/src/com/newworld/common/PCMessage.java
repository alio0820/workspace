package com.newworld.common;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class PCMessage implements Serializable {
	private int sender;
	private Date sendTime;
	private String content;
	private int sendTo;
	private int status;										//服务器推送协议识别信号
	public int getSender() {
		return sender;
	}
	public void setSender(int sender) {
		this.sender = sender;
	}
	public int getSendTo() {
		return sendTo;
	}
	public void setSendTo(int sendTo) {
		this.sendTo = sendTo;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date sendTime) {
		this.sendTime = sendTime;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	@Override
	public String toString() {
		String show = sender + " " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(sendTime) + "\n" + " "+content+'\n';  
		return show;
	}
	public String toString2(){
		String show =" " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(sendTime) + "\n" + " "+content+'\n';  
		return show;
	}
}

