package swu.edu.cn.bean;

public class ProjectMonthRecordBean {
//projectId	projectName	isMoney	totalProgress	departmentName	evaContent	taskMonth	status	monthFinish	monthMoney	monthProgress	submitTime	currentFinish	firstClassify	secondClassify
	
	private String projectId;				//项目编号。。。。。这个还是个大问题，与评估主键组合
	
	private String projectName;				//项目名称
	
	private String isMoney;					//是否涉及资金，该字段取决于该项目属于哪个考核类型
	
	private double totalProgress;			//该项目的进度
	
	
	private String resDepartmentId;			//责任部门编号
	private String resDepartmentName;		//责任部门名称，有resDepartmentId到Department表中查找
	
	private String evaluationId;			//考核主键
	private String evaluationContent;		//考核类型（评估重点项目）》》有evaluationId做外键到EvaluatonForm表中找
	
	private String projectEvaContent;			//该项目的考核；。。。
	
	private int evaMonth;					//考核月份

	private String monthFinish;				//月完成（事件描述）
	private double monthMoney;				//当月完成资金
	private double monthProgress;			//当月进度！
	
	private String submitTime;				//提交时间
	
	private String status;					//审核状态
	
	private	String firstView;				//一级意见（牵头部门）
	private String secondView;				//二级意见（区分管领导）
	private String thirdView;				//三级意见（督查室）
	
	
//	private String leadDepartmentId;		//牵头部门编号》》evaluationId做外键到EvaluatonForm表中找
//	private String leadDepartmentName;		//牵头部门名称》》由上述leadDepartmentId到Department表中查找
//	
//
//	
//	private String separateLeader;			//分管领导名称(在evaluationForm表中)
//	private String evaContent;				//该项目考核类容
//	
//
//	
//	private double totalMoney;				//该项目涉及总资金
//	private double currentFinish;			//当前完成（项目表中的）
//	
//	
//	private String firstClassify;			//第一分类（工业项目）
//	private String secondClassify;			//第二分类（铝镁工业）
	
	
	public String getProjectId() {
		return projectId;
	}
	public double getMonthMoney() {
		return monthMoney;
	}
	public void setMonthMoney(double monthMoney) {
		this.monthMoney = monthMoney;
	}
	public String getProjectEvaContent() {
		return projectEvaContent;
	}
	public void setProjectEvaContent(String projectEvaContent) {
		this.projectEvaContent = projectEvaContent;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public double getTotalProgress() {
		return totalProgress;
	}
	public void setTotalProgress(double totalProgress) {
		this.totalProgress = totalProgress;
	}
	public double getMonthProgress() {
		return monthProgress;
	}
	public void setMonthProgress(double monthProgress) {
		this.monthProgress = monthProgress;
	}
	public String getResDepartmentId() {
		return resDepartmentId;
	}
	public void setResDepartmentId(String resDepartmentId) {
		this.resDepartmentId = resDepartmentId;
	}
	public String getResDepartmentName() {
		return resDepartmentName;
	}
	public void setResDepartmentName(String resDepartmentName) {
		this.resDepartmentName = resDepartmentName;
	}
	public String getEvaluationId() {
		return evaluationId;
	}
	public void setEvaluationId(String evaluationId) {
		this.evaluationId = evaluationId;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public int getEvaMonth() {
		return evaMonth;
	}
	public void setEvaMonth(int evaMonth) {
		this.evaMonth = evaMonth;
	}
	public String getMonthFinish() {
		return monthFinish;
	}
	public void setMonthFinish(String monthFinish) {
		this.monthFinish = monthFinish;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFirstView() {
		return firstView;
	}
	public void setFirstView(String firstView) {
		this.firstView = firstView;
	}
	public String getSecondView() {
		return secondView;
	}
	public void setSecondView(String secondView) {
		this.secondView = secondView;
	}
	public String getThirdView() {
		return thirdView;
	}
	public void setThirdView(String thirdView) {
		this.thirdView = thirdView;
	}

	
	
	
	
}
