package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.GoodsTypeDAO;
import cn.edu.model.GoodsType;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class GoodsTypeServlet extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		
		if(PublicUtil.publicCheckNull(method))
		{
			
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
			
			if(method.equals("insert"))
			{
				doInsert(request, response);
			}
		
			if(method.equals("rework"))
			{
				doReWork(request, response);
			}
			if(method.equals("update"))
			{
				doUpdate(request, response);
			}
		
			if(method.equals("add"))
			{
				doAddBulletin(request, response);
			}
		}
		else
		{
			System.out.println("method为空");
		}
		}
		
		/**
		* 
		* 查询商品类型
		* @param request
		* @param response
		* @throws ServletException
		* @throws IOException
		*/
		public void doSearch (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GoodsTypeDAO gtDAO = new GoodsTypeDAO();
		String key = request.getParameter("key");
		
		int sumCount = gtDAO.getSumCount();
		PageModel pm = PageUtil.getPageInfo(request, sumCount);
		
		if(key==null)
		{
			key = "";
		}
		
		ArrayList<GoodsType> gtList = gtDAO.getAllGoodsTypeList(key, pm);
		
		request.setAttribute("gtList", gtList);
		request.getRequestDispatcher("goodsTypeManage.jsp").forward(request, response);
		
		}
		/**
		* 
		* 删除公告
		* 
		*/
		public void doDelete(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		GoodsTypeDAO gtDAO = new GoodsTypeDAO();			
		String deleteValue = request.getParameter("deleteValue");

		gtDAO.deleteGoodsType(deleteValue);
		doSearch(request, response);
		//request.getRequestDispatcher("bulletinManage.jsp").forward(request, response);
		}
		
		public void doDeleteOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GoodsTypeDAO btDAO = new GoodsTypeDAO();			
		String deleteValue = request.getParameter("deleteValue");
//		System.out.println(deleteValue);
		btDAO.deleteOne(deleteValue);
		doSearch(request, response);
		
		}
		/**
		* 
		* 修改公告（跳转到修改页面）
		* 
		* @param request
		* @param response
		* @throws ServletException
		* @throws IOException
		*/
		public void doReWork (HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		GoodsTypeDAO btDAO = new GoodsTypeDAO();
		GoodsType gt = new GoodsType();
		String str_reworkValue = request.getParameter("reworkValue");
		
		if(PublicUtil.publicCheckNull(str_reworkValue))
		{
			int reworkValue = Integer.parseInt(str_reworkValue);
			gt = btDAO.getGoodsType(reworkValue);
		} 
		request.setAttribute("reworkGt", gt);
		request.getRequestDispatcher("updateGoodsType.jsp").forward(request, response);
		
		}
		/**
		* 
		* 添加公告
		* @param request
		* @param response
		* @throws ServletException
		* @throws IOException
		*/
		public void doInsert (HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		String typeName = request.getParameter("typeName");
			
		GoodsTypeDAO gtDAO = new GoodsTypeDAO();
		gtDAO.InsertGoodsType(typeName);
		doSearch(request, response);
		//request.getRequestDispatcher("bulletinManage.jsp").forward(request, response);
		}
		
		/**
		* 
		* 更新公告
		* @param request
		* @param response
		* @throws ServletException
		* @throws IOException
		*/
		public void doUpdate (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String str_typeId = request.getParameter("typeId");	
		String typeName = request.getParameter("typeName");
		int typeId = Integer.parseInt(str_typeId);
		
		GoodsTypeDAO gtDAO = new GoodsTypeDAO();
		gtDAO.updateGoodsType(typeName,typeId);
		doSearch(request, response);
		}
		/**
		* 
		* 跳转到添加商品页面
		* @param request
		* @param response
		* @throws ServletException
		* @throws IOException
		*/
		public void doAddBulletin (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.getRequestDispatcher("addGoodsType.jsp").forward(request, response);
		
		}

}
