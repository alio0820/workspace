package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.omg.CORBA.PUBLIC_MEMBER;

import cn.edu.dao.CustomerDetailInfoDAO;
import cn.edu.dao.GoodsInfoDAO;
import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.GoodsInfo;
import cn.edu.util.PublicUtil;


public class CartServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		
		if(method.equals("purchase"))//购买商品
		{
			doPurchase(request, response);
		}
		if(method.equals("updateNum"))//更改商品数量
		{
			doUpdateNum(request, response);
		}
		if(method.equals("clear"))//清空购物车
		{
			doClear(request, response);
		}
		if(method.equals("delete"))//删除已购买的商品
		{
			doDeleteNum(request, response);
		}
		if(method.equals("pay"))//进入结算中心
		{
			doPay(request, response);
		}
	}
	
	/**
	 * 
	 * 购买商品的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doPurchase(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String str_gdid = request.getParameter("gdid");
		String str_num = request.getParameter("num");

		
		if(PublicUtil.publicCheckNull(str_gdid))
		{
			int gdid = Integer.parseInt(str_gdid);
			int num = Integer.parseInt(str_num);

			HttpSession session = request.getSession();
			
			ArrayList<GoodsInfo> hasBuyList = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
			
			GoodsInfoDAO gdDAO = new GoodsInfoDAO();
			GoodsInfo gd = gdDAO.getGoodsInfo(gdid);
			
			if(hasBuyList==null)
			{
				hasBuyList = new ArrayList<GoodsInfo>();
			}

			boolean flag = false; // 没有购买过为false；

			for (int i = 0; i < hasBuyList.size(); i++)
			{
				if (hasBuyList.get(i).getGoodsId() == gdid) {
					gd.setCount(hasBuyList.get(i).getCount()+num);
					hasBuyList.remove(i);
					hasBuyList.add(gd);
					flag = true;
				}
			}
					
			if (flag == false) {
				gd.setCount(num);
				hasBuyList.add(gd);
			}

			double sum = calculateSum(hasBuyList);//计算总金额
			
			session.setAttribute("hasBuyList", hasBuyList);
			session.setAttribute("sum", sum);
			System.out.println(Double.parseDouble(session.getAttribute("sum")+""));
			response.sendRedirect("cart.jsp");
		}				
	}
	/**
	 * 
	 * 更改购买物品数量的方法
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doUpdateNum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String str_num = request.getParameter("num");
		String str_gdid = request.getParameter("gdid");
		
		HttpSession session = request.getSession();
		ArrayList<GoodsInfo> updategd = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
		
		if(updategd!=null && PublicUtil.publicCheckNull(str_num) && PublicUtil.publicCheckNull(str_gdid))
		{
			int gdid = Integer.parseInt(str_gdid);
			int num = Integer.parseInt(str_num);
			for(int i = 0; i<updategd.size();i++)
			{
				if(updategd.get(i).getGoodsId()==gdid)
				{
					updategd.get(i).setCount(num);
					double subtotal = PublicUtil.Convert(updategd.get(i).getCount()*updategd.get(i).getDiscount()*updategd.get(i).getPrice()/10);
					session.setAttribute("subtotal", subtotal);
				}
			}
			
			double sum = calculateSum(updategd);
			session.setAttribute("sum", sum);
			response.sendRedirect("cart.jsp");
		}
		else
		{
			System.out.println("doUpdate中的updategd/str_val/str_gid为空！");
		}
	}

	/**
	 * 
	 * 删除商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doDeleteNum(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		ArrayList<GoodsInfo> leaveGoodsList = (ArrayList<GoodsInfo>)session.getAttribute("hasBuyList");
		
		String str_gdid = request.getParameter("gdid");
		int gdid = Integer.parseInt(str_gdid);
		
		if(leaveGoodsList != null)
		{
			for(int i=0;i<leaveGoodsList.size();i++)
			{
				if(leaveGoodsList.get(i).getGoodsId()==gdid)
				{
					leaveGoodsList.remove(i);
					
					break;
				}
			}
			double sum = calculateSum(leaveGoodsList);
			
			session.setAttribute("sum", sum);

			response.sendRedirect("cart.jsp");
		}
	}
	
	/**
	 * 
	 * 清空购物车
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doClear(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		session.removeAttribute("hasBuyList");
		
		//计算总金额
		session.setAttribute("sum", "0.0");	
		
		response.sendRedirect("cart.jsp");
		
	}
	/**
	 * 计算总金额
	 * @param list
	 * @return
	 */
	private double calculateSum(ArrayList<GoodsInfo> list)
	{
		double sum = 0;
		if(list!=null)
		{
			for (int i = 0; i < list.size(); i++) {
				sum += list.get(i).getDiscount()* list.get(i).getCount()* list.get(i).getPrice()/10;
				sum = PublicUtil.Convert(sum);
			}
		}
		return sum;
	}
	
	/**
	 * 进入结算中心的购买操作
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doPay(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("isRegister")==null)
		{
			session.setAttribute("isRegister", "false");
		}
		String isRegister = (String)session.getAttribute("isRegister");
		
		if(isRegister.equals("false"))//用户尚未登录跳转到登录页面
		{
			request.getRequestDispatcher("login_register.jsp").forward(request, response);
		}
		if(isRegister.equals("true"))//用户已经登录直接跳转到订单页面
		{
			CustomerDetailInfoDAO ctdDAO = new CustomerDetailInfoDAO();
			String str_customerId = session.getAttribute("loginId")+"";
			System.out.println("tpf:"+str_customerId);
			int customerId = Integer.parseInt(str_customerId);
			CustomerDetailInfo ctd = ctdDAO.getCustomerDetailByCustomerId(customerId);
			System.out.println(ctd);
			System.out.println(ctd.getName());
			System.out.println(ctd.getAddress());
			System.out.println(ctd.getCustomerId());
			System.out.println(ctd.getMobilephone());
			System.out.println(ctd.getTelphone());
			
			String name = ctd.getName();
			String telphone = ctd.getTelphone();
			String movePhone = ctd.getMobilephone();
			String address = ctd.getAddress();

			System.out.println(name);
			System.out.println(telphone);
			System.out.println(movePhone);
			System.out.println(address);
			
			if(name.equals("")||telphone.equals("")||movePhone.equals("")||address.equals(""))
			{
				request.getRequestDispatcher("delivery.jsp").forward(request, response);
			}
			else
			{
				request.getRequestDispatcher("confirm.jsp?").forward(request, response);
			}
		}
	}
}
