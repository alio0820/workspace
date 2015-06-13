package com.citrus.info.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.citrus.info.service.treeInfoService;
import com.citrus.info.service.impl.treeInfoServiceImpl;
public  class treeInfoAction {

	public void  info(){//有参数的与没有参数的差别咋就这么大呢
		 try {
//			 String rootDir = treeInfoAction.class.getResource("treeInfoAction.class").toString();//获取运行时该类的路径，类似于“.../Workspaces/.metadata/...”		 
//			 String curDir = System.getProperty("user.dir");                                      //获取运行时tomcat中的路径
//			 String ClassMulu = this.getClass().getClassLoader().getResource("/").getPath();      //这将获取 到classes目录的全路径
//			 String rootDir = treeInfoAction.class.getResource("").toString();
//			 String ddd = (Thread.currentThread().getContextClassLoader().getResource("")).toString();
//			 System.out.println(ddd);
			 
			 treeInfoService treeInfoService = new treeInfoServiceImpl();
			 HttpServletRequest request=ServletActionContext.getRequest();
//			 System.out.println(request.getContextPath());                                         // 获取路径为“/CitrusSystem”
			 
			 HttpServletResponse response=ServletActionContext.getResponse();
			 String locate = request.getParameter("location");
//			 String treename = request.getParameter("tree");
//			 System.out.print(request.getParameter("name"));
			 String responseText=treeInfoService.info(locate,"1");
			 response.setContentType("text/html;charset=UTF-8");
			 
			 PrintWriter out =response.getWriter(); 			 
			 out.print(responseText);    
			 out.flush();    
			 out.close();
			 
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void juece() throws ClassNotFoundException, Exception{
		 treeInfoService treeInfoService = new treeInfoServiceImpl();
		 HttpServletRequest request=ServletActionContext.getRequest();
		 HttpServletResponse response=ServletActionContext.getResponse();
		 long time = Long.parseLong(request.getParameter("time"));		 //获取时间
		 double temp = Double.valueOf(request.getParameter("temp"));	 //获取湿度
		 String soilprop = request.getParameter("soilprop");			 //获取土质
		 System.out.println(soilprop);
		 soilprop=new String(soilprop.getBytes("ISO8859-1"),"UTF-8");
		 String responseText=treeInfoService.getDecide(time,soilprop,temp);
		 response.setContentType("text/html;charset=UTF-8");
		 PrintWriter out =response.getWriter();
		 out.print(responseText);
		 out.flush();    
		 out.close();
	}
	
}
