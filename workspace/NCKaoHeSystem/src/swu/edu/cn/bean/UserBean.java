package swu.edu.cn.bean;
/**
 * 
 * 作者	 韩东海
 * 日期	2012-05-08
 * 功能	该bean为系统用户的详情bean
 */

public class UserBean {
	
	private	String userName;				//用户登录名
	private	String password;				//用户密码
	private	String realName;				//用户真实姓名
	
	private String	classesId;				//部门或者领导（编号）
	private	String	classesName;			//部门或者领导（非编号,非数据表userTable中元素，为Department中元素）
	
	private	String	emailAddress;			//用户邮箱
	private String	isLegal;				//用户是否合法
	
	
	
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getClassesId() {
		return classesId;
	}
	public void setClassesId(String classesId) {
		this.classesId = classesId;
	}
	public String getClassesName() {
		return classesName;
	}
	public void setClassesName(String classesName) {
		this.classesName = classesName;
	}
	public String getEmailAddress() {
		return emailAddress;
	}
	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}
	public String getIsLegal() {
		return isLegal;
	}
	public void setIsLegal(String isLegal) {
		this.isLegal = isLegal;
	}
	
		

}
