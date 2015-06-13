package com.common;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;


public class WebCounter {

	
	File  TempFile;			//�洢�������������ʣ���ʼֵҪ����ȡ������ֵҪ���룡����
	
	public  WebCounter(){}
	
	public WebCounter(File  TempFile){
		this.TempFile=TempFile;
	}
	
	
	public  int  getInitNumber()  {		//��������ʼ��ʱ���ļ��л�ȡ��ʼֵ
		
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
	
	
	public  void  setDestroyNumber(int  num){			//�������ر�ʱ�ѵ�ǰ��������ֵ�����ļ��д洢
		
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
