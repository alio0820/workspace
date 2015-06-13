package com.etc.OurProgram.javabean;

public class fileUser {

	private String id;
	private String projectID;
	private String projectName;
	private String pigeonholeLeader;
	private String setupDate;
	private String submitDate;
	private String assessor;
	private String auditingAttitude;
	private String description;
	public String getAssessor() {
		return assessor;
	}
	public void setAssessor(String assessor) {
		this.assessor = assessor;
	}
	public String getAuditingAttitude() {
		return auditingAttitude;
	}
	public void setAuditingAttitude(String auditingAttitude) {
		this.auditingAttitude = auditingAttitude;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getProjectID() {
		return projectID;
	}
	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getPigeonholeLeader() {
		return pigeonholeLeader;
	}
	public void setPigeonholeLeader(String pigeonholeLeader) {
		this.pigeonholeLeader = pigeonholeLeader;
	}
	public String getSetupDate() {
		return setupDate;
	}
	public void setSetupDate(String setupDate) {
		this.setupDate = setupDate;
	}
	public String getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
