package com.citrus.JavaVM;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.management.ManagementFactory;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.sun.management.OperatingSystemMXBean;


public class Jvm extends HttpServlet implements Runnable{

	public LinkedList<JvmBean>  list;
	private double kb=1024.00;
	OperatingSystemMXBean osmxb;
	String osName;
	public Jvm() {
		super();
		list=new LinkedList<JvmBean>();
		osmxb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean(); 
		osName = System.getProperty("os.name");
	}

	public void destroy(){
		super.destroy();
	}

	public  void addInfo(){		
		JvmBean JB=new JvmBean();
		JB.totalJvmMemory=Runtime.getRuntime().totalMemory() /kb/ kb; 	//M
		JB.freeJvmMemory=Runtime.getRuntime().freeMemory() /kb/ kb; 
	    JB.maxJvmMemory = Runtime.getRuntime().maxMemory() / kb/kb; 	    
	    JB.totalPhysicalMemory = osmxb.getTotalPhysicalMemorySize() / kb/kb/kb;  //G
	    JB.freePhysicalMemory = osmxb.getFreePhysicalMemorySize() / kb/kb/kb; 		
	    if(list.size()<10)
	    	list.addFirst(JB);
	    else{
	    	list.removeLast();
	    	list.addFirst(JB);
	    }
	}

	public void run() {	
		int i=0;
		while(i++ <10){
		try{
			addInfo();	
//			Thread.sleep(3000);
			}catch(Exception e){
				e.printStackTrace();
			}			
		}
	}

	public void retu(){
		Jvm jvm=new Jvm();
		Thread myThread=new Thread(jvm);
		myThread.run();
		String responseText="";
	    for(int i=0;i<list.size();i++)
	    {
	    	JvmBean lk=list.get(i);
	    	String jm=""+i+";"+lk.freeJvmMemory+";"+lk.totalJvmMemory+";"+lk.maxJvmMemory+";"+lk.freePhysicalMemory+";"+lk.totalPhysicalMemory;	    	
	    	responseText=responseText+";"+jm;
	    }
	    System.out.println(responseText+"fdfd");
	    try {
	     HttpServletResponse response=ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=UTF-8");		 
		 PrintWriter out =response.getWriter(); 			 
		 out.print(responseText);    
		 out.flush();    
		 out.close();
	    } catch (IOException e) {
			e.printStackTrace();
		}
	}
	public void init() throws ServletException{	
		
	}

}
