package com.citrus.info.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.citrus.info.service.treeInfoService;
import com.citrus.info.service.impl.treeInfoServiceImpl;
public  class treeInfoAction {

	public void  info(){//�в�������û�в����Ĳ��զ����ô����
		 try {
//			 String rootDir = treeInfoAction.class.getResource("treeInfoAction.class").toString();//��ȡ����ʱ�����·���������ڡ�.../Workspaces/.metadata/...��		 
//			 String curDir = System.getProperty("user.dir");                                      //��ȡ����ʱtomcat�е�·��
//			 String ClassMulu = this.getClass().getClassLoader().getResource("/").getPath();      //�⽫��ȡ ��classesĿ¼��ȫ·��
//			 String rootDir = treeInfoAction.class.getResource("").toString();
//			 String ddd = (Thread.currentThread().getContextClassLoader().getResource("")).toString();
//			 System.out.println(ddd);
			 
			 treeInfoService treeInfoService = new treeInfoServiceImpl();
			 HttpServletRequest request=ServletActionContext.getRequest();
//			 System.out.println(request.getContextPath());                                         // ��ȡ·��Ϊ��/CitrusSystem��
			 
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
		 long time = Long.parseLong(request.getParameter("time"));		 //��ȡʱ��
		 double temp = Double.valueOf(request.getParameter("temp"));	 //��ȡʪ��
		 String soilprop = request.getParameter("soilprop");			 //��ȡ����
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
