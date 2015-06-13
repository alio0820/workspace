package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.CustomerDetailInfoDAO;
import cn.edu.dao.CustomerInfoDAO;
import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class CustomerManageServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = "";
		method = request.getParameter("method");	
//		System.out.println("method In customerManageservlet:"+method);
		if(method.equals("search"))
		{
			doSearch(request, response);
		}
		if(method.equals("deleteOne"))
		{
			doDeleteOne(request, response);
		}
		if(method.equals("delete"))
		{
			doDelete(request, response);
		}
		if(method.equals("rework"))
		{
			doReWork(request, response);
		}
		if(method.equals("update"))
		{
			doUpdate(request, response);
		}
	}
	
	/**
	 * 
	 *查询客户的相关信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doSearch(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();
		
		String key = request.getParameter("key");
		
		int sumCount = ctDAO.getSumCount();
		PageModel pm = PageUtil.getPageInfo(request, sumCount);
		
		if(key==null)
		{
			key = "";
		}
		
		ArrayList<CustomerInfo> ctList = ctDAO.getAllCustomerInfo(key, pm);
		request.setAttribute("ctList", ctList);
		
		request.getRequestDispatcher("customerManage.jsp").forward(request, response);

	}
	
	/**
	 * 
	 * 删除单个或者多个客户
	 * 
	 */
	public void doDelete (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
		ctDAO.deleteCustomerInfo(deleteValue);
		doSearch(request, response);
		
	}
	
	public void doDeleteOne (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
		ctDAO.deleteOne(deleteValue);
		doSearch(request, response);
		
	}
	
	public void doReWork (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO(); 
		String str_reworkValue = request.getParameter("reworkValue");
		
		CustomerInfo ct = new CustomerInfo();
		int reworkValue = 0;
		if(PublicUtil.publicCheckNull(str_reworkValue))
		{
			reworkValue = Integer.parseInt(str_reworkValue);
			ct = ctDAO.getCustomerInfoById(reworkValue);
		}
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(reworkValue);
		
		request.setAttribute("reworkCt", ct);
		request.setAttribute("reworkCtd", ctd);
		
		request.getRequestDispatcher("updateCustomer.jsp").forward(request, response);
	}
	
	public void doUpdate (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String str_cid = request.getParameter("cid");
		int cid = Integer.parseInt(str_cid);
		String email = request.getParameter("email");
		String registerTime = request.getParameter("registerTime");
		String name = request.getParameter("name");
		String telphone = request.getParameter("telphone");
		String movePhone = request.getParameter("movePhone");
		String address = request.getParameter("address");
		
		CustomerInfoDAO ctDAO = new CustomerInfoDAO();
		ctDAO.updateCustomerInfo(cid, email, registerTime);
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		ctdDAO.updateCustomerDetailInfo(cid, name, telphone, movePhone, address);
		
		doSearch(request, response);
	}
}
