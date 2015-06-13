package com.mail;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.web.office.bean.MailInfoBean;

import uk.ltd.getahead.dwr.WebContext;
import uk.ltd.getahead.dwr.WebContextFactory;

@SuppressWarnings("deprecation")
public class MailAction{
	MailDAO mailDAO = new MailDAO();
	WebContext webContext = WebContextFactory.get();
	public HttpSession getSession(){
        return webContext.getSession();  
	}
	public HttpServletRequest getRequest(){
		return webContext.getHttpServletRequest();
	}
	public HttpServletResponse getResponse(){
		return webContext.getHttpServletResponse();
	}
	
	public void initMail() throws Exception{
		HttpSession session=getSession();
		mailDAO.initMail(session);
	}
	public void refreshMail() throws Exception{
		HttpSession session=getSession();
		mailDAO.refreshMail(session);
	}
	public MailInfoBean getMail(int currentpage,int mailNo) throws Exception{
		HttpSession session=getSession();
		return mailDAO.getMailInfo(currentpage,mailNo,session);
	}
	public List<MailInfoBean> getMailList(int currentpage) throws Exception{
		HttpSession session=getSession();
		return mailDAO.getMailList(session,currentpage);
	}
	public boolean deleteMail(int currentpage,int[] mailNo) throws Exception{
		HttpSession session=getSession();
		return mailDAO.deleteMail(currentpage,mailNo,session);
	}
	public String getMailContent(int currentpage,int id) throws Exception{
		HttpSession session=getSession();
		return mailDAO.getMailContent(currentpage,id,session);
	}
//	public static void main(String[] args) throws Exception{
//		MailAction mail = new MailAction();
//		mail.initMail();
//		mail.getMailList();
//	}
	
}
