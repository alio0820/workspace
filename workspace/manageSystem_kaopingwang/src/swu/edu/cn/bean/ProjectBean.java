package swu.edu.cn.bean;

public class ProjectBean {
	
	private String firstClassify;			//��Ŀ����������
	private String secondClassify;
	private String thirdClassify;
	
	private int projectID;						//��Ŀ��ţ�������
	private String ProjectName;					//��Ŀ����
	private String leadDepartment;				//��Ŀǣͷ����
	private	String responsibleDepartment;		//��Ŀ���β���
	private String leader;						//��Ŀ���ֹ��쵼
	
	private String expectTask;					//��Ŀ����ҵ��
	private double currentProgress;				//��ǰ��ɱ���
	private String comment;						//����������ָ�꣬��Ŀ�������
	
	
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
