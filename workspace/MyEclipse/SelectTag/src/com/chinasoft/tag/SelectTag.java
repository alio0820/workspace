package com.chinasoft.tag;

import java.io.IOException;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

public class SelectTag extends BodyTagSupport {
	
	private List items;
	
	private String value;	

	public List getItems() {
		return items;
	}

	public void setItems(List items) {
		this.items = items;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
	
	@Override
	public int doStartTag() throws JspException {
		JspWriter out = pageContext.getOut();
		try {
			out.write("<select>");
			for(Object item :items){
				String option = "";
				if(item instanceof String){
					option = (String)item;					
				}else{
					option = item.toString();					
				}
				if(option.equals(value)){
					out.write("<option value='"+option+"' selected='selected'>"+option+"</option>");
					
				}else{
					out.write("<option value='"+option+"'>"+option+"</option>");
				}
			}
			out.write("</select>");
		} catch (IOException e) {

			e.printStackTrace();
		}
		
		
		return super.doStartTag();
	}

	
}
