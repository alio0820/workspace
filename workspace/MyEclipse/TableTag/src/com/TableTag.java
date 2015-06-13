package com;
import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;


public class TableTag extends BodyTagSupport {

	
	private Common common = new Common();
	
	
	private List items;
	
	private int pageSize;	
	
	public List getItems() {
		return items;
	}

	public void setItems(List items) {
		this.items = items;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	
	public Common getCommon() {
		return common;
	}

	@Override
	public int doStartTag() throws JspException {		
		
		return super.doStartTag();		
	}

	@Override
	public int doEndTag() throws JspException {
		
		try {
			common.getStr(pageContext,items);
		} catch (SecurityException e) {
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (NoSuchFieldException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return super.doEndTag();
	}
}
