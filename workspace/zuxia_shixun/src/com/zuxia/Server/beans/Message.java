package com.zuxia.Server.beans;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Message implements Serializable{
	private String sender;
	private Date sendTime;
	private String content;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Date getSendTime() {
		return sendTime;
	}
	public void setSendTime(Date date) {
		
		this.sendTime = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	public String toString(){						//��д�÷���������println(obj)���ʱ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");			//�趨���ڸ�ʽ
		String date = sdf.format(this.sendTime);
		return this.sender+"\n"+date+"\n"+this.content;
	}
}
