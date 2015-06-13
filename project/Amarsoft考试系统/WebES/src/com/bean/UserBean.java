package com.bean;

import java.util.Date;

import com.common.ILog;

public class UserBean {
	private String userName;			//用户名
	private String nickName;			//用户昵称
	private String head;				//头像路径
	private int rank;					//贴吧等级
	private String password;			//用户密码
	private String sex;					//性别
	private String birthday;			//生日
	private String birthplace;			//出生地
	private String school;				//毕业院校
	private String phone;				//联系方式
	private String roleId;				//用户角色
	private String remark;				//备注
	private int valid;					//用户是否有效
	private String registerTime;		//注册时间
	private String registerIp;			//注册IP
	private String recentTime;			//最后登录时间
	private String recentIp;			//最后登录IP
	private String updateTime;			//更新时间
	private String value1;				//预留属性
	private String value2;				//预留属性
	public String getNickNameNotNull(){
		if(nickName==null||nickName.equals(""))
			return userName;
		else
			return nickName;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getHead() {
		return head;
	}
	public void setHead(String head) {
		this.head = head;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getBirthplace() {
		return birthplace;
	}
	public void setBirthplace(String birthplace) {
		this.birthplace = birthplace;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getValue1() {
		return value1;
	}
	public void setValue1(String value1) {
		this.value1 = value1;
	}
	public String getValue2() {
		return value2;
	}
	public void setValue2(String value2) {
		this.value2 = value2;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public int getValid() {
		return valid;
	}
	public void setValid(int valid) {
		this.valid = valid;
	}
	public String getRegisterTime() {
		return registerTime;
	}
	public void setRegisterTime(String registerTime) {
		this.registerTime = registerTime;
	}
	public String getRegisterIp() {
		return registerIp;
	}
	public void setRegisterIp(String registerIp) {
		this.registerIp = registerIp;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRoleId() {
		return roleId;
	}
	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}
	public String getRecentTime() {
		return recentTime;
	}
	public void setRecentTime(String recentTime) {
		this.recentTime = recentTime;
	}
	public String getRecentIp() {
		return recentIp;
	}
	public void setRecentIp(String recentIp) {
		this.recentIp = recentIp;
	}
	
	public static UserBean getUserBean(){
		UserBean ub = new UserBean();
		String userName= "youke_"+new Date().getTime();
		ub.setUserName(userName);
		ub.setNickName("游客");
		ub.setHead("images/head/visitor.jpg");
		ub.setRank(1);
		ub.setSex("未知");
		ub.setBirthday("");
		ub.setBirthplace("");
		ub.setPhone("");
		ub.setSchool("");
		ub.setRoleId("4");				//roleId——1,DBA|2,普通管理员|3,普通用户|4,游客访问
		ub.setRemark("该游客很懒，什么都没有留下");
		ub.setValid(1);
		ub.setRegisterTime("");
		ub.setRegisterIp("");
		ub.setRecentTime("");
		ub.setRecentIp("");
		ub.setUpdateTime("");
		ILog.info("浏览用户["+userName+"]已经上线...");
		return ub;
	}
}
