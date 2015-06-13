package com.wecan.wecanmanager.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * Authority entity. @author MyEclipse Persistence Tools
 */

public class Authority implements java.io.Serializable {

	// Fields

	private Integer id;//主键
	
	private String identity;//身份
	
	private Boolean addmanager;//添加管理员
	
	private Boolean delmanager;//删除管理员
	
	private Boolean updatemanager;//更新管理员信息
	
	private Boolean adduser;//添加用户
	
	private Boolean deluser;//删除用户
	
	private Boolean updateuser;//更新用户信息
	
	private Boolean addnotice;//发布公告
	
	private Boolean aceptnotice;//接收公告
	
	private Boolean querynotice;//查看公告
	
	private Boolean updownmessage;//修改个人信息
	
	private Set users = new HashSet(0);//关联user的外键

	// Constructors

	/** default constructor */
	public Authority() {
	}

	/** full constructor */
	public Authority(String identity, Boolean addmanager, Boolean delmanager,
			Boolean updatemanager, Boolean adduser, Boolean deluser,
			Boolean updateuser, Boolean addnotice, Boolean aceptnotice,
			Boolean querynotice, Boolean updownmessage, Set users) {
		this.identity = identity;
		this.addmanager = addmanager;
		this.delmanager = delmanager;
		this.updatemanager = updatemanager;
		this.adduser = adduser;
		this.deluser = deluser;
		this.updateuser = updateuser;
		this.addnotice = addnotice;
		this.aceptnotice = aceptnotice;
		this.querynotice = querynotice;
		this.updownmessage = updownmessage;
		this.users = users;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public Boolean getAddmanager() {
		return this.addmanager;
	}

	public void setAddmanager(Boolean addmanager) {
		this.addmanager = addmanager;
	}

	public Boolean getDelmanager() {
		return this.delmanager;
	}

	public void setDelmanager(Boolean delmanager) {
		this.delmanager = delmanager;
	}

	public Boolean getUpdatemanager() {
		return this.updatemanager;
	}

	public void setUpdatemanager(Boolean updatemanager) {
		this.updatemanager = updatemanager;
	}

	public Boolean getAdduser() {
		return this.adduser;
	}

	public void setAdduser(Boolean adduser) {
		this.adduser = adduser;
	}

	public Boolean getDeluser() {
		return this.deluser;
	}

	public void setDeluser(Boolean deluser) {
		this.deluser = deluser;
	}

	public Boolean getUpdateuser() {
		return this.updateuser;
	}

	public void setUpdateuser(Boolean updateuser) {
		this.updateuser = updateuser;
	}

	public Boolean getAddnotice() {
		return this.addnotice;
	}

	public void setAddnotice(Boolean addnotice) {
		this.addnotice = addnotice;
	}

	public Boolean getAceptnotice() {
		return this.aceptnotice;
	}

	public void setAceptnotice(Boolean aceptnotice) {
		this.aceptnotice = aceptnotice;
	}

	public Boolean getQuerynotice() {
		return this.querynotice;
	}

	public void setQuerynotice(Boolean querynotice) {
		this.querynotice = querynotice;
	}

	public Boolean getUpdownmessage() {
		return this.updownmessage;
	}

	public void setUpdownmessage(Boolean updownmessage) {
		this.updownmessage = updownmessage;
	}

	public Set getUsers() {
		return this.users;
	}

	public void setUsers(Set users) {
		this.users = users;
	}

}