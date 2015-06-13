package swu.edu.cn.bean;
/**
 * 
 * 作者	 韩东海
 * 日期	2012-05-08
 * 功能	该bean为部门的详情bean
 */

public class DepartmentBean {
	private String departmentId;		//部门编号
	private String departmentName;		//部门名称
	private String firstClassify;		//部门分类（区级、园区、乡镇街道）
	private String secondClassify;		//小类（用于打印）
	private String fuctions;			//部门职能
	private int number;					//同类编号，相同编号将在同一个table中显示，这个是为了显示的方便加上的，非必须的
	
	
	
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
