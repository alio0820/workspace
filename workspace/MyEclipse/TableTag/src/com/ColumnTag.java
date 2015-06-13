package com;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import javax.servlet.jsp.tagext.Tag;


public class ColumnTag extends BodyTagSupport{

	private String name;

	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public int doStartTag() throws JspException {	
		
		Tag tag = this.getParent();
		TableTag tableTag = (TableTag)tag;
		Common common =  tableTag.getCommon();
		List list = common.getListColumn();
		if(!list.contains(name))
		list.add(name);
		
		return super.doStartTag();
	}
	
	
	
}
