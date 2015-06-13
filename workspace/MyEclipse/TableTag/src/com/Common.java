package com;
import java.io.IOException;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;


public class Common {
	
	
	public  List<String> listColumn=  new ArrayList<String>();

	

	public List<String> getListColumn() {
		return listColumn;
	}

	public void setListColumn(List<String> listColumn) {
		this.listColumn = listColumn;
	}
	
	public void getStr(PageContext pageContext,List items) throws SecurityException, NoSuchFieldException, IllegalArgumentException, IllegalAccessException, IOException{
		StringBuffer outStr = new StringBuffer();;
		
		outStr.append("<table>");
		JspWriter out = pageContext.getOut();		
		
		if(items!=null){
			for(Object item:items){
				outStr.append("<tr>");
				Class c = item.getClass();
				for(String columnName:listColumn){
					Field f = c.getDeclaredField(columnName);
					f.setAccessible(true);
					outStr.append("<td>" + f.get(item) +"</td>");
				}
				outStr.append("</tr>");
			}
			
			
			
			
		}
		outStr.append("</table>");
		pageContext.getOut().write(outStr.toString());
		
	
		
		outStr = null;
	}
	
	
	
	
}
