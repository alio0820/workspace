package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.UnitService;
import com.etc.OurProgram.service.impl.UnitServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class UnitAction extends ActionSupport{
private int id;
private String unitName;
private List<Unit> list;



/**
 * 查询所有的项目责任单位
 * @return
 */
public String showUnit(){
	
	UnitService us=new UnitServiceImpl();		
	list=us.queryUnit();  //此ist为私有变量的list不能新建List list

	
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
public String getUnitName() {
	return unitName;
}
public void setUnitName(String unitName) {
	this.unitName = unitName;
}


}
