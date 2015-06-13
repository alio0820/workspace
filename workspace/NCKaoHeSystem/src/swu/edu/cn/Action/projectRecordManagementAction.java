package swu.edu.cn.Action;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import swu.edu.cn.sql.ProjectManagement;

public class projectRecordManagementAction {
	private String  projectId;			//项目ID
	private double rate;				//进度
	private	String isMoney;				//是否用资金表示
	private String rate_string;			//获取到的进度String型
	private String actualFinish;		//具体事项
	private int taskMonth;				//任务月份
	private ProjectManagement prm=new ProjectManagement();
	private String departmentId;			
	private String yijian;
	private String tongguo;
		
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
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
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
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
		double money = Double.parseDouble(rate_string);
		rate = Double.parseDouble(rate_string)/100;
		boolean succ = prm.ReportProjectRecord(projectId, taskMonth, isMoney,rate, money, actualFinish);

		prm.CloseDB();
		if(succ==true)
			return "shenbao";
		return "input";
	}
	public String shenbao_feixm() throws UnsupportedEncodingException{
		actualFinish =new String(actualFinish.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean succ = prm.ReportNoProjectRecord(departmentId,projectId,taskMonth,actualFinish);
		prm.CloseDB();
		if(succ==true)
			return "shenbao";
		return "input";
	}
	//按月提取出待申报的项目
	public String shenbao_yue(){
		return "shenbao";
	}
	
	//牵头部门的审核---项目指标
	public String shenheQiantou() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.LeadDepartmentShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQiantou";
		return "input";
	}
	
	//牵头部门的审核---对非项目指标
	public String shenheQiantou_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.LeadDepartmentShen(projectId,departmentId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "shenheQiantou";
		return "input";
	}
	//区分管领导的审核
	public String qufenguan() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouLeaderShen(projectId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "qufenguan";
		return "input";
	}
	//区分管领导的审核----非项目指标
	public String qufenguan_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.QianTouLeaderNoProjectShen(projectId,departmentId,taskMonth,yijian,tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "qufenguan";
		return "input";
	}
	//督查审核---项目
	public String duchashenhe() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		boolean succ = prm.DuchaShen(projectId, taskMonth, isMoney, yijian, tonguoBoolean);
		prm.CloseDB();
		if(succ==false)
			return "duchashenhe";
		return "input";
	}
	//督查审核---非项目
	public String duchashenhe_feixm() throws UnsupportedEncodingException{
		yijian =new String(yijian.getBytes("ISO8859-1"),"UTF-8");
		prm.OpenDB();
		boolean tonguoBoolean = tongguo.equals("T");
		int succ = prm.DuchaNoProjectShen(projectId, departmentId, taskMonth, yijian, tonguoBoolean);
		prm.CloseDB();
		if(succ==1)
			return "duchashenhe";
		return "input";
	}
}
