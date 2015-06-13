package com.citrus.JavaVM;

import java.lang.management.ManagementFactory;
import com.sun.management.OperatingSystemMXBean;
import java.util.*;
import java.io.*;

public class SystemInformation implements Runnable{
	
	//�洢ϵͳ��Ϣ��Bean 
public class JvmBean {
	double totalJvmMemory;
    double freeJvmMemory; 
    double maxJvmMemory; 
    
//    String osName;
    double totalPhysicalMemory;
    double freePhysicalMemory;

}
	
	LinkedList<JvmBean>  list;			//�����д洢��ϵͳ��������Ϣ����ӡ��������
	private static double kb=1024.00;
	OperatingSystemMXBean osmxb;
	String osName;
	LinkedList<String>  list1;
	
	public SystemInformation() {
		list=new LinkedList<JvmBean>();
		list1=new LinkedList<String>();
		osmxb = (OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean(); 
		osName = System.getProperty("os.name");
	}
//	String osName = System.getProperty("os.name"); 
	
	
	public  void addInfo(){
		
		JvmBean JB=new JvmBean();
		JB.totalJvmMemory=Runtime.getRuntime().totalMemory() /kb/ kb; 	//M
		JB.freeJvmMemory=Runtime.getRuntime().freeMemory() /kb/ kb; 
	    JB.maxJvmMemory = Runtime.getRuntime().maxMemory() / kb/kb; 
	    
	    // �ܵ������ڴ� 
	    JB.totalPhysicalMemory = osmxb.getTotalPhysicalMemorySize() / kb/kb/kb;  //G
	    // ʣ��������ڴ� 
	    JB.freePhysicalMemory = osmxb.getFreePhysicalMemorySize() / kb/kb/kb; 
		
	    if(list.size()<20)
	    	list.addLast(JB);
	    else{
	    	list.removeFirst();
	    	list.addLast(JB);
	    }
	    //show();
	}


	public void run() {
		
		while(true){
			try{
				addInfo();
//				show();
				writeFile("d:\\SystemInformation.db", true);
				for(int i =0;i<100000;i++)
				{
					list1.add(new String("11223456897952522225222222222222222222222222222222222222222222222222222222222222"));
				}
				Thread.sleep(1000);
			}catch(InterruptedException e){
				e.printStackTrace();
			}
			
		}

		
	}
	
	public void show(){
		
		
		for(int i=0;i<list.size();i++){
			JvmBean lk=list.get(i);
			System.out.println(i);
			System.out.println("����ϵͳ����"+osName);
			System.out.println("ʣ��JVM�ڴ�"+lk.freeJvmMemory);
			System.out.println("�ܵ�JVM�ڴ�"+lk.totalJvmMemory);
			System.out.println("����JVM�ڴ�"+lk.maxJvmMemory);
			System.out.println("ʣ��������ڴ�"+lk.freePhysicalMemory);
			System.out.println("�ܵ������ڴ�"+lk.totalPhysicalMemory);
		}
	}
	
	
	
	public void writeFile(String path,  boolean append) {  //��������ŵ�һ���ļ���
        File writefile=null;
        try {
            // ͨ������������ж��Ƿ����ı��ļ���׷������

            writefile = new File(path);

            // ����ı��ļ��������򴴽���
            if (writefile.exists() == false) {
                writefile.createNewFile();
                writefile = new File(path); // ����ʵ����
            }
            
            String content="";
            String result="";
            for(int i=0;i<list.size();i++){		//�ѽ���ŵ�һ���ַ�������
				JvmBean lk=list.get(i);
				content=""+lk.freeJvmMemory+"\n"+lk.totalJvmMemory+"\n"+lk.maxJvmMemory+"\n"+lk.freePhysicalMemory+"\n"+lk.totalPhysicalMemory+"\n";
				result=result+content;
            }
            FileOutputStream fw = new FileOutputStream(writefile);   
            fw.write(result.getBytes());
            fw.flush();
            fw.close();
        } catch (Exception ex) {
            System.out.println(ex.getMessage());
        }

    }
	
	
	
}
