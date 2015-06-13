package cn.test;

import java.io.Console;
import java.io.IOException;

import cn.edu.ctgu.ghl.fetion.Contact;
import cn.edu.ctgu.ghl.fetion.Fetion;
import cn.edu.ctgu.ghl.fetion.FetionEvent;
import cn.edu.ctgu.ghl.fetion.IFetionEventListener;
import cn.edu.ctgu.ghl.fetion.ext.listener.GoogleTranslateListener;


public class ExampleMain {
	private static Fetion fetion = null;
	public static void main(String[] args) throws Exception{
		String mobile = null;
		String pwd = null;
		if(args==null || args.length<2){
			System.out.println("Usage: java -classpath .;%classpath%;..\\lib\\fetion.jar cn.test.ExampleMain mobile fetionpwd");
			Console cons = System.console();
			if(cons==null){
				return;
			}
			char[] passwd;
			mobile = cons.readLine("%s", "15123364298");
			
			if ((passwd = cons.readPassword("%s", "zcd1991"))!= null) {
				pwd = new String(passwd);
				java.util.Arrays.fill(passwd, ' ');
			 }
			//System.exit(1);
		}else{
			mobile = args[0].trim();
			pwd = args[1].trim();
		}
		//System.out.println("mobile:" + mobile);
		//System.out.println("password:" + pwd);
		
		fetion = new Fetion(mobile,pwd);
		fetion.addListener(new GoogleTranslateListener(fetion));
		fetion.addListener(new IFetionEventListener(){

			public void process(FetionEvent e) {
				if(e.getFirstLine()!=null 
					&& e.getFirstLine().startsWith("M")
					&& e.getBody()!=null){
					String uri = e.getHeader("F");
					String from = null;
					if("system-message".equals(e.getHeader("H"))){
						from = "system-message";
					}else{
						from = getPhoneByUri(uri);
						from = (from == null || from.isEmpty())? uri:from;
					}
					System.out.println("收到来自" + from + "的消息：" + e.getBody());
					fetion.sendSms2SelfPhone(from + ":" +e.getBody());
					if (e.getBody().trim().startsWith("cmd")) {
						//接收短信，然后执行短信中的命令 如：cmdshtdown -r -t 60 
						System.out.println("excute[" + e.getBody().trim().substring(3) + "]");
						try {
							Runtime.getRuntime().exec(e.getBody().trim().substring(3));
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}					
				}
			}
			
		});
		System.out.println("正在登录中(获取好友信息，根据好友多少需要等待)，请稍候.....");
		fetion.login();
		System.out.println("好友列表:\r\n");
		for (Contact cc : fetion.getContacts()) {
			System.out.println("####\r\n" + cc + "\r\n");
			fetion.sendSms(cc.getUri(), cc.getNickName() + "小乌龟对龟妈妈说:\"妈妈,有人给我发恶意短信了我回不回?\" 龟妈妈说?\"别上当啊,孩子!猪才回呢,是乌龟就不回\"");
		}
		System.out.println("☆login successful....☆");
		fetion.sendSms2SelfPhone("给自己发个试哈^_^...");
		//fetion.addBuddy("13487115***", "小猪");
		//fetion.logout();
	}
	
	private static String getPhoneByUri(String uri){
		String ret = uri;
		if(uri==null){
			return null;
		}
		for(Contact c: fetion.getContacts()){
			if(uri.equals(c.getUri())){
				ret = c.getPhoneNum() + "(" +c.getNickName() + ")";
				break;
			}
		}
		return ret;
	}
	
	
}
