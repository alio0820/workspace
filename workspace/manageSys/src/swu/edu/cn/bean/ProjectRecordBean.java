package swu.edu.cn.bean;

/**
 * 该bean用于显示公共的模块，显示所有的项目进展情况
 */
public class ProjectRecordBean {
	//#;5;斯瑞传动机械生产项目;研发基ddfdfd地项目;0.0;区委办;FT0
	private String firstClassify;			//项目的三级分类
	private String secondClassify;
	private String thirdClassify;
		
	private	int projectID;
	private String projectName;			//项目名称
	private String  comment;			//项目详情，包括项目要求，考核指标
	private  String leadDepartment;		//牵头部门
	private	String responsibleDepartment;		//项目责任部门
	private String leader;						//项目区分管领导	
	private String expectTask;					//项目期望业绩	
	private double currentProgress;		//当前累计进度
	
	

	private int taskMonth;				//任务月份
	private  String  actualFinish;			//当月完成事件记录
	private   double  rate;					//当月完成的比例
	
	
	private String status;				//项目记录状态
	
	private   String leadCompanyView;		//当status1=null是，三级部门的意见
	private  String separateLeaderView;
	private   String supervisionView;
	
	
	
	
	
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
	public int getTaskMonth() {
		return taskMonth;
	}
	public void setTaskMonth(int taskMonth) {
		this.taskMonth = taskMonth;
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
	public String getThirdClassify() {
		return thirdClassify;
	}
	public void setThirdClassify(String thirdClassify) {
		this.thirdClassify = thirdClassify;
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
	public int getProjectID() {
		return projectID;
	}
	public void setProjectID(int projectID) {
		this.projectID = projectID;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getLeadDepartment() {
		return leadDepartment;
	}
	public void setLeadDepartment(String leadDepartment) {
		this.leadDepartment = leadDepartment;
	}
	public double getCurrentProgress() {
		return currentProgress;
	}
	public void setCurrentProgress(double currentProgress) {
		this.currentProgress = currentProgress;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}

	
	

}
