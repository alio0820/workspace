package com.mail;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.mail.Flags;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.Flags.Flag;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;
import javax.servlet.http.HttpSession;
import com.sun.mail.imap.IMAPMessage;
import com.web.office.bean.MailInfoBean;
import javax.mail.Part;

public class IMAPGetMail {
	private HttpSession session;	//��ǰsession
	private int currentpage;		//��ǰҳ��
	private int totalpage;			//��ҳ��
	private static int pagesize=20;			//ҳ������
	public HttpSession getSession() {
		return session;
	}
	public void setSession(HttpSession session) {
		this.session = session;
	}
	public int getCurrentpage() {
		return currentpage;
	}
	public void setCurrentpage(int currentpage) {
		this.currentpage = currentpage;
	}
	public int getTotalpage() {
		return totalpage;
	}
	public void setTotalpage(int totalpage) {
		this.totalpage = totalpage;
	}
	/**
	 * ��ʼ���ʼ�
	 * @param session
	 * @throws Exception
	 */
	public static void initMail(HttpSession session) throws Exception{
		
		Properties props = new Properties();  
	    props.setProperty("mail.store.protocol", "imap");  
	    props.setProperty("mail.imap.host", "mail.amarsoft.com");  
	    props.setProperty("mail.imap.port", "143");	      
	    Session mailSession = Session.getInstance(props);							// �����ʼ�Sessionʵ������	      
	    Store store = mailSession.getStore("imap");  								// ����IMAPЭ���Store����	     
	    store.connect("cdzhai@amarsoft.com", "xingye");       					// �����ʼ������� 	    
	    Folder folder = store.getFolder("INBOX");  									// ����ռ���  
	    folder.open(Folder.READ_WRITE);												// �Զ�дģʽ���ռ���									
	    Message[] messages = folder.getMessages();									// ����ռ�����ʼ��б�
	    session.setAttribute("folder", folder);										// ��folder����session
	    session.setAttribute("messages", messages);									// ��messages����session
	    int totalpage = (messages.length-1)/pagesize+1;
	    session.setAttribute("totalpage", totalpage);								// ����ҳ�����session
//	    List<MailInfoBean> list = getMailList(session);								// ���ʼ��б����session
//	    session.setAttribute("list", list);
	    // ��ӡ��ͬ״̬���ʼ�����  
//	    System.out.println("�ռ����й�" + messages.length + "���ʼ�!");  
//	    System.out.println("�ռ����й�" + folder.getUnreadMessageCount() + "��δ���ʼ�!");  
//	    System.out.println("�ռ����й�" + folder.getNewMessageCount() + "�����ʼ�!");  
//	    System.out.println("�ռ����й�" + folder.getDeletedMessageCount() + "����ɾ���ʼ�!");      
//	    System.out.println("------------------------��ʼ�����ʼ�----------------------------------"); 
//      �ر���Դ  
//	    folder.close(false);
//	    store.close();
	}
	/**
	 * ˢ������
	 * @param session
	 * @throws Exception
	 */
	public static void refreshMail(HttpSession session) throws Exception{
		Folder folder = (Folder)session.getAttribute("folder");
		Message[] messages = folder.getMessages();
	    session.setAttribute("messages", messages);
	    int totalpage = (messages.length-1)/pagesize+1;
	    session.setAttribute("totalpage", totalpage);
	}
	/**
	 * �����ʼ��б�
	 * @param session
	 * @return List
	 * @throws Exception
	 */
	public static List<MailInfoBean> getMailList(HttpSession session,int currentpage) throws Exception{
		Folder folder = (Folder)session.getAttribute("folder");
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		Message[] messages = (Message[])session.getAttribute("messages");
		List<MailInfoBean> list = new ArrayList<MailInfoBean>();
		int totalpage = (messages.length-1)/pagesize+1;
		int i = 0,min=0;
		if(currentpage<totalpage){
			i = messages.length - (currentpage-1)*pagesize-1;
			min = messages.length - currentpage*pagesize;			
		}
		else{
			i = messages.length - (totalpage-1)*pagesize -1;
			min =0;
		}
		for(;i>=min;i--){
			Message message = messages[i];
			MimeMessage msg = (MimeMessage)message;
			MailInfoBean mailList = new MailInfoBean();
			String subject = MimeUtility.decodeText(msg.getSubject()==null?"(������)":msg.getSubject());
			String from = POP3GetMail.getFrom(msg);
			String sentDate = POP3GetMail.getSentDate(msg, null);
			String sentTime = POP3GetMail.getTime(msg, null);
			//�ʼ�״̬
			Flags flags = msg.getFlags();
			String replied = flags.contains(Flags.Flag.ANSWERED)?"1":"0";		//�ѻظ�
//			String deleted = flags.contains(Flags.Flag.DELETED)?"1":"0";		//��ɾ��
			String draft = flags.contains(Flags.Flag.DRAFT)?"1":"0";			//�ݸ�
			String flagged = flags.contains(Flags.Flag.FLAGGED)?"1":"0";		//�ѱ��
			String read = flags.contains(Flags.Flag.SEEN)?"1":"0";				//�Ѷ�
//			String recent = flags.contains(Flags.Flag.RECENT)?"1":"0";			//���
			String attachment =POP3GetMail.getAttachmentNames(msg);			//����
			mailList.setReplied(replied);
//			mailList.setDeleted(deleted);
			mailList.setDraft(draft);
			mailList.setFlagged(flagged);
			mailList.setRead(read);
//			mailList.setRecent(recent);
			mailList.setFrom(from);
			mailList.setSubject(subject);
			mailList.setSentDate(sentDate);
			mailList.setSentTime(sentTime);
			mailList.setAttachment(attachment);
			list.add(mailList);
		}
		return list;
	}
	/**
	 * �����ʼ�����
	 * @param mailNo
	 * @param session
	 * @return
	 * @throws Exception
	 */
	public static MailInfoBean getMailInfo(int currentpage,int mailNo,HttpSession session) throws Exception{
	    Folder folder = (Folder)session.getAttribute("folder");
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
	    Message[] messages = (Message[])session.getAttribute("messages");
	    int i = messages.length -1 - (currentpage-1)*pagesize - mailNo;
	    // �����ʼ�    
	    IMAPMessage msg = (IMAPMessage) messages[i];
	    IMAPMessage preMsg=null;
	    IMAPMessage nextMsg=null;
	    if(mailNo>0&&mailNo<pagesize-1){
	    	preMsg = (IMAPMessage) messages[i+1];
	    	if(i!=0) nextMsg = (IMAPMessage) messages[i-1];
	    }else if(mailNo==0){
	    	if(i!=0) nextMsg = (IMAPMessage) messages[i-1];
	    }else if(mailNo==pagesize-1){
	    	preMsg = (IMAPMessage) messages[i+1];
	    }
	    
//      ɾ���ʼ�  
//	    msg.setFlag(Flags.Flag.DELETED, true); 
//	    pop3û���ж��ʼ��Ƿ�Ϊ�Ѷ��Ĺ��ܣ�Ҫʹ��Imap�ſ���
//	    String status;
	    Flags flags = msg.getFlags(); 
//	    if (flags.contains(Flags.Flag.SEEN)) status = "�Ѷ�"; 
//	    else  status = "δ��"; 	    
	    
	    String subject = MimeUtility.decodeText(msg.getSubject()==null?"(������)":msg.getSubject());
	    String preSubject="";
	    String nextSubject="";
	    if(preMsg!=null)
	    	preSubject = MimeUtility.decodeText(preMsg.getSubject()==null?"(������)":preMsg.getSubject());
	    if(nextMsg!=null)
	    	nextSubject = MimeUtility.decodeText(nextMsg.getSubject()==null?"(������)":nextMsg.getSubject());
//	    String size = "";//msg.getSize()+"";
	    String sentDate = POP3GetMail.getSentDate(msg, null);
	    String receive = POP3GetMail.getReceiveAddress(msg, null);
	    String read = flags.contains(Flags.Flag.SEEN)?"1":"0";//POP3GetMail.isSeen(msg)?"1":"0";
//	    String priority = "";//POP3GetMail.getPriority(msg);
	    String from = POP3GetMail.getFrom(msg);
	    String content = POP3GetMail.parseMessage(mailNo,msg);
//	    System.out.println(content);
	    String attachment = POP3GetMail.getAttachmentNames(msg);
	    
	    msg.setFlag(Flag.SEEN, true);   //�����Ѷ���־   �ڶ��������������Ϊtrue�����޸ķ�������������false�򲻷�����������
	    
	    MailInfoBean mailInfo = new MailInfoBean();
	    mailInfo.setSubject(subject);
	    mailInfo.setPreSubject(preSubject);
	    mailInfo.setNextSubject(nextSubject);
//	    mailInfo.setSize(size);
	    mailInfo.setSentDate(sentDate);
	    mailInfo.setReceive(receive);
	    mailInfo.setRead(read);
//	    mailInfo.setPriority(priority);
	    mailInfo.setFrom(from);
	    mailInfo.setContent(content);
	    mailInfo.setAttachment(attachment);
	    return mailInfo;
	}
	public static String getMailContent(int currentpage,int id,HttpSession session) throws Exception{
		Folder folder = (Folder)session.getAttribute("folder");
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
	    Message[] messages = (Message[])session.getAttribute("messages");
	    int i = messages.length -1 - (currentpage-1)*pagesize - id;
	    // �����ʼ�    
	    IMAPMessage msg = (IMAPMessage) messages[i];
	    String content = POP3GetMail.parseMessage(id,msg);
		return content;
	}
	/**
	 * ɾ���ʼ�
	 * @param session
	 * @throws Exception
	 */
	public static boolean deleteMail(int currentpage,int[] mailNo,HttpSession session) throws Exception{
		Folder folder = (Folder)session.getAttribute("folder");
		if(!folder.isOpen())
			folder.open(Folder.READ_WRITE);
		Message[] messages = (Message[])session.getAttribute("messages");
		for(int num : mailNo){
			 int i = messages.length -1 - (currentpage-1)*pagesize - num;
			 IMAPMessage msg = (IMAPMessage) messages[i];
			 msg.setFlag(Flags.Flag.DELETED, true);
		}
		return true;
	}
}
