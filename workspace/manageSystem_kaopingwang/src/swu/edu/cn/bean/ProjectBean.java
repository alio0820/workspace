package swu.edu.cn.bean;

public class ProjectBean {
	
	private String firstClassify;			//项目的三级分类
	private String secondClassify;
	private String thirdClassify;
	
	private int projectID;						//项目编号，自增性
	private String ProjectName;					//项目名称
	private String leadDepartment;				//项目牵头部门
	private	String responsibleDepartment;		//项目责任部门
	private String leader;						//项目区分管领导
	
	private String expectTask;					//项目期望业绩
	private double currentProgress;				//当前完成比例
	private String comment;						//其他，考核指标，项目详情相关
	
	
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
	public String getThirdClassify() {
		return thirdClassify;
	}
	public void setThirdClassify(String thirdClassify) {
		this.thirdClassify = thirdClassify;
	}
	
	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public String getProjectName() {
		return ProjectName;
	}
	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public String getLeadDepartment() {
		return leadDepartment;
	}
	public void setLeadDepartment(String leadDepartment) {
		this.leadDepartment = leadDepartment;
	}
	public String getResponsibleDepartment() {
		return responsibleDepartment;
	}
	public void setResponsibleDepartment(String responsibleDepartment) {
		this.responsibleDepartment = responsibleDepartment;
	}
	public String getLeader() {
		return leader;
	}
	public void setLeader(String leader) {
		this.leader = leader;
	}
	public String getExpectTask() {
		return expectTask;
	}
	public void setExpectTask(String expectTask) {
		this.expectTask = expectTask;
	}
	public double getCurrentProgress() {
		return currentProgress;
	}
	public void setCurrentProgress(double currentProgress) {
		this.currentProgress = currentProgress;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	
	
	
}
