package com.message;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;
/**
 * ���ʵ�ֽ�������ͨ������ѷ��Ͷ���
 * @author leo
 * @date Mar 25, 2010 1:43:50 PM
 */
public class Fetion {


 public static void main(String[] args) throws IOException{
  String sUrl = "http://fetionAPI.appspot.com/api/?";
  String fromNo = "15123364298";//���Ͷ��ֻ�����
  String password = "zcd1991";//���ŵ�½����
  String toNo = "15123364298";//�����ֻ�����
  String msg = "���";//��������
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
  System.out.println("���ͳɹ�");
 }
}
