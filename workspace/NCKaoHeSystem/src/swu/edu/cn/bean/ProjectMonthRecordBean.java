package swu.edu.cn.bean;

public class ProjectMonthRecordBean {
//projectId	projectName	isMoney	totalProgress	departmentName	evaContent	taskMonth	status	monthFinish	monthMoney	monthProgress	submitTime	currentFinish	firstClassify	secondClassify
	
	private String projectId;				//��Ŀ��š���������������Ǹ������⣬�������������
	
	private String projectName;				//��Ŀ����
	
	private String isMoney;					//�Ƿ��漰�ʽ𣬸��ֶ�ȡ���ڸ���Ŀ�����ĸ���������
	
	private double totalProgress;			//����Ŀ�Ľ���
	
	
	private String resDepartmentId;			//���β��ű��
	private String resDepartmentName;		//���β������ƣ���resDepartmentId��Department���в���
	
	private String evaluationId;			//��������
	private String evaluationContent;		//�������ͣ������ص���Ŀ��������evaluationId�������EvaluatonForm������
	
	private String projectEvaContent;			//����Ŀ�Ŀ��ˣ�������
	
	private int evaMonth;					//�����·�

	private String monthFinish;				//����ɣ��¼�������
	private double monthMoney;				//��������ʽ�
	private double monthProgress;			//���½��ȣ�
	
	private String submitTime;				//�ύʱ��
	
	private String status;					//���״̬
	
	private	String firstView;				//һ�������ǣͷ���ţ�
	private String secondView;				//������������ֹ��쵼��
	private String thirdView;				//��������������ң�
	
	
//	private String leadDepartmentId;		//ǣͷ���ű�š���evaluationId�������EvaluatonForm������
//	private String leadDepartmentName;		//ǣͷ�������ơ���������leadDepartmentId��Department���в���
//	
//
//	
//	private String separateLeader;			//�ֹ��쵼����(��evaluationForm����)
//	private String evaContent;				//����Ŀ��������
//	
//
//	
//	private double totalMoney;				//����Ŀ�漰���ʽ�
//	private double currentFinish;			//��ǰ��ɣ���Ŀ���еģ�
//	
//	
//	private String firstClassify;			//��һ���ࣨ��ҵ��Ŀ��
//	private String secondClassify;			//�ڶ����ࣨ��þ��ҵ��
	
	
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
