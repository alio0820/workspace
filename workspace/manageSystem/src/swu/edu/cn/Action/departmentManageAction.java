package swu.edu.cn.Action;

import java.util.List;

import swu.edu.cn.sql.DepartmentManagement;

public class departmentManageAction {
//	private List list;
	private DepartmentManagement departm;
	private String fenlei;
	private String departname;
	private String departfunction;
	
	
	public String getFenlei() {
		return fenlei;
	}
	public void setFenlei(String fenlei) {
		this.fenlei = fenlei;
	}
	public String getDepartname() {
		return departname;
	}
	public void setDepartname(String departname) {
		this.departname = departname;
	}
	public String getDepartfunction() {
		return departfunction;
	}
	public void setDepartfunction(String departfunction) {
		this.departfunction = departfunction;
	}
	
	public String  addDepart()
	{
		boolean succ= departm.insertDepartment(departname,fenlei,departfunction);
		if(succ==true)
			return "success";
		return "input";
	}
	
}
