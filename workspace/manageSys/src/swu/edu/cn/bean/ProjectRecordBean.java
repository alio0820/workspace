package swu.edu.cn.bean;

/**
 * ��bean������ʾ������ģ�飬��ʾ���е���Ŀ��չ���
 */
public class ProjectRecordBean {
	//#;5;˹�𴫶���е������Ŀ;�з���ddfdfd����Ŀ;0.0;��ί��;FT0
	private String firstClassify;			//��Ŀ����������
	private String secondClassify;
	private String thirdClassify;
		
	private	int projectID;
	private String projectName;			//��Ŀ����
	private String  comment;			//��Ŀ���飬������ĿҪ�󣬿���ָ��
	private  String leadDepartment;		//ǣͷ����
	private	String responsibleDepartment;		//��Ŀ���β���
	private String leader;						//��Ŀ���ֹ��쵼	
	private String expectTask;					//��Ŀ����ҵ��	
	private double currentProgress;		//��ǰ�ۼƽ���
	
	

	private int taskMonth;				//�����·�
	private  String  actualFinish;			//��������¼���¼
	private   double  rate;					//������ɵı���
	
	
	private String status;				//��Ŀ��¼״̬
	
	private   String leadCompanyView;		//��status1=null�ǣ��������ŵ����
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
