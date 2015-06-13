package com.citrus.info.action;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

public class jvmAction {

	public void jvmInfo() throws IOException{
		String responseText = "";
		File fl = new File("d:\\SystemInformation.db");
	    try{
			 if(!fl.exists())
			 {
				 fl.createNewFile();
				 FileWriter fw = new FileWriter("d:\\SystemInformation.db");
	             fw.write("0");
	             fw.close();
			 }
			 FileReader fr = new FileReader("d:\\SystemInformation.db");//也可以用fr直接读的fr.read();
			 BufferedReader br =new BufferedReader(fr);
			// FileInputStream fis = new FileInputStream("c:\\SystemInformation.db");
			 for(int i=0;i<20;i++){
			 double msg1 =Double.parseDouble(br.readLine());
			 double msg2 =Double.parseDouble(br.readLine());
			 double msg3 =Double.parseDouble(br.readLine());
			 double msg4 =Double.parseDouble(br.readLine())/2;
			 double msg5 =Double.parseDouble(br.readLine());
			 msg1=msg1/msg2;
			 responseText+=msg1+";"+msg2+";"+msg3+";"+msg4+";"+msg5+";";
			 }
			 br.close();//关闭BufferedReader对象 
			 fr.close();//关闭文件
		    }catch(Exception e){
		    	e.printStackTrace();
		    }
	     HttpServletResponse response=ServletActionContext.getResponse();
		 response.setContentType("text/html;charset=UTF-8");		 
		 PrintWriter out =response.getWriter(); 			 
		 out.print(responseText);    
		 out.flush();    
		 out.close();
	}
}
