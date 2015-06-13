package com.common;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.UserBean;
import com.init.WebCounter;


public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	public LoginServlet() {
		super();
	}
	
	public void destroy() {
		ILog.sys("����ע��ϵͳ...");
		String num=this.getServletContext().getAttribute("visitNum").toString();
		ILog.init("�ܷ�����Ϊ:"+num);
//		ֱ�ӹҵ��������
//		WebCounter  wc = getWebCounter();
//		wc.setNumber(Integer.parseInt(num));
		super.destroy();
	}
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gbk");
		PrintWriter out = response.getWriter();
		String userName=request.getParameter("userName");			
		String password=request.getParameter("password");
		String incode = request.getParameter("incode");
		String rightcode = (String)request.getSession().getAttribute("numrand");//��֤��
		if (true||incode != null && rightcode != null) {
			if (true||rightcode.equals(incode)){
				UserBean  ub=DBConnection.getInstance().isUserExistAndLegal(request, userName, password);							
				if (ub!=null) {
//					out.print("<script>alert('��¼�ɹ���Ŭ��Ϊ����ת��');</script>");	
					int num=Integer.parseInt(this.getServletContext().getAttribute("visitNum").toString());
					this.getServletContext().setAttribute("webCounter", ++num);
					HttpSession  session=request.getSession();	
					session.setAttribute("userBean", ub);						//���û�bean�ŵ�session��
					ILog.info("�û�["+userName+"]�Ѿ�����...");
					
//					ServletContext application=this.getServletContext();
//					String count=application.getAttribute("visitNum").toString();
//					countUserNum();
//					�����ݵ�����ͳͳ�������ݿ⣡����
					if(!ub.getUserName().equalsIgnoreCase("")){
						response.sendRedirect(request.getContextPath()+"");//����ڷ�������·��
//						request.getRequestDispatcher("/index.jsp").forward(request,response);//�����webӦ�ø�·��
						ILog.jspInfo("����ҳ");
					}
				}else {
					out.print("<script>alert('�û������������');history.back();</script>");
				}
			} else {
				out.print("<script>alert('��֤�����');history.back();</script>");
			}
		}
	}
	/**
	 * ��ʼ��servlet.
	 */
	public void init() throws ServletException {
		ServletContext application=this.getServletContext();	//this.getServletContext()��ȡ�����൱��jspҳ���Application
		WebCounter wc = new WebCounter(application.getRealPath(""));
		application.setAttribute("visitNum", wc.getOnlineNumberFromFile());
		ILog.init("��ʼ������Ϊ:"+wc.getOnlineNumberFromFile());
	}
}
