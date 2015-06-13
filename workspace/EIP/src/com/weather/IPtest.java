package com.weather;

import java.io.File;

//import junit.framework.TestCase;
public class IPtest{
      
    public String testIp(String ipAddress){
    	//指定纯真数据库的文件名，所在文件夹  
        IPSeeker ip=new IPSeeker("/Users/louis/software/qqwry.dat",this.getClass().getResource("").toString().substring(6).replace("%20", " "));
        
        //测试IP 58.20.43.13  
//        String address =ip.getIPLocation(ipAddress).getCountry()+":"+ip.getIPLocation(ipAddress).getArea();
        String address = ip.getIPLocation(ipAddress).getCountry().replaceAll("(^.*省|市$)","");
//        System.out.println(address);
        return address;
    }
    public static void main(String[] args){
    	System.out.println(new IPtest().testIp("218.25.251.170"));//116.226.24.118本地IP
    }
}