package swu.edu.cn.sql;

/*
 * author:handonghai
 * date:2012-3-29
 * 这是与数据库examsystem中表userinfo对应的Bean
 */
public class UserinfoBean {
	private	String id;
	private String flag;
	private String userName;
	private String singleChoice;
	private String multipleChoice;
	private String judgeIssues;
	private int score;
	private long StartTime;
	private long LastTime;
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getSingleChoice() {
		return singleChoice;
	}
	public void setSingleChoice(String singleChoice) {
		this.singleChoice = singleChoice;
	}
	public String getMultipleChoice() {
		return multipleChoice;
	}
	public void setMultipleChoice(String multipleChoice) {
		this.multipleChoice = multipleChoice;
	}
	public String getJudgeIssues() {
		return judgeIssues;
	}
	public void setJudgeIssues(String judgeIssues) {
		this.judgeIssues = judgeIssues;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public long getStartTime() {
		return StartTime;
	}
	public void setStartTime(long startTime) {
		StartTime = startTime;
	}
	public long getLastTime() {
		return LastTime;
	}
	public void setLastTime(long lastTime) {
		LastTime = lastTime;
	}
	
	
	
	
}
