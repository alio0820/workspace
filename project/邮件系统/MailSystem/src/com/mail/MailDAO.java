package com.mail;

import java.util.List;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;

import com.web.office.bean.MailInfoBean;

public class MailDAO {
	public MailInfoBean getMailInfo(int currentpage,int mailNo,HttpSession session) throws Exception{
		return IMAPGetMail.getMailInfo(currentpage,mailNo,session);
	}
	public List<MailInfoBean> getMailList(HttpSession session,int currentpage) throws Exception{
		return IMAPGetMail.getMailList(session,currentpage);
	}
	public void initMail(HttpSession session) throws Exception{
		IMAPGetMail.initMail(session);
	}
	public void refreshMail(HttpSession session) throws Exception{
		IMAPGetMail.initMail(session);
	}
	public boolean deleteMail(int currentpage,int[] mailNo,HttpSession session) throws Exception{
		return IMAPGetMail.deleteMail(currentpage,mailNo,session);
	}
	public String getMailContent(int currentpage,int id ,HttpSession session) throws Exception{
		return IMAPGetMail.getMailContent(currentpage,id,session);
	}
}
