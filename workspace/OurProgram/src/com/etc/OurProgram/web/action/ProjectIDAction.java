package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.ProjectIDServce;
import com.etc.OurProgram.service.UnitService;
import com.etc.OurProgram.service.impl.ProjectIDServceImpl;
import com.etc.OurProgram.service.impl.UnitServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectIDAction extends ActionSupport{
	private int id;
	private String projectID;
	private List<Unit> list;



	/**
	 * 查询所有的项目责任单位
	 * @return
	 */
	public String showProjectID(){
		
		ProjectIDServce ps=new ProjectIDServceImpl();		
		list=ps.queryProjectID(); //此ist为私有变量的list不能新建List list
		
		if(list.size()!=0)
			return "suce";
		else
		{
			return "INPUT";
		}
		
	}









	public List<Unit> getList() {
		return list;
	}
	public void setList(List<Unit> list) {
		this.list = list;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}
	

}
