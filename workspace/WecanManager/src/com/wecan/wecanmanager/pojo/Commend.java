package com.wecan.wecanmanager.pojo;

import java.sql.Timestamp;

/**
 * Commend entity. @author MyEclipse Persistence Tools
 */

public class Commend implements java.io.Serializable {

	// Fields

	private Integer id;//主键
	
	private User user;//关联user的外键，哪个人提出奖励
	
	private Timestamp date;//更新时间
	
	private String reason;//奖励理由

	// Constructors

	/** default constructor */
	public Commend() {
	}

	/** full constructor */
	public Commend(User user, Timestamp date, String reason) {
		this.user = user;
		this.date = date;
		this.reason = reason;
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

	public Timestamp getDate() {
		return this.date;
	}

	public void setDate(Timestamp date) {
		this.date = date;
	}

	public String getReason() {
		return this.reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

}