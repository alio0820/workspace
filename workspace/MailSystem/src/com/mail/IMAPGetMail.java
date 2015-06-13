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
	private HttpSession session;	//当前session
	private int currentpage;		//当前页码
	private int totalpage;			//总页码
	private static int pagesize=20;			//页面行数
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
	 * 初始化邮件
	 * @param session
	 * @throws Exception
	 */
	public static void initMail(HttpSession session) throws Exception{
		
		Properties props = new Properties();  
	    props.setProperty("mail.store.protocol", "imap");  
	    props.setProperty("mail.imap.host", "mail.amarsoft.com");  
	    props.setProperty("mail.imap.port", "143");	      
	    Session mailSession = Session.getInstance(props);							// 创建邮件Session实例对象	      
	    Store store = mailSession.getStore("imap");  								// 创建IMAP协议的Store对象	     
	    store.connect("cdzhai@amarsoft.com", "xingye");       					// 连接邮件服务器 	    
	    Folder folder = store.getFolder("INBOX");  									// 获得收件箱  
	    folder.open(Folder.READ_WRITE);												// 以读写模式打开收件箱									
	    Message[] messages = folder.getMessages();									// 获得收件箱的邮件列表
	    session.setAttribute("folder", folder);										// 将folder存入session
	    session.setAttribute("messages", messages);									// 将messages存入session
	    int totalpage = (messages.length-1)/pagesize+1;
	    session.setAttribute("totalpage", totalpage);								// 将总页码存入session
//	    List<MailInfoBean> list = getMailList(session);								// 将邮件列表存入session
//	    session.setAttribute("list", list);
	    // 打印不同状态的邮件数量  
//	    System.out.println("收件箱中共" + messages.length + "封邮件!");  
//	    System.out.println("收件箱中共" + folder.getUnreadMessageCount() + "封未读邮件!");  
//	    System.out.println("收件箱中共" + folder.getNewMessageCount() + "封新邮件!");  
//	    System.out.println("收件箱中共" + folder.getDeletedMessageCount() + "封已删除邮件!");      
//	    System.out.println("------------------------开始解析邮件----------------------------------"); 
//      关闭资源  
//	    folder.close(false);
//	    store.close();
	}
	/**
	 * 刷新邮箱
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
	 * 返回邮件列表
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
			String subject = MimeUtility.decodeText(msg.getSubject()==null?"(无主题)":msg.getSubject());
			String from = POP3GetMail.getFrom(msg);
			String sentDate = POP3GetMail.getSentDate(msg, null);
			String sentTime = POP3GetMail.getTime(msg, null);
			//邮件状态
			Flags flags = msg.getFlags();
			String replied = flags.contains(Flags.Flag.ANSWERED)?"1":"0";		//已回复
//			String deleted = flags.contains(Flags.Flag.DELETED)?"1":"0";		//已删除
			String draft = flags.contains(Flags.Flag.DRAFT)?"1":"0";			//草稿
			String flagged = flags.contains(Flags.Flag.FLAGGED)?"1":"0";		//已标记
			String read = flags.contains(Flags.Flag.SEEN)?"1":"0";				//已读
//			String recent = flags.contains(Flags.Flag.RECENT)?"1":"0";			//最近
			String attachment =POP3GetMail.getAttachmentNames(msg);			//附件
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
	 * 返回邮件内容
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
	    // 解析邮件    
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
	    
//      删除邮件  
//	    msg.setFlag(Flags.Flag.DELETED, true); 
//	    pop3没有判断邮件是否为已读的功能，要使用Imap才可以
//	    String status;
	    Flags flags = msg.getFlags(); 
//	    if (flags.contains(Flags.Flag.SEEN)) status = "已读"; 
//	    else  status = "未读"; 	    
	    
	    String subject = MimeUtility.decodeText(msg.getSubject()==null?"(无主题)":msg.getSubject());
	    String preSubject="";
	    String nextSubject="";
	    if(preMsg!=null)
	    	preSubject = MimeUtility.decodeText(preMsg.getSubject()==null?"(无主题)":preMsg.getSubject());
	    if(nextMsg!=null)
	    	nextSubject = MimeUtility.decodeText(nextMsg.getSubject()==null?"(无主题)":nextMsg.getSubject());
//	    String size = "";//msg.getSize()+"";
	    String sentDate = POP3GetMail.getSentDate(msg, null);
	    String receive = POP3GetMail.getReceiveAddress(msg, null);
	    String read = flags.contains(Flags.Flag.SEEN)?"1":"0";//POP3GetMail.isSeen(msg)?"1":"0";
//	    String priority = "";//POP3GetMail.getPriority(msg);
	    String from = POP3GetMail.getFrom(msg);
	    String content = POP3GetMail.parseMessage(mailNo,msg);
//	    System.out.println(content);
	    String attachment = POP3GetMail.getAttachmentNames(msg);
	    
	    msg.setFlag(Flag.SEEN, true);   //设置已读标志   第二个参数如果设置为true，则将修改反馈给服务器。false则不反馈给服务器
	    
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
	    // 解析邮件    
	    IMAPMessage msg = (IMAPMessage) messages[i];
	    String content = POP3GetMail.parseMessage(id,msg);
		return content;
	}
	/**
	 * 删除邮件
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
