package swu.edu.cn.bean;
/**
 * ����	������
 * ����	2012-05-09
 * ����	��������Ŀbean����װ���й���Ŀ��������Ϣ
 */

public class ProjectBean {
	
	private String projectId;				//��Ŀ��š���������������Ǹ������⣬�������������
	private String projectName;				//��Ŀ����
	
	private String evaluationId;			//��������
	private String evaluationContent;		//�������ͣ������ص���Ŀ��������evaluationId�������EvaluatonForm������
	
	
	private String leadDepartmentId;		//ǣͷ���ű�š���evaluationId�������EvaluatonForm������
	private String leadDepartmentName;		//ǣͷ�������ơ���������leadDepartmentId��Department���в���
	
	private String resDepartmentId;			//���β��ű��
	private String resDepartmentName;		//���β������ƣ���resDepartmentId��Department���в���
	
	private String separateLeader;			//�ֹ��쵼����
	private String evaContent;				//����Ŀ��������
	
	private String isMoney;					//�Ƿ��漰�ʽ𣬸��ֶ�ȡ���ڸ���Ŀ�����ĸ���������
	private double totalMoney;				//����Ŀ�漰���ʽ�
	private double currentFinish;			//��ǰ��ɣ���Ŀ���еģ�
	private String firstClassify;			//��һ���ࣨ��ҵ��Ŀ��
	private String secondClassify;			//�ڶ����ࣨ��þ��ҵ��
	
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
