package swu.edu.cn.bean;

/**
 * 
 * 作者	 韩东海
 * 日期	2012-05-08
 * 功能	该bean为评估表的详情bean
 */
public class EvaluationBean {
	
	private String evaluationId;
	private String evaluationContent;		//考核内容
	private String leadDepartmentId;		//牵头部门编号
	private String leadDepartmentName;		//牵头部门名称
	
	private String evaluationStandard;		//考核标准
	private String separateLeader;			//该牵头部门的分管领导
	
	private String isMoney;					//是否涉及资金
	private float totalMoney;				//涉及总资金
	private String currentFinish;			//当前完成，如果涉及资金，用资金描述，无资金由牵头部门填写
	
	
	
	
	public String getSeparateLeader() {
		return separateLeader;
	}
	public void setSeparateLeader(String separateLeader) {
		this.separateLeader = separateLeader;
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
	public String getEvaluationStandard() {
		return evaluationStandard;
	}
	public void setEvaluationStandard(String evaluationStandard) {
		this.evaluationStandard = evaluationStandard;
	}
	public String getIsMoney() {
		return isMoney;
	}
	public void setIsMoney(String isMoney) {
		this.isMoney = isMoney;
	}
	public float getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(float totalMoney) {
		this.totalMoney = totalMoney;
	}
	public String getCurrentFinish() {
		return currentFinish;
	}
	public void setCurrentFinish(String currentFinish) {
		this.currentFinish = currentFinish;
	}
	
	
	
	
	
	
	
	

}
