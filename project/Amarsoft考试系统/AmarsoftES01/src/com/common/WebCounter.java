package com.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;


public class WebCounter {

	
	File  TempFile;			//存储计数器基数的问；初始值要从中取出，终值要存入！！！
	
	public  WebCounter(){}
	
	public WebCounter(File  TempFile){
		this.TempFile=TempFile;
	}
	
	
	public  int  getInitNumber()  {		//服务器初始化时从文件中获取初始值
		
		 try {
			BufferedReader bw = new BufferedReader(new FileReader(TempFile));
			String line=bw.readLine(); 
			if(line==null||line.equals(""))
				return  0;
			else
				return  Integer.parseInt(line);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return 0;
		}

	}
	
	
	public  void  setDestroyNumber(int  num){			//服务器关闭时把当前计数器的值放入文件中存储
		
	      try {   
	            FileWriter fw=new FileWriter(TempFile,false);   
	            PrintWriter pw=new PrintWriter(fw);   
	            pw.print(num);
	            pw.close();     
	            fw.close();   
	        } catch (IOException e) {   
	            // TODO Auto-generated catch block   
	            e.printStackTrace();   
	        } 
		
		
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		WebCounter  wc=new WebCounter(new File("d:/num.txt"));
		
		wc.setDestroyNumber(100);
		//System.out.print(wc.getInitNumber());

	}

}
