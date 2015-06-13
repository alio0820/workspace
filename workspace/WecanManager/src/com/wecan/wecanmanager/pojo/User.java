package com.wecan.wecanmanager.pojo;

import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;//主键
	
	private Authority authority;//关联到身份的外键
	
	private String username;//用户名
	
	private String password;//密码
	
	private String countId;//工号
	
	private String name;//真实姓名
	
	private String department;//部门
	
	private String tel;//联系方式
	
	private String major;//专业
	
	private String photo;//照片路径，（给一个统一的路径）
	
	private String description;//备注
	
	private Set notices = new HashSet(0);//作为notice表的外键
	
	private Set commends = new HashSet(0);//作为commend表的外键

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String username, String password, String countId) {
		this.username = username;
		this.password = password;
		this.countId = countId;
	}

	/** full constructor */
	public User(Authority authority, String username, String password,
			String countId, String name, String department, String tel,
			String major, String photo, String description, Set notices,
			Set commends) {
		this.authority = authority;
		this.username = username;
		this.password = password;
		this.countId = countId;
		this.name = name;
		this.department = department;
		this.tel = tel;
		this.major = major;
		this.photo = photo;
		this.description = description;
		this.notices = notices;
		this.commends = commends;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Authority getAuthority() {
		return this.authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getCountId() {
		return this.countId;
	}

	public void setCountId(String countId) {
		this.countId = countId;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDepartment() {
		return this.department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getMajor() {
		return this.major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getPhoto() {
		return this.photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set getNotices() {
		return this.notices;
	}

	public void setNotices(Set notices) {
		this.notices = notices;
	}

	public Set getCommends() {
		return this.commends;
	}

	public void setCommends(Set commends) {
		this.commends = commends;
	}

}