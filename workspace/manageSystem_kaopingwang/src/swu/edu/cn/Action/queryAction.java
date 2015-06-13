package swu.edu.cn.Action;

import java.util.List;
import swu.edu.cn.sql.ProjectManagement;
import swu.edu.cn.sql.SerachProjectRecord;

public class queryAction {
	private int departmentId;
	private String xiangmuname;
	private String wancheng;
	private String taskMonth;
	private List list;
	private ProjectManagement  pm=new  ProjectManagement();

	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}		
	public String getXiangmuname() {
		return xiangmuname;
	}
	public void setXiangmuname(String xiangmuname) {
		this.xiangmuname = xiangmuname;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	
	public String getWancheng() {
		return wancheng;
	}
	public void setWancheng(String wancheng) {
		this.wancheng = wancheng;
	}
	public String getTaskMonth() {
		return taskMonth;
	}
	public void setTaskMonth(String taskMonth) {
		this.taskMonth = taskMonth;
	}
	
	
	
	
	//按名称查询
	public String mingcheng(){
		pm.OpenDB();
		this.setList(pm.searchProjectByName(xiangmuname));
		pm.OpenDB();
		return "success";
	}
	
	//按责任部门名称查询
	public String bumen(){
		pm.OpenDB();
		this.setList(pm.searchProjectByDepartment(departmentId));
		pm.OpenDB();
		return "success";
	}
	
	//按责任部门完成情况查询
	public String wancheng(){
		double wancheng_d = Double.parseDouble(wancheng)/100.0;
		pm.OpenDB();
		this.setList(pm.searchProjectByProgress(departmentId,wancheng_d));
		pm.OpenDB();
		return "success";
	}
	
	//按未申报查询（责任部门ID，月份）
	public String weishenbao(){
		SerachProjectRecord sp = new SerachProjectRecord();
		int taskMonth_int = Integer.parseInt(taskMonth);
		sp.OpenDB();
		this.setList(sp.searchProjectByNoReport(departmentId,taskMonth_int));
		sp.OpenDB();
		return "success";
	}
	
	//按未审核查询（责任部门ID，月份）
	public String weishenhe(){
		SerachProjectRecord sp = new SerachProjectRecord();
		int taskMonth_int = Integer.parseInt(taskMonth);
		sp.OpenDB();
		this.setList(sp.searchProjectByReportFaild(departmentId,taskMonth_int));
		pm.OpenDB();
		return "success";
	}
}
