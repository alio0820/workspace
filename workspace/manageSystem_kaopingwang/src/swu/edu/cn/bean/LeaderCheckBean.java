package swu.edu.cn.bean;

public class LeaderCheckBean {
	
	private int  checkID;			//领导批示bean,自增。。。
	private String  realName;  			//领导的姓名
	
	
	private int projectID;
	private int taskMonth;		//月份为-1，表示对项目本身的批示，其他1-12表示对项目记录的批示
	
	private String leaderView;
	private String submitTime;
	
	//checkID,projectID,taskMonth,realName,leaderView,checkTime 
	
	
	public int getCheckID() {
		return checkID;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public void setCheckID(int checkID) {
		this.checkID = checkID;
	}

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
	public String getLeaderView() {
		return leaderView;
	}
	public void setLeaderView(String leaderView) {
		this.leaderView = leaderView;
	}
	public String getSubmitTime() {
		return submitTime;
	}
	public void setSubmitTime(String submitTime) {
		this.submitTime = submitTime;
	}
	
	
	
	

}
