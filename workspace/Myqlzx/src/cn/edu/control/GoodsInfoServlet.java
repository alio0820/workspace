package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.BulletinDAO;
import cn.edu.dao.GoodsInfoDAO;
import cn.edu.model.Bulletin;
import cn.edu.model.GoodsInfo;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class GoodsInfoServlet extends HttpServlet {

	@Override
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
			
			if(method.equals("delete"))
			{
				doDelete(request, response);
			}
			
			if(method.equals("deleteOne"))
			{
				doDeleteOne(request, response);
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
				doAddGoodsInfo(request, response);
			}
		}
		else
		{
			System.out.println("method为空");
		}
	}
	/**
	 * 
	 * 查询公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doSearch (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		GoodsInfoDAO gdDAO = new GoodsInfoDAO();
		String key = request.getParameter("key");

		int sumCount = gdDAO.getSumCount();
		PageModel pm = PageUtil.getPageInfo(request, sumCount);
		
		if(key==null)
		{
			key = "";
		}
		
		ArrayList<GoodsInfo> gdList = gdDAO.getAllGoodsInfoList(key, pm);
		
		request.setAttribute("gdList", gdList);
		request.getRequestDispatcher("goodsManage.jsp").forward(request, response);
		
	}
	/**
	 * 
	 * 删除多个商品
	 * 
	 */
	public void doDelete(HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		BulletinDAO btDAO = new BulletinDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
		btDAO.deleteBulletin(deleteValue);
		doSearch(request, response);
	
	}
	
	
	/**
	 * 
	 * 删除单个商品
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doDeleteOne(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException {

		GoodsInfoDAO gdDAO = new GoodsInfoDAO();			
		String deleteValue = request.getParameter("deleteValue");
		gdDAO.deleteOne(deleteValue);
		doSearch(request, response);

	}
	/**
	 * 
	 * 修改商品信息（跳转到修改页面）
	 * 
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doReWork (HttpServletRequest request, HttpServletResponse response)
					throws ServletException, IOException {
		
		GoodsInfoDAO gdDAO = new GoodsInfoDAO();
		GoodsInfo gd = new GoodsInfo();
		String str_reworkValue = request.getParameter("reworkValue");
		
		if(PublicUtil.publicCheckNull(str_reworkValue))
		{
			int reworkValue = Integer.parseInt(str_reworkValue);
			gd = gdDAO.getGoodsInfo(reworkValue);
		} 
		request.setAttribute("reworkGd", gd);
		request.getRequestDispatcher("updateGoods.jsp").forward(request, response);
		
	}
	/**
	 * 
	 * 添加商品信息
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doInsert (HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		
		String goodsName = request.getParameter("textName");
		String str_typeId = request.getParameter("select");
		String price = request.getParameter("textPrice");
		String discount = request.getParameter("textDiscount");
		String sel[] = request.getParameterValues("checkbox");
		String photo = request.getParameter("file");
		String remark = request.getParameter("textarea");
		int status = 1;
		int isRecommend = 1;
		int isNew = 1;
		int typeId = Integer.parseInt(str_typeId);
		for(int i = 0;i<sel.length;i++)
		{
			if(sel[i].equals("上架"))
			{
				status = 0;
			}
			if(sel[i].equals("推荐"))
			{
				isRecommend = 0;
			}
			if(sel[i].equals("新品"))
			{
				isNew = 0;
			}
		}
		photo = photo.substring(photo.lastIndexOf("\\")+1);
		
		GoodsInfoDAO giDAO = new GoodsInfoDAO();
		giDAO.InsertGoodsInfo(typeId, goodsName, price, discount, isNew, isRecommend, status, photo, remark);
		doSearch(request, response);

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
		
		String goodsName = request.getParameter("goodsName");
		String typeId = request.getParameter("typeId");
		String price = request.getParameter("price");
		String discount = request.getParameter("discount");
		String remark = request.getParameter("remark");
		String[] chk = request.getParameterValues("checkbox");
		String photo = request.getParameter("photo");
		String goodsId = request.getParameter("goodsId");
		
		GoodsInfoDAO gdDAO = new GoodsInfoDAO();
		gdDAO.updateGoodsInfo(goodsName, typeId, price, discount, chk, photo, remark, goodsId);
	}
	/**
	 * 
	 * 跳转到添加商品页面
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doAddGoodsInfo (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("addGoods.jsp").forward(request, response);
	}
}
