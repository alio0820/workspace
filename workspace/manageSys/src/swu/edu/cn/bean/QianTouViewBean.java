package swu.edu.cn.bean;

public class QianTouViewBean {
	
	private	int projectID;			//��Ŀ����
	private int taskMonth;			//�����·�
	private String projectName;			//��Ŀ����
	private String responsibleDepartemntName;		//���β�������
	private String actualFinish;		//������Ŀ������������������
	private double rate;				//������Ŀ��ɱ�������double���ݺ���
	
	private String leadCompanyView;				//������˲��ŵ����
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
