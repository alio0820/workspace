package com.etc.OurProgram.web.action;

import java.util.Date;
import java.util.List;

import com.etc.OurProgram.javabean.ProjectList;
import com.etc.OurProgram.service.ProjectService;
import com.etc.OurProgram.service.impl.ProjectServiceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectListAction extends ActionSupport{
	private int id;
    private int projectID;//对应的是MyRes.jsp传过来的值，实际上就是主键id
    private String projectName;
	private String pigeonholeLeader; 
	private String pigeonholeType;
	private String assessor;
	private Date pigeonholeDate;
	private String auditingAttitude;
	
	private List list;
	private ProjectService ProjectService;
 

	
	
	/**
	 * 查询项目负责人对应的项目
	 * @return
	 */
	
	public String queryUserList(){
		
		ProjectService = new ProjectServiceImpl();
		ProjectList pl=new ProjectList();
		pl.setId(projectID);
		pl.setPigeonholeLeader(pigeonholeLeader);
		/*pl.setPigeonholeType(pigeonholeType);
		pl.setAssessor(assessor);
		pl.setPigeonholeDate(pigeonholeDate);
		pl.setAuditingAttitude(auditingAttitude);*/
    	ActionContext.getContext().getSession().put("pigeonholeLeader", pigeonholeLeader);
		this.setList(ProjectService.queryUser(pl));
		return "succ";
	}
	

public String submit()
{
	ProjectService = new ProjectServiceImpl();
	ProjectList pl=new ProjectList();
	pigeonholeLeader=(String)ActionContext.getContext().getSession().get("pigeonholeLeader");
	pl.setId(projectID);
	pl.setPigeonholeLeader(pigeonholeLeader);
	this.setList(ProjectService.querySubmit(pl));
	 return "succ";
}
	
public String submitrecord(){	
	ProjectService = new ProjectServiceImpl();
	ProjectList pl=new ProjectList();
	pl.setId(projectID);
	this.setList(ProjectService.querySubmitRecord(pl));
	return "record";
}
	
	
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPigeonholeLeader() {
		return pigeonholeLeader;
	}


	public void setPigeonholeLeader(String pigeonholeLeader) {
		this.pigeonholeLeader = pigeonholeLeader;
	}

	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}
	
	public int getProjectID() {
		return projectID;
	}

	public void setProjectID(int projectID) {
		this.projectID = projectID;
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


	public String getProjectName() {
		return projectName;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}
