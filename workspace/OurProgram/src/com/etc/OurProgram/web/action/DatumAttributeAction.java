package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.DatumAttributeServce;
import com.etc.OurProgram.service.UnitService;
import com.etc.OurProgram.service.impl.DatumAttributeServceImpl;
import com.etc.OurProgram.service.impl.UnitServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class DatumAttributeAction extends ActionSupport{
	private int id;
	private String datumAttribute;
	private List<Unit> list;



	/**
	 * 查询所有的项目责任单位
	 * @return
	 */
	public String showDatumAttribute(){
		
		DatumAttributeServce das=new DatumAttributeServceImpl();		
		list=das.queryDatumAttribute(); //此list为私有变量的list不能新建List list

		
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

	public String getDatumAttribute() {
		return datumAttribute;
	}

	public void setDatumAttribute(String datumAttribute) {
		this.datumAttribute = datumAttribute;
	}

}
