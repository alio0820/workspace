package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.dao.CustomerDetailInfoDAO;
import cn.edu.dao.CustomerInfoDAO;
import cn.edu.dao.OrderGoodsInfoDAO;
import cn.edu.dao.OrderInfoDAO;
import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.model.GoodsInfo;
import cn.edu.model.OrderInfo;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;


public class OrderInfoServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String method = request.getParameter("method");
//		System.out.println(method);
		
		if(method.equals("insert"))
		{
			doInsertOrderInfo(request, response);
		}
	}

	/**
	 * 
	 * 新加入订单
	 * 
	 */
	public void doInsertOrderInfo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		String str_loginId = session.getAttribute("loginId")+""; 
		int  loginId = Integer.parseInt(str_loginId);
		ArrayList<GoodsInfo> gdList = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
		System.out.println("loginId in OrderInfoServlet = "+loginId);
		OrderGoodsInfoDAO ogDAO = new OrderGoodsInfoDAO();
		OrderInfoDAO oiDAO = new OrderInfoDAO();
		oiDAO.addOrderInfo(loginId);
		ArrayList<Integer> orderIdList = oiDAO.getOrderIdByCustomerId(loginId);//通过用户将该用户的订单编号返回来
		System.out.println("orderIdList In OrderInfoServlet:"+orderIdList);
		if(orderIdList!=null)
		{
			for(int i=0;i<orderIdList.size();i++)
			{
				for(int j=0;j<gdList.size();j++)
				{
					GoodsInfo gdInfo = gdList.get(j);
					System.out.println("+++++++++++---->:"+gdInfo.getGoodsId());
					System.out.println("+++++++++++---->:"+gdInfo.getCount());
					ogDAO.addOrderGoodsInfo((int)orderIdList.get(i),gdInfo.getGoodsId(),gdInfo.getCount());
				}
			}
		}
		request.getRequestDispatcher("ok.jsp").forward(request, response);
	}
}
