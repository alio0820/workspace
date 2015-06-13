package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.dao.CustomerDetailInfoDAO;
import cn.edu.dao.CustomerInfoDAO;
import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.model.UserInfo;
import cn.edu.util.DBConn;
import cn.edu.util.PublicUtil;


public class RegisterServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");

		if(method.equals("login"))
		{
			doLogin(request, response);
		}
		if(method.equals("register"))
		{
			doRegister(request, response);
		}
		if(method.equals("loginOut"))
		{
			doLoginOut(request, response);
		}
		if(method.equals("addDetail"))
		{
			doAddDetail(request, response);
		}
	}
	/**
	 * 
	 * 用户登录的相关操作
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String userName = request.getParameter("userName");
		String userPwd = request.getParameter("userPwd");	
		
		CustomerInfoDAO ciDAO = new CustomerInfoDAO();
		boolean result = ciDAO.judgeUserInfo(userName, userPwd);
		HttpSession session = request.getSession();
		if(session.getAttribute("sum")==null)
		{
			session.setAttribute("sum", "0.0");
		}
		String str_sum = session.getAttribute("sum")+"";
		if(session.getAttribute("isRegister")==null)
		{
			session.setAttribute("isRegister", "false");
		}
		if(result)
		{
			//用户登录成功的操作
			session.setAttribute("isRegister", "true");
			int loginId = DBConn.getCustomerIdByCustomerEmail(userName);
			session.setAttribute("loginId", loginId);
			if(PublicUtil.publicCheckNull(str_sum))
			{
				double sum = Double.parseDouble(str_sum);
				if(sum>0.0)
				{
					//如果用户没有详细信息，就跳转到配送页面
					CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
					String str_customerId = session.getAttribute("loginId")+"";
					int customerId = Integer.parseInt(str_customerId);
					CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(customerId);
					
					String name = ctd.getName();
					String telphone = ctd.getTelphone();
					String movePhone = ctd.getMobilephone();
					String address = ctd.getAddress();
					
					if(name.equals("")||telphone.equals("")||movePhone.equals("")||address.equals(""))
					{
						request.getRequestDispatcher("delivery.jsp").forward(request, response);
					}
					else
					{
						request.getRequestDispatcher("confirm.jsp?").forward(request, response);
					}
				}
				else
				{
					response.sendRedirect("ok.jsp");
				}
			}
			else
			{
				response.sendRedirect("error.jsp");
			}
		}
		else
		{
			//用户登录失败的操作
			response.sendRedirect("failed.jsp");
		}
	}
	
	/**
	 * 
	 * 用户注册信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		String name = request.getParameter("name");
		String telphone = request.getParameter("telphone");
		String movePhone = request.getParameter("movePhone");
		String address = request.getParameter("address");
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();
		ctDAO.addCustomer(email, pwd);
		
		int customerId = DBConn.getCustomerIdByCustomerEmail(email);//注意：该语句必须在ctDAO.addCustomer(email, pwd);操作之后
		
		CustomerDetailInfoDAO cdDAO = new CustomerDetailInfoDAO();
		cdDAO.addCustomerDetail(customerId, name, telphone, movePhone, address);
		
		response.sendRedirect("ok.jsp");
	}
	
	/**
	 * 
	 * 用户退出登录的操作
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doLoginOut(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("loginId");
		session.removeAttribute("isRegister");
		session.removeAttribute("");
		session.removeAttribute("hasBuyList");
		session.setAttribute("sum", "0.0");
		response.sendRedirect("../index.jsp");
	}
	
	/**
	 * 
	 * 添加用户的详细信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doAddDetail (HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

		HttpSession session = request.getSession();
		String str_loginId = session.getAttribute("loginId")+""; 
		int  loginId = Integer.parseInt(str_loginId);
		System.out.println("loginId = "+loginId);
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		ctdDAO.deleteCustomerDetailInfoById(loginId);
	
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();
		CustomerInfo ci = ctDAO.getCustomerInfoById(loginId);
		
		ctDAO.deleteCustomerInfoById(loginId); 
		
		String email = ci.getEmail();
		String pwd = ci.getPwd();
		Date registerTime = ci.getRegisterTime(); 
		
		String name = request.getParameter("name");
		String telphone = request.getParameter("telphone");
		String movePhone = request.getParameter("movePhone");
		String address = request.getParameter("address");
		
		ctDAO.addCustomer(email, pwd,registerTime);
		
		int customerId = DBConn.getCustomerIdByCustomerEmail(email);//注意：该语句必须在ctDAO.addCustomer(email, pwd);操作之后
		
		CustomerDetailInfoDAO cdDAO = new CustomerDetailInfoDAO();
		cdDAO.addCustomerDetail(customerId, name, telphone, movePhone, address);
		session.setAttribute("loginId", customerId);
		
		response.sendRedirect("confirm.jsp");
	}
}
