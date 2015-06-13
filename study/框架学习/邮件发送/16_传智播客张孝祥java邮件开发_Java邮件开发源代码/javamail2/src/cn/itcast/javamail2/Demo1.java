package cn.itcast.javamail2;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Demo1 {

	/**
	 * @param args add by zxx ,Feb 5, 2009
	 */
	public static void main(String[] args) throws Exception{
		// TODO Auto-generated method stub
		Properties props = new Properties();
		props.setProperty("mail.smtp.auth", "true");
		props.setProperty("mail.transport.protocol", "smtp");
		Session session = Session.getInstance(props);
		session.setDebug(true);
		
		Message msg = new MimeMessage(session);
		msg.setText("�㻹����");
		msg.setFrom(new InternetAddress("wangjiuyingzui@163.com"));
	
		Transport transport = session.getTransport();
		transport.connect("smtp.163.com", 25, "wangjiuyingzui", "xingye");
		transport.sendMessage(msg,
				new Address[]{new InternetAddress("450383731@qq.com")});

		//transport.send(msg,new Address[]{new InternetAddress("itcast_test@sohu.com")});
		transport.close();
	}

}
