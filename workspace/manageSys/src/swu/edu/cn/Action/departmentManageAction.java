package swu.edu.cn.Action;

import java.io.UnsupportedEncodingException;
import java.util.List;

import swu.edu.cn.sql.DepartmentManagement;
import swu.edu.cn.sql.ProjectRecordManagement;

public class departmentManageAction {
//	private List list;
	private DepartmentManagement departm;	
	private String fenlei;
	private String departname;
	private int departId;
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
	public int getDepartId() {
		return departId;
	}
	public void setDepartId(int departId) {
		this.departId = departId;
	}
	
	
	//添加部门
	public String  addDepart() throws UnsupportedEncodingException
	{
		fenlei=new String(fenlei.getBytes("ISO8859-1"),"UTF-8");
		departm =new DepartmentManagement();
		departm.OpenDB();
		boolean succ= departm.insertDepartment(departname,fenlei,departfunction);
		departm.CloseDB();
		if(succ==true)
			return "success";
		return "input";
	}
	//删除部门
	public String delDepart() throws UnsupportedEncodingException
	{
		departm =new DepartmentManagement();
		departm.OpenDB();
		int  succ= departm.deleteDepartment(departId);
		if(succ==1)
			return "success";
		return "input";
	}
}
