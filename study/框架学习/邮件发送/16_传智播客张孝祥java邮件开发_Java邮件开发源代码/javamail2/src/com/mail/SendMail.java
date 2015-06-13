package com.mail;


import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;


//�ʼ�������   1 package com.tg.email;

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
    public static String MAIL_PASSWORD = "9110#zhai"; //���룬����˵�˰�
    protected PasswordAuthentication getPasswordAuthentication() {
   	 return new PasswordAuthentication(MAIL_USER, MAIL_PASSWORD);
    }
    
}

public class SendMail {
    private String mailTo = null;    //�ʼ�������
     private String mailReply = null;    //�ʼ��ظ���ַ
     private String smtpHost = null;    //SMTP������
    private boolean debug = false;
     private String subject;            //�ʼ�����
     private String msgContent;        //�ʼ�����
     private String messageContentMimeType = "text/html;charset=gb2312";    //�ʼ����ݸ�ʽ
    /**
     * ����ʼ������ϢMethod
     * @param session
     * @param msg
     * @throws IOException
     * @throws MessagingException
     */
    private void fillMail(Session session, MimeMessage msg) throws IOException,
           MessagingException {
    	//MimeMultipart mPart = new MimeMultipart("mixed"); 			//���ַ�������ʵ��
        Multipart mPart = new MimeMultipart();    						//ģ����Ϣ�����ʼ����ݷ����Ĳ���(ȫ�ʼ�)
        if (mailReply != null) {
            msg.setFrom(new InternetAddress(mailReply));
            System.out.println("������Mail��ַ��" + mailReply);
        } else {
            System.out.println("û��ָ���������ʼ���ַ��");
            return;
        }
        if (mailTo != null) {
            InternetAddress[] address = InternetAddress.parse(mailTo);
           msg.setRecipients(Message.RecipientType.TO, address);
        } else {
            System.out.println("û��ָ���ռ����ʼ���ַ��");
            return;
        }
        msg.setSubject(subject);
        InternetAddress[] replyAddress = { new InternetAddress(mailReply) };
        msg.setReplyTo(replyAddress);
        //HtmlEmail email = new HtmlEmail();
        MimeBodyPart mBodyContent = new MimeBodyPart();    				//�������ݱ��������(ȫ��)        set
        MimeMultipart contentMulti = new MimeMultipart("related");		//�����洢�ı���ͼƬ(����)		 add
        MimeBodyPart attachment01  = new MimeBodyPart();    			//���ø���(����)					 set
        MimeBodyPart gifpart = new MimeBodyPart();
        MimeBodyPart htmlpart = new MimeBodyPart();
        
      //���÷��͵�����
        htmlpart.setText("����һ��ͼƬ��һ�����ֵ�����");
        htmlpart.setContent("<font color=red>����һ����Java�����Զ����ɵ��ʼ�������ظ���</font><img src='http://www.qqtu.com/g/2011/141/85512.gif'>",messageContentMimeType);
        contentMulti.addBodyPart(htmlpart);
        
      //�����ı��е�ͼƬ        
        //InputStream iss = new BufferedInputStream( new FileInputStream("resource\\logo.gif"));
        //DataHandler dh1 = new DataHandler(new ByteArrayDataSource(iss,"application/octet-stream"));//һ���������͵Ĵ����� ��ʼ����Ҫ����һ������Դ
        DataHandler gifhandler = new DataHandler(new FileDataSource("resource\\logo.gif"));
        gifpart.setDataHandler(gifhandler);
        gifpart.setContentID("<it315logo_gif>");
        //contentMulti.addBodyPart(gifpart);
        mBodyContent.setContent(contentMulti,messageContentMimeType);
        
      //���͸���
        DataSource gifDs = new FileDataSource(new File("resource\\slogo.gif"));      
        DataHandler gifDh = new DataHandler(gifDs);
        attachment01.setDataHandler(gifDh);
        attachment01.setFileName(MimeUtility.encodeText(gifDs.getName()));
        
      //׼������
        mPart.addBodyPart(mBodyContent);
        mPart.addBodyPart(attachment01);
        msg.setContent(mPart);
        msg.setSentDate(new Date());
        msg.saveChanges(); 
    }


    @SuppressWarnings("static-access")
    public int sendMail() throws IOException,MessagingException{

        Properties props = System.getProperties();    //JavaMail��ҪProperties������һ��session����������ֵ���Ƿ����ʼ�������
        props.put("mail.smtp.host", smtpHost);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", 25);			  //�˿ں�
        Authenticator auth= new MailAuthenticator();
        Session session=Session.getInstance(props,auth);    //����session����
        session.setDebug(debug);
        MimeMessage msg=new MimeMessage(session);    //����ģ���ʼ���Ϣ        
        Transport trans= null;                //�������Ͷ���
        fillMail(session, msg);
        msg.writeTo(new FileOutputStream("withAttachmentMail.eml"));		//�����ʼ�������
        try {
             trans=session.getTransport("smtp");
            try {

               trans.connect(smtpHost,MailAuthenticator.MAIL_USER, MailAuthenticator.MAIL_PASSWORD);

             } catch (AuthenticationFailedException e) {
                e.printStackTrace();
                 System.out.println("�����ʼ�����������:");
                return 3;
             } catch (MessagingException e) {
                e.printStackTrace();
                System.out.println("�����ʼ�����������:");
                return 3;
            }
            trans.send(msg);    //�����ʼ�
            trans.close();
        } catch (MessagingException  e) {
             System.out.println("�����ʼ�ʧ�ܣ�");
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
        System.out.println("�����ʼ��ɹ���");
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
     * main��������
      * @param args
     */
    public static void main(String[] args) {
        SendMail sm=new SendMail();
        sm.setSmtpHost("smtp.qq.com");
        sm.setMailReply("450383731@qq.com");
        sm.setMailTo("wangjiuyingzui@163.com");
        sm.setMsgContent("�ʼ�ѧϰ��΢�е��ĵ���");
        sm.setSubject("�����ʼ�");
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