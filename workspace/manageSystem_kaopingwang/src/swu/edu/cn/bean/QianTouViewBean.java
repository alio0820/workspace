package swu.edu.cn.bean;

public class QianTouViewBean {
	
	private	int projectID;			//项目主键
	private int taskMonth;			//任务月份
	private String projectName;			//项目名称
	private String responsibleDepartemntName;		//责任部门名称
	private String actualFinish;		//该月项目完成情况，用文字描述
	private double rate;				//该月项目完成比例，用double数据衡量
	
	private String leadCompanyView;				//三级审核部门的意见
	private String separateLeaderView;
	private String supervisionView;

	

	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public int getTaskMonth() {
		return taskMonth;
	}
	public void setTaskMonth(int taskMonth) {
		this.taskMonth = taskMonth;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getResponsibleDepartemntName() {
		return responsibleDepartemntName;
	}
	public void setResponsibleDepartemntName(String responsibleDepartemntName) {
		this.responsibleDepartemntName = responsibleDepartemntName;
	}
	public String getActualFinish() {
		return actualFinish;
	}
	public void setActualFinish(String actualFinish) {
		this.actualFinish = actualFinish;
	}
	public double getRate() {
		return rate;
	}
	public void setRate(double rate) {
		this.rate = rate;
	}
	public String getLeadCompanyView() {
		return leadCompanyView;
	}
	public void setLeadCompanyView(String leadCompanyView) {
		this.leadCompanyView = leadCompanyView;
	}
	public String getSeparateLeaderView() {
		return separateLeaderView;
	}
	public void setSeparateLeaderView(String separateLeaderView) {
		this.separateLeaderView = separateLeaderView;
	}
	public String getSupervisionView() {
		return supervisionView;
	}
	public void setSupervisionView(String supervisionView) {
		this.supervisionView = supervisionView;
	}

	
	
}
