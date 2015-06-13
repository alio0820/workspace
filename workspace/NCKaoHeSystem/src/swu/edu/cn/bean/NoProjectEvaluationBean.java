package swu.edu.cn.bean;
/**
 *作者	韩东海
 *日期	2012-05-09
 *功能	该bean是无项目评估bean，即某部门在考核内，但该部门没有承担任何项目
 *该bean需连接NoProjectEvaluation表和EvaluationForm表
 *
 */

public class NoProjectEvaluationBean {
	
	private String evaluationId;			//考核主键
	private String evaluationContent;		//考核类型（重点项目）
	
	private String leadDepartmentId;		//牵头部门编号
	private String leadDepartmentName;		//牵头部门名称
	
	private String evaDepartmentId;			//被考核部门编号
	private String evaDepartmentName;		//被考核部门
		
	
	private int evaMonth;					//考核月份
	private String monthFinish;				//月完成（事件描述）
	private String submitTime;				//提交时间
	
	private String status;					//审核状态
	
	private	String firstView;				//一级意见（牵头部门）
	private String secondView;				//二级意见（区分管领导）
	private String thirdView;				//三级意见（督查室）
	
	
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
	public String getEvaDepartmentId() {
		return evaDepartmentId;
	}
	public void setEvaDepartmentId(String evaDepartmentId) {
		this.evaDepartmentId = evaDepartmentId;
	}
	public String getEvaDepartmentName() {
		return evaDepartmentName;
	}
	public void setEvaDepartmentName(String evaDepartmentName) {
		this.evaDepartmentName = evaDepartmentName;
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
