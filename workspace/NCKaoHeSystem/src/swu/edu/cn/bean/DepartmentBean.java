package swu.edu.cn.bean;
/**
 * 
 * ����	 ������
 * ����	2012-05-08
 * ����	��beanΪ���ŵ�����bean
 */

public class DepartmentBean {
	private String departmentId;		//���ű��
	private String departmentName;		//��������
	private String firstClassify;		//���ŷ��ࣨ������԰��������ֵ���
	private String secondClassify;		//С�ࣨ���ڴ�ӡ��
	private String fuctions;			//����ְ��
	private int number;					//ͬ���ţ���ͬ��Ž���ͬһ��table����ʾ�������Ϊ����ʾ�ķ�����ϵģ��Ǳ����
	
	
	
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getFirstClassify() {
		return firstClassify;
	}
	public void setFirstClassify(String firstClassify) {
		this.firstClassify = firstClassify;
	}
	public String getSecondClassify() {
		return secondClassify;
	}
	public void setSecondClassify(String secondClassify) {
		this.secondClassify = secondClassify;
	}

	public String getFuctions() {
		return fuctions;
	}
	public void setFuctions(String fuctions) {
		this.fuctions = fuctions;
	}
	public int getNumber() {
		return number;
	}
	public void setNumber(int number) {
		this.number = number;
	}
	
}
