package com.mail; 
import java.util.*; 
import java.text.SimpleDateFormat; 
import javax.mail.*; 
import javax.mail.internet.*; 
import javax.activation.*; 
import java.io.*; 
public class MailBean { 


public static void sendMessage(String smtpHost,String from,String to,String subject,String messageText)throws MessagingException{ 
System.out.println("Configuring mail session for:"+smtpHost); 
SmtpAuth sa=new SmtpAuth(); 
sa.getuserinfo("candong.zhai@cootek.cn","Cdzhai12"); 
java.util.Properties props=new java.util.Properties(); 
props.put("mail.smtp.auth","true"); 
props.put("mail.smtp.host",smtpHost); 
System.out.println("Constructing message- from="+from+" to="+to); 
InternetAddress fromAddress=new InternetAddress(from); 
InternetAddress[] toAddresss=new InternetAddress[1]; 
toAddresss[0]=new InternetAddress("wangjiuyingzui@163.com"); 
int i=0; 
while(i<toAddresss.length){ 
Session mailSession=Session.getDefaultInstance(props,sa); 
MimeMessage testMessage=new MimeMessage(mailSession); 
testMessage.setFrom(fromAddress); 
testMessage.addRecipient(javax.mail.Message.RecipientType.TO,toAddresss[i]); 
testMessage.setSentDate(new java.util.Date()); 
testMessage.setSubject(subject); 
testMessage.setText(messageText); 
System.out.println("Message constructed"); 

Transport.send(testMessage); 
System.out.println("Message sent!"); 
i++; 
} 
} 

public static void main(String[] args){ 
String smtpHost="smtp.263.net"; 
String from="candong.zhai@cootek.cn"; 
String to="450383731@qq.com"; 
String subject="Test message"; 
StringBuffer theMessage=new StringBuffer(); 
theMessage.append("ddddhello22, "); 
theMessage.append("Hope all is well on you end. "); 
theMessage.append("Cheers"); 
try{ 
MailBean.sendMessage(smtpHost,from,to,subject,theMessage.toString()); 
}catch(javax.mail.MessagingException exc){ 
exc.printStackTrace(); 
} 
} 

static class SmtpAuth extends javax.mail.Authenticator { 
private String user,password; 

public void getuserinfo(String getuser,String getpassword){ 
user = getuser; 
password = getpassword; 
} 
protected javax.mail.PasswordAuthentication getPasswordAuthentication(){ 
return new javax.mail.PasswordAuthentication(user,password); 
} 
} 
} 