package com.mail;


import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


//邮件发送类   1 package com.tg.email;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;
import javax.mail.AuthenticationFailedException;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.internet.MimeUtility;
import javax.mail.util.ByteArrayDataSource;

class MailAuthenticator extends Authenticator {
	
    public static String MAIL_USER = "450383731@qq.com";
    public static String MAIL_PASSWORD = "9110#zhai"; //密码，不用说了吧
    protected PasswordAuthentication getPasswordAuthentication() {
   	 return new PasswordAuthentication(MAIL_USER, MAIL_PASSWORD);
    }
    
}

public class SendMail {
    private String mailTo = null;    //邮件接收者
     private String mailReply = null;    //邮件回复地址
     private String smtpHost = null;    //SMTP服务器
    private boolean debug = false;
     private String subject;            //邮件主题
     private String msgContent;        //邮件内容
     private String messageContentMimeType = "text/html;charset=gb2312";    //邮件内容格式
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
        MimeBodyPart attachment01  = new MimeBodyPart();    			//设置附件(附件)					 set
        MimeBodyPart gifpart = new MimeBodyPart();
        MimeBodyPart htmlpart = new MimeBodyPart();
        
      //设置发送的内容
        htmlpart.setText("这是一个图片和一段文字的例子");
        htmlpart.setContent("<font color=red>这是一封由Java程序自动生成的邮件，请勿回复！</font><img src='http://www.qqtu.com/g/2011/141/85512.gif'>",messageContentMimeType);
        contentMulti.addBodyPart(htmlpart);
        
      //设置文本中的图片        
        //InputStream iss = new BufferedInputStream( new FileInputStream("resource\\logo.gif"));
        //DataHandler dh1 = new DataHandler(new ByteArrayDataSource(iss,"application/octet-stream"));//一种数据类型的处理类 初始化需要传入一个数据源
        DataHandler gifhandler = new DataHandler(new FileDataSource("resource\\logo.gif"));
        gifpart.setDataHandler(gifhandler);
        gifpart.setContentID("<it315logo_gif>");
        //contentMulti.addBodyPart(gifpart);
        mBodyContent.setContent(contentMulti,messageContentMimeType);
        
      //发送附件
        DataSource gifDs = new FileDataSource(new File("resource\\slogo.gif"));      
        DataHandler gifDh = new DataHandler(gifDs);
        attachment01.setDataHandler(gifDh);
        attachment01.setFileName(MimeUtility.encodeText(gifDs.getName()));
        
      //准备发送
        mPart.addBodyPart(mBodyContent);
        mPart.addBodyPart(attachment01);
        msg.setContent(mPart);
        msg.setSentDate(new Date());
        msg.saveChanges(); 
    }


    @SuppressWarnings("static-access")
    public int sendMail() throws IOException,MessagingException{

        Properties props = System.getProperties();    //JavaMail需要Properties来创建一个session对象，其属性值就是发送邮件的主机
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", 25);			  //端口号
        Authenticator auth= new MailAuthenticator();
        Session session=Session.getInstance(props,auth);    //创建session对象
        session.setDebug(debug);
        MimeMessage msg=new MimeMessage(session);    //创建模拟邮件信息        
        Transport trans= null;                //创建发送对象
        fillMail(session, msg);
        msg.writeTo(new FileOutputStream("withAttachmentMail.eml"));		//保存邮件到本地
        try {
             trans=session.getTransport("smtp");
            try {

               trans.connect(smtpHost,MailAuthenticator.MAIL_USER, MailAuthenticator.MAIL_PASSWORD);

             } catch (AuthenticationFailedException e) {
                e.printStackTrace();
                 System.out.println("连接邮件服务器错误:");
                return 3;
             } catch (MessagingException e) {
                e.printStackTrace();
                System.out.println("连接邮件服务器错误:");
                return 3;
            }
            trans.send(msg);    //发送邮件
            trans.close();
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
        System.out.println("发送邮件成功！");
        return 0;
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
     * main方法测试
      * @param args
     */
    public static void main(String[] args) {
        SendMail sm=new SendMail();
        sm.setSmtpHost("smtp.qq.com");
        sm.setMailReply("450383731@qq.com");
        sm.setMailTo("wangjiuyingzui@163.com");
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

}