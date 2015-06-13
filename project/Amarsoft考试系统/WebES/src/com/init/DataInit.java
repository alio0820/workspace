package com.init;

import java.io.File;
import java.util.Enumeration;
import java.util.HashMap;
import javax.servlet.http.HttpServlet;

import com.common.ILog;

public class DataInit extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static HashMap<String,String> params = new HashMap<String,String>();
	
	public void init() {
		ILog.init("初始化数据...");
//		ServletContext application=this.getServletContext();
		String res = this.getInitParameter("res");
		
		Enumeration<String> param =this.getInitParameterNames();
		while(param.hasMoreElements()){
			String item = param.nextElement();
			String itemPath = this.getInitParameter(item);
			itemPath = itemPath.replace("$res", res);
			File file =new File(item);
			if(!file.exists()&&!file.isDirectory()){       
			    file .mkdir();
			}
			params.put(item, itemPath);
//			application.setAttribute(item,itemPath);
			ILog.init("初始化参数: ["+item+"] = "+itemPath);
		}
		ILog.init("初始化JBO..."); 
		try {
			JBOFactory.init(params.get("bean"));
		} catch (Exception e) {
			ILog.error(e,"初始化JBO出错");
		}
	}
	
	public static String getParam(String param){
		return params.get(param);
	}

}
