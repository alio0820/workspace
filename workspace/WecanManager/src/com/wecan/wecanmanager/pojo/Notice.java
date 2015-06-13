package com.wecan.wecanmanager.pojo;

/**
 * Notice entity. @author MyEclipse Persistence Tools
 */

public class Notice implements java.io.Serializable {

	// Fields

	private Integer id;//主键
	
	private User user;//关联user的外键，哪个人发布公告
	
	private String topic;//公告标题
	
	private String text;//公告内容
	
	private String sendToSomeone;//发送给某人

	// Constructors

	/** default constructor */
	public Notice() {
	}

	/** minimal constructor */
	public Notice(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Notice(Integer id, User user, String topic, String text,
			String sendToSomeone) {
		this.id = id;
		this.user = user;
		this.topic = topic;
		this.text = text;
		this.sendToSomeone = sendToSomeone;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getTopic() {
		return this.topic;
	}

	public void setTopic(String topic) {
		this.topic = topic;
	}

	public String getText() {
		return this.text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getSendToSomeone() {
		return this.sendToSomeone;
	}

	public void setSendToSomeone(String sendToSomeone) {
		this.sendToSomeone = sendToSomeone;
	}

}