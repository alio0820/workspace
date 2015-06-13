package swu.edu.cn.Action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;

import swu.edu.cn.bean.ProjectRecordBean;
import swu.edu.cn.sql.ProjectRecordManagement;

public class projectRecordManagementAction {
	private int projectId;
	private double rate;
	private String rate_string;
	private String actualFinish;
	private int taskMonth;
	private ProjectRecordManagement prm=new ProjectRecordManagement();
	private int departmentId;
	private String yijian;
	private String tongguo;
	
	public int getProjectId() {
		return projectId;
	}
	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getActualFinish() {
		return actualFinish;
	}
	public void setActualFinish(String actualFinish) {
		this.actualFinish = actualFinish;
	}
	public int getTaskMonth() {
		return taskMonth;
	}
	public void setTaskMonth(int taskMonth) {
		this.taskMonth = taskMonth;
	}
	public int getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}
	public String getYijian() {
		return yijian;
	}
	public void setYijian(String yijian) {
		this.yijian = yijian;
	}
	public String getTongguo() {
		return tongguo;
	}
	public void setTongguo(String tongguo) {
		this.tongguo = tongguo;
	}
	public String getRate_string() {
		return rate_string;
	}
	public void setRate_string(String rate_string) {
		this.rate_string = rate_string;
	}
	
	
	//项目申报
	public String shenbao() throws UnsupportedEncodingException{
		actualFinish =new String(actualFinish.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean succ = prm.ReportProjectRecord(projectId,taskMonth,actualFinish,rate);
		prm.CloseDB();
		if(succ==true)
			return "shenbao";
		return "input";
	}
	//按月提取出待申报的项目
	public String shenbao_yue(){
		prm.OpenDB();
		ArrayList<ProjectRecordBean> list= prm.getResponsibleDepartmentTask(departmentId,taskMonth,"null");
		prm.CloseDB();
		int succ = list.size();
		if(succ!=0)
			return "shenbao";
		return "input";
	}
	
	//牵头部门的审核
	public String shenheQiantou() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQiantou";
		return "input";
	}
	
	//区分管领导的审核
	public String shenheQianTouLeader() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouLeaderShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQianTouLeader";
		return "input";
	}
	
	//督查审核
	public String duchashenhe() throws UnsupportedEncodingException{
		rate = Double.parseDouble(rate_string); 
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		boolean succ = prm.DuchaShen(projectId,taskMonth,rate,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==false)
			return "duchashenhe";
		return "input";
	}
	
}
