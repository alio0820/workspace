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
    private String mailTo = null;    	//�ʼ�������
    private String mailReply = null;    //�ʼ��ظ���ַ
    private String smtpHost = null;     //SMTP������
    private boolean debug = true;
    private String subject;             //�ʼ�����
    private String msgContent;        	//�ʼ�����
    private String messageContentMimeType = "text/html;charset=gb2312";    //�ʼ����ݸ�ʽ
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
        MimeBodyPart htmlpart = new MimeBodyPart();
        
      //���÷��͵�����
        htmlpart.setText("���ǿ�ݻظ�������");
        htmlpart.setContent(this.getMsgContent(),messageContentMimeType);
        contentMulti.addBodyPart(htmlpart);
        mBodyContent.setContent(contentMulti,messageContentMimeType);
      //׼������
        mPart.addBodyPart(mBodyContent);
        msg.setContent(mPart);
        msg.setSentDate(new Date());
        msg.saveChanges();
    }

    @SuppressWarnings("static-access")
    /**
     * �����ʼ���������
     */
    public int sendMail() throws IOException,MessagingException{

        Properties props = System.getProperties();    		//JavaMail��ҪProperties������һ��session����������ֵ���Ƿ����ʼ�������
        props.put("mail.host", smtpHost);
        props.put("mail.smtp.auth", "true");
//        props.put("mail.transport.protocol", "smtp");//ָ�������ʼ�Э��
//        props.put("mail.smtp.port", 25);			  		//�˿ں�
//        MailAuthenticator auth= new MailAuthenticator();
        SmtpAuth auth=new SmtpAuth();
        auth.getuserinfo("candong.zhai@cootek.cn",(new sun.misc.BASE64Encoder()).encode("Cdzhai12".getBytes())); 
        Session session=Session.getDefaultInstance(props,auth);    //����session����
        session.setDebug(debug);
        MimeMessage msg=new MimeMessage(session);    		//����ģ���ʼ���Ϣ        
        Transport trans= null;                				//�������Ͷ���
        fillMail(session, msg);
//        msg.writeTo(new FileOutputStream("withAttachmentMail.eml"));		//�����ʼ�������
        try {
             trans=session.getTransport("smtp");
             trans.connect();
//            try {
//               trans.connect(smtpHost,auth.getMAIL_USER(),auth.getMAIL_PASSWORD());
//             } catch (AuthenticationFailedException e) {
//                e.printStackTrace();
//                 System.out.println("�����ʼ�����������:");
//                return 3;
//             } catch (MessagingException e) {
//                e.printStackTrace();
//                System.out.println("�����ʼ�����������:");
//                return 3;
//            }
             trans.send(msg);    //�����ʼ�
//            trans.close();
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
//        System.out.println("�����ʼ��ɹ���");
        return 0;
     }
    
     /**
     * main��������
      * @param args
     */
    public static void main(String[] args) {
    	for(int i=0;i<1;i++){
    		System.out.println("���ڷ��͵�"+(i+1)+"���ʼ�");
	        SendMail sm=new SendMail();
	        sm.setSmtpHost("smtp.263.net");
	        sm.setMailReply("candong.zhai@cootek.cn");
	        sm.setMailTo("450383731@qq.com");
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