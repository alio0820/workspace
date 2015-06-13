package com.mail;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import java.io.IOException;
import java.util.Date;
import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

class MailAuthenticator extends Authenticator {
    private String MAIL_USER = "candong.zhai@cootek.cn";
    private String MAIL_PASSWORD = "Cdzhai12";
    public String getMAIL_USER() {
		return MAIL_USER;
	}
	public void setMAIL_USER(String mAIL_USER) {
		MAIL_USER = mAIL_USER;
	}
	public String getMAIL_PASSWORD() {
		return MAIL_PASSWORD;
	}
	public void setMAIL_PASSWORD(String mAIL_PASSWORD) {
		MAIL_PASSWORD = mAIL_PASSWORD;
	}
	public MailAuthenticator(){}
	public MailAuthenticator(String MAIL_USER,String MAIL_PASSWORD){
		this.MAIL_USER = MAIL_USER;
		this.MAIL_PASSWORD = MAIL_PASSWORD;
	}
	protected PasswordAuthentication getPasswordAuthentication() {
   	 return new PasswordAuthentication(MAIL_USER, MAIL_PASSWORD);
    }
}

public class SendMail {
    private String mailTo = null;    	//邮件接收者
    private String mailReply = null;    //邮件回复地址
    private String smtpHost = null;     //SMTP服务器
    private boolean debug = true;
    private String subject;             //邮件主题
    private String msgContent;        	//邮件内容
    private String messageContentMimeType = "text/html;charset=gb2312";    //邮件内容格式
   public String getMailTo() {
        return mailTo;
   }
   public void setMailTo(String mailTo) {
       this.mailTo = mailTo;
   }
   public String getSmtpHost() {
       return smtpHost;
    }
   public void setSmtpHost(String smtpHost) {
        this.smtpHost = smtpHost;
    }
   public boolean isDebug() {
        return debug;
    }
   public void setDebug(boolean debug) {
       this.debug = debug;
    }
   public String getSubject() {
        return subject;
    }
   public void setSubject(String subject) {
        this.subject = subject;
   }
   public String getMsgContent() {
        return msgContent;
    }
   public void setMsgContent(String msgContent) {
       this.msgContent = msgContent;
   }
   public String getMessageContentMimeType() {
       return messageContentMimeType;
   }
   public void setMessageContentMimeType(String messageContentMimeType) {
        this.messageContentMimeType = messageContentMimeType;
    }
   public void setMailReply(String mailReply) {
       this.mailReply = mailReply;
    }
   public String getMailReply() {
        return mailReply;
   }
    public SendMail(){}
    public SendMail(String smtpHost,String replyAddress,String mailTo,String subject,String content){
         this.smtpHost=smtpHost;
        this.mailReply=replyAddress;
        this.mailTo=mailTo;
        this.subject=subject;
        this.msgContent=content;
    }
    
    /**
     * 填充邮件相关信息Method
     * @param session
     * @param msg
     * @throws IOException
     * @throws MessagingException
     */
    private void fillMail(Session session, MimeMessage msg) throws IOException,
           MessagingException {
    	//MimeMultipart mPart = new MimeMultipart("mixed"); 			//两种方法都可实现
        Multipart mPart = new MimeMultipart();    						//模拟信息所需邮件内容方法的参数(全邮件)
        if (mailReply != null) {
            msg.setFrom(new InternetAddress(mailReply));
            System.out.println("发送人Mail地址：" + mailReply);
        } else {
            System.out.println("没有指定发送人邮件地址！");
            return;
        }
        if (mailTo != null) {
            InternetAddress[] address = InternetAddress.parse(mailTo);
           msg.setRecipients(Message.RecipientType.TO, address);
        } else {
            System.out.println("没有指定收件人邮件地址！");
            return;
        }
        msg.setSubject(subject);
        InternetAddress[] replyAddress = { new InternetAddress(mailReply) };
        msg.setReplyTo(replyAddress);
        //HtmlEmail email = new HtmlEmail();
        MimeBodyPart mBodyContent = new MimeBodyPart();    				//设置内容编码和内容(全文)        set
        MimeMultipart contentMulti = new MimeMultipart("related");		//用来存储文本和图片(正文)		 add
        MimeBodyPart htmlpart = new MimeBodyPart();
        
      //设置发送的内容
        htmlpart.setText("这是快捷回复的内容");
        htmlpart.setContent(this.getMsgContent(),messageContentMimeType);
        contentMulti.addBodyPart(htmlpart);
        mBodyContent.setContent(contentMulti,messageContentMimeType);
      //准备发送
        mPart.addBodyPart(mBodyContent);
        msg.setContent(mPart);
        msg.setSentDate(new Date());
        msg.saveChanges();
    }

    @SuppressWarnings("static-access")
    /**
     * 发送邮件的主方法
     */
    public int sendMail() throws IOException,MessagingException{

        Properties props = System.getProperties();    		//JavaMail需要Properties来创建一个session对象，其属性值就是发送邮件的主机
        props.put("mail.host", smtpHost);
        props.put("mail.smtp.auth", "true");
//        props.put("mail.transport.protocol", "smtp");//指定发送邮件协议
//        props.put("mail.smtp.port", 25);			  		//端口号
//        MailAuthenticator auth= new MailAuthenticator();
        SmtpAuth auth=new SmtpAuth();
        auth.getuserinfo("candong.zhai@cootek.cn",(new sun.misc.BASE64Encoder()).encode("Cdzhai12".getBytes())); 
        Session session=Session.getDefaultInstance(props,auth);    //创建session对象
        session.setDebug(debug);
        MimeMessage msg=new MimeMessage(session);    		//创建模拟邮件信息        
        Transport trans= null;                				//创建发送对象
        fillMail(session, msg);
//        msg.writeTo(new FileOutputStream("withAttachmentMail.eml"));		//保存邮件到本地
        try {
             trans=session.getTransport("smtp");
             trans.connect();
//            try {
//               trans.connect(smtpHost,auth.getMAIL_USER(),auth.getMAIL_PASSWORD());
//             } catch (AuthenticationFailedException e) {
//                e.printStackTrace();
//                 System.out.println("连接邮件服务器错误:");
//                return 3;
//             } catch (MessagingException e) {
//                e.printStackTrace();
//                System.out.println("连接邮件服务器错误:");
//                return 3;
//            }
             trans.send(msg);    //发送邮件
//            trans.close();
        } catch (MessagingException  e) {
             System.out.println("发送邮件失败：");
            e.printStackTrace();
        }finally{
             try {
                if (trans!=null&&trans.isConnected()) {
                    trans.close();
                }
            } catch (Exception e) {
                 System.out.println(e.toString());
            }
        }
//        System.out.println("发送邮件成功！");
        return 0;
     }
    
     /**
     * main方法测试
      * @param args
     */
    public static void main(String[] args) {
    	for(int i=0;i<1;i++){
    		System.out.println("正在发送第"+(i+1)+"封邮件");
	        SendMail sm=new SendMail();
	        sm.setSmtpHost("smtp.263.net");
	        sm.setMailReply("candong.zhai@cootek.cn");
	        sm.setMailTo("450383731@qq.com");
	        sm.setMsgContent("邮件学习稍微有点心得了");
	        sm.setSubject("测试邮件");
	        try {
	            sm.sendMail();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (MessagingException e) {
	             e.printStackTrace();
	        }
    	}
    }
    public void sendMailMethod(String stmphost,String mailreply,String mailto,String subject,String msgcontent){
    	SendMail sm=new SendMail();
        sm.setSmtpHost(stmphost);
        sm.setMailReply(mailreply);
        sm.setMailTo(mailto);
        sm.setSubject(subject);
        sm.setMsgContent(msgcontent);
        try {
            sm.sendMail();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (MessagingException e) {
             e.printStackTrace();
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