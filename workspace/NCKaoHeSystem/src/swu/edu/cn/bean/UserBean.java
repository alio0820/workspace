package swu.edu.cn.bean;
/**
 * 
 * ����	 ������
 * ����	2012-05-08
 * ����	��beanΪϵͳ�û�������bean
 */

public class UserBean {
	
	private	String userName;				//�û���¼��
	private	String password;				//�û�����
	private	String realName;				//�û���ʵ����
	
	private String	classesId;				//���Ż����쵼����ţ�
	private	String	classesName;			//���Ż����쵼���Ǳ��,�����ݱ�userTable��Ԫ�أ�ΪDepartment��Ԫ�أ�
	
	private	String	emailAddress;			//�û�����
	private String	isLegal;				//�û��Ƿ�Ϸ�
	
	
	
	
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
