package swu.edu.cn.bean;

public class SuggestionBean {
	
	private int suggestionId;
	private String userName;
	private String departmentId;
	private String leaderSuggestion;
	private String suggestionTime;
	private boolean flag;
	
	private String departmentName;
	private String realName;
	private String classes;
	
	private String projectid;
	private int month;
	
	public String getProjectid() {
		return projectid;
	}
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}

	
	public int getSuggestionId() {
		return suggestionId;
	}
	public void setSuggestionId(int suggestionId) {
		this.suggestionId = suggestionId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDepartmentId() {
		return departmentId;
	}
	public void setDepartmentId(String departmentId) {
		this.departmentId = departmentId;
	}
	public String getLeaderSuggestion() {
		return leaderSuggestion;
	}
	public void setLeaderSuggestion(String leaderSuggestion) {
		this.leaderSuggestion = leaderSuggestion;
	}
	public String getSuggestionTime() {
		return suggestionTime;
	}
	public void setSuggestionTime(String suggestionTime) {
		this.suggestionTime = suggestionTime;
	}
	public boolean isFlag() {
		return flag;
	}
	public void setFlag(boolean flag) {
		this.flag = flag;
	}

	
	public String getDepartmentName() {
		return departmentName;
	}
	public void setDepartmentName(String departmentName) {
		this.departmentName = departmentName;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public String getClasses() {
		return classes;
	}
	public void setClasses(String classes) {
		this.classes = classes;
	}

}
