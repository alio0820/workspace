package com.newworld.common;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Message implements Serializable {
	String sender;
	Date date;
	String content;
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;   
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	@Override
	public String toString() {
		String show = sender + " " + new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date) + "\n" + " "+content+'\n';		
		return show;
	}
	
	
}
