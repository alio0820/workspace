package com.message;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
/**
 * 编程实现借助飞信通道，免费发送短信
 * @author leo
 * @date Mar 25, 2010 1:43:50 PM
 */
public class Fetion {


 public static void main(String[] args) throws IOException{
  String sUrl = "http://fetionAPI.appspot.com/api/?";
  String fromNo = "15123364298";//发送端手机号码
  String password = "zcd1991";//飞信登陆密码
  String toNo = "15123364298";//接收手机号码
  String msg = "你好";//发送内容
  sUrl += "from="+fromNo+"&pw="+password+"&to="+toNo+"&msg="+msg;
  System.out.println(sUrl);
  URL url = new URL(sUrl);
  URLConnection urlConn = url.openConnection();
  
  BufferedReader in = new BufferedReader(new InputStreamReader(urlConn.getInputStream(), "UTF-8"));
  String rets = "";
  if (in != null){
   for (String s = ""; (s = in.readLine()) != null;){
    rets = rets + s;
   }
  }
  
  in.close();
  System.out.println("Result : " + rets);
  System.out.println("发送成功");
 }
}
