package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.BulletinDAO;
import cn.edu.dao.CustomerDetailInfoDAO;
import cn.edu.dao.OrderGoodsInfoDAO;
import cn.edu.dao.OrderInfoDAO;
import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.model.OrderInfo;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class OrderServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
//		System.out.println(method);
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
			doDeleteOrder(request, response);
		}
		if(method.equals("detail"))
		{
			doDetail(request, response);
		}
		if(method.equals("confirm"))
		{
			doConfirm(request, response);
		}
	}
		
	/**
	 * 
	 * 分页关键字查询订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doSearch(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
	  	 OrderInfoDAO oiDAO = new OrderInfoDAO();
	  	 
	  	 String key = request.getParameter("key");
	  	 int sumCount = oiDAO.getSumCount();

		 PageModel pm = PageUtil.getPageInfo(request, sumCount);
			
		 if(key==null)
		 {
		 	key = "";
		 }
		 ArrayList<OrderInfo> oiList = oiDAO.getAllOrderInfo(key,pm);
		 
		 request.setAttribute("oiList", oiList);
		 request.getRequestDispatcher("orderManage.jsp").forward(request, response);
	}
	
	/**
	 * 
	 * 删除选中订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doDeleteOrder(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

		OrderInfoDAO oiDAO = new OrderInfoDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
		oiDAO.deleteOrder(deleteValue);
		doSearch(request, response);
	}
	
	/**
	 * 
	 * 删除单个订单
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doDeleteOne(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		OrderInfoDAO oiDAO = new OrderInfoDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
		oiDAO.deleteOne(deleteValue);
		doSearch(request, response);
	}
	
	/**
	 * 
	 * 获得订单的详细信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doDetail(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		String str_customerId = request.getParameter("detailCustomer");
		String str_orderId = request.getParameter("detailOrder");
		System.out.println("str_order in orderServlet:"+str_orderId);
		System.out.println("str_customerId in orderServlet:"+str_customerId);
		int customerId = Integer.parseInt(str_customerId);
		int orderId = Integer.parseInt(str_orderId);
		
		CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
		CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(customerId);
		
		OrderGoodsInfoDAO ogDAO = new OrderGoodsInfoDAO();
		ArrayList<Integer> goodsIdList = ogDAO.getGoodsIdByOrderId(orderId);
		
		OrderInfoDAO oiDAO = new OrderInfoDAO();
		OrderInfo oi = oiDAO.getOrderInfoByOrderId(orderId);
		
		request.setAttribute("goodsIdList", goodsIdList);
		request.setAttribute("DetailCustomer", ctd);
		request.setAttribute("DetailOrderInfo", oi);
		
		request.getRequestDispatcher("showOrderDetail.jsp").forward(request, response);
	}
	
	public void doConfirm (HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		String str_orderId = request.getParameter("confirmId");
		String str_status = request.getParameter("confirmStatus");
		System.out.println("-------------------------"+str_orderId);
		System.out.println("----------------------------------"+str_status);
		if(PublicUtil.publicCheckNull(str_orderId)&&PublicUtil.publicCheckNull(str_status))
		{
			int orderId = Integer.parseInt(str_orderId);
			int status = Integer.parseInt(str_status);
			OrderInfoDAO oiDAO = new OrderInfoDAO();
			oiDAO.updateStatusByOrderId(orderId, status);
		}
		
		doSearch(request, response);
		
	}
}
