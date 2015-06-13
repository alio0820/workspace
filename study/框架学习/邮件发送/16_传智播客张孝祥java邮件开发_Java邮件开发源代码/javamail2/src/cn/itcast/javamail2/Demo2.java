package cn.itcast.javamail2;

import java.io.FileInputStream;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.Message.RecipientType;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Demo2 {

	/**
	 * @param args add by zxx ,Feb 5, 2009
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");
		props.setProperty("mail.host", "smtp.qq.com");
		Session session = Session.getInstance(props,
				new Authenticator()
				{
					protected PasswordAuthentication getPasswordAuthentication()
					{
						return new PasswordAuthentication("450383731","9110#zhai");
					}
				}
		);//策略模式
		session.setDebug(true);
		
//		Message msg = new MimeMessage(session);
//		msg.setFrom(new InternetAddress("450383731@qq.com"));
//		msg.setSubject("中文主题");
//		msg.setRecipients(RecipientType.TO, 
//				InternetAddress.parse("wangjiuyingzui@163.com,itcast_test@sohu.com"));
//		msg.setContent("<span style='color:red'>中文呵呵呵</span>", "text/html;charset=gbk");
//		
//		
//		Transport.send(msg);
		
		Message msg = new MimeMessage(session,new FileInputStream("resource/demo3.eml"));
		Transport.send(msg,InternetAddress.parse("wangjiuyingzui@163.com"));
	}

}
