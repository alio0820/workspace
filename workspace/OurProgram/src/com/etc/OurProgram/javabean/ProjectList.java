package com.etc.OurProgram.javabean;

import java.util.Date;

public class ProjectList {
  private int id;
  private String projectID;
  private String projectName;
  private String unit;
  private String pigeonholeLeader;    //当前设定为已知的值，具体需蔡佳伟的传值
  private String setupDate;
  private String stutas;
  private String pigeonholeType;
 private String assessor;
	private Date pigeonholeDate;
	private String auditingAttitude;
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
public String getUnit() {
	return unit;
}
public void setUnit(String unit) {
	this.unit = unit;
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
public String getStutas() {
	return stutas;
}
public void setStutas(String stutas) {
	this.stutas = stutas;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPigeonholeType() {
	return pigeonholeType;
}
public void setPigeonholeType(String pigeonholeType) {
	this.pigeonholeType = pigeonholeType;
}
public String getAssessor() {
	return assessor;
}
public void setAssessor(String assessor) {
	this.assessor = assessor;
}
public Date getPigeonholeDate() {
	return pigeonholeDate;
}
public void setPigeonholeDate(Date pigeonholeDate) {
	this.pigeonholeDate = pigeonholeDate;
}
public String getAuditingAttitude() {
	return auditingAttitude;
}
public void setAuditingAttitude(String auditingAttitude) {
	this.auditingAttitude = auditingAttitude;
}

}