package com.weather;

import java.io.File;

//import junit.framework.TestCase;
public class IPtest{
      
    public String testIp(String ipAddress){
    	//ָ���������ݿ���ļ����������ļ���  
        IPSeeker ip=new IPSeeker("/Users/louis/software/qqwry.dat",this.getClass().getResource("").toString().substring(6).replace("%20", " "));
        
        //����IP 58.20.43.13  
//        String address =ip.getIPLocation(ipAddress).getCountry()+":"+ip.getIPLocation(ipAddress).getArea();
        String address = ip.getIPLocation(ipAddress).getCountry().replaceAll("(^.*ʡ|��$)","");
//        System.out.println(address);
        return address;
    }
    public static void main(String[] args){
    	System.out.println(new IPtest().testIp("218.25.251.170"));//116.226.24.118����IP
    }
}