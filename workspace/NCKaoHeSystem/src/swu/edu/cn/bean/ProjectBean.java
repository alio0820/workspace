package swu.edu.cn.bean;
/**
 * 作者	韩东海
 * 日期	2012-05-09
 * 功能	该类是项目bean，封装了有关项目的所有信息
 */

public class ProjectBean {
	
	private String projectId;				//项目编号。。。。。这个还是个大问题，与评估主键组合
	private String projectName;				//项目名称
	
	private String evaluationId;			//考核主键
	private String evaluationContent;		//考核类型（评估重点项目）》》有evaluationId做外键到EvaluatonForm表中找
	
	
	private String leadDepartmentId;		//牵头部门编号》》evaluationId做外键到EvaluatonForm表中找
	private String leadDepartmentName;		//牵头部门名称》》由上述leadDepartmentId到Department表中查找
	
	private String resDepartmentId;			//责任部门编号
	private String resDepartmentName;		//责任部门名称，有resDepartmentId到Department表中查找
	
	private String separateLeader;			//分管领导名称
	private String evaContent;				//该项目考核类容
	
	private String isMoney;					//是否涉及资金，该字段取决于该项目属于哪个考核类型
	private double totalMoney;				//该项目涉及总资金
	private double currentFinish;			//当前完成（项目表中的）
	private String firstClassify;			//第一分类（工业项目）
	private String secondClassify;			//第二分类（铝镁工业）
	
//	
//	evaid
//	evaluationcontent
//	leaddepartmentid
//	leadDepName
//	ismoney
//	totalmoney
//	currfinish
//	projectid
//	projectname
//	resdepartmentid
//	resDepaName
//	separateleader
//	evacontent
//	firstclassify
	
	
	
	
	public String getLeadDepartmentId() {
		return leadDepartmentId;
	}
	public void setLeadDepartmentId(String leadDepartmentId) {
		this.leadDepartmentId = leadDepartmentId;
	}
	public String getLeadDepartmentName() {
		return leadDepartmentName;
	}
	public void setLeadDepartmentName(String leadDepartmentName) {
		this.leadDepartmentName = leadDepartmentName;
	}
	public String getProjectId() {
		return projectId;
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
	public String getSeparateLeader() {
		return separateLeader;
	}
	public void setSeparateLeader(String separateLeader) {
		this.separateLeader = separateLeader;
	}
	public String getEvaContent() {
		return evaContent;
	}
	public void setEvaContent(String evaContent) {
		this.evaContent = evaContent;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public double getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(double totalMoney) {
		this.totalMoney = totalMoney;
	}
	public double getCurrentFinish() {
		return currentFinish;
	}
	public void setCurrentFinish(double currentFinish) {
		this.currentFinish = currentFinish;
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
	

	
}
