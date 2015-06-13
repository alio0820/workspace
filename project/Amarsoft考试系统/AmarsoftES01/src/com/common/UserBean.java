package com.common;

public class UserBean {
	private String userId;				//用户ID
	private String userName;			//用户名
	private String nickName;			//用户昵称
	private String password;			//用户密码
	private String roleId;				//用户角色
	private String value1;				//预留属性
	private String value2;				//预留属性
	private String remark;				//备注
	private String valid;				//用户是否有效
	private String registerTime;		//注册时间
	private String registerIp;			//注册IP
	private String recentTime;			//最后登录时间
	private String recentIp;			//最后登录IP
	private String updateTime;			//更新时间
	private int orderPrice;				//订单价格
	private int addRice;				//是否加饭
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
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
	public String getValid() {
		return valid;
	}
	public void setValid(String valid) {
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
	public int getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	public int getAddRice() {
		return addRice;
	}
	public void setAddRice(int addRice) {
		this.addRice = addRice;
	}
	
	
}
