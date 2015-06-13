package com.citrus.JavaVM;

import java.lang.management.ManagementFactory;
import com.sun.management.OperatingSystemMXBean;
import java.util.*;
import java.io.*;

public class SystemInformation implements Runnable{
	
	//存储系统信息的Bean 
public class JvmBean {
	double totalJvmMemory;
    double freeJvmMemory; 
    double maxJvmMemory; 
    
//    String osName;
    double totalPhysicalMemory;
    double freePhysicalMemory;

}
	
	LinkedList<JvmBean>  list;			//队列中存储的系统的最新信息，打印出来即可
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
	    
	    // 总的物理内存 
	    JB.totalPhysicalMemory = osmxb.getTotalPhysicalMemorySize() / kb/kb/kb;  //G
	    // 剩余的物理内存 
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
			System.out.println("操作系统名称"+osName);
			System.out.println("剩余JVM内存"+lk.freeJvmMemory);
			System.out.println("总的JVM内存"+lk.totalJvmMemory);
			System.out.println("最大的JVM内存"+lk.maxJvmMemory);
			System.out.println("剩余的物理内存"+lk.freePhysicalMemory);
			System.out.println("总的物理内存"+lk.totalPhysicalMemory);
		}
	}
	
	
	
	public void writeFile(String path,  boolean append) {  //将检测结果放到一个文件里
        File writefile=null;
        try {
            // 通过这个对象来判断是否向文本文件中追加内容

            writefile = new File(path);

            // 如果文本文件不存在则创建它
            if (writefile.exists() == false) {
                writefile.createNewFile();
                writefile = new File(path); // 重新实例化
            }
            
            String content="";
            String result="";
            for(int i=0;i<list.size();i++){		//把结果放到一个字符串里面
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
