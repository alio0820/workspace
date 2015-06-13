package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.BulletinDAO;
import cn.edu.model.Bulletin;
import cn.edu.model.PageModel;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class BulletinServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String method = request.getParameter("method");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

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
	 * 查询公告
	 * @param request
	 * @param response
	 * @throws ServletException
	 * @throws IOException
	 */
	public void doSearch (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BulletinDAO btDAO = new BulletinDAO();
		String key = request.getParameter("key");

		int sumCount = btDAO.getSumCount();
		PageModel pm = PageUtil.getPageInfo(request, sumCount);
		
		if(key==null)
		{
			key = "";
		}
		
		ArrayList<Bulletin> btList = btDAO.getAllBulletinList(key, pm);
		
		request.setAttribute("btList", btList);
		request.getRequestDispatcher("bulletinManage.jsp").forward(request, response);
		
	}
	/**
	 * 
	 * 删除单个或者多个公告
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
	
	public void doDeleteOne(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BulletinDAO btDAO = new BulletinDAO();			
		String deleteValue = request.getParameter("deleteValue");
		System.out.println(deleteValue);
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
		
		BulletinDAO btDAO = new BulletinDAO();
		Bulletin bt = new Bulletin();
		String str_reworkValue = request.getParameter("reworkValue");
		
		if(PublicUtil.publicCheckNull(str_reworkValue))
		{
			int reworkValue = Integer.parseInt(str_reworkValue);
			bt = btDAO.getBulletin(reworkValue);
		} 
		request.setAttribute("reworkBt", bt);
		request.getRequestDispatcher("updateBulletin.jsp").forward(request, response);
		
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
		
		String title = request.getParameter("textTitle");
		String content = request.getParameter("textarea");
		
//		System.out.println(title);
//		System.out.println(content);
		
		BulletinDAO btDAO = new BulletinDAO();
		btDAO.InsertBulletin(title, content);
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
		
		String str_id = request.getParameter("textId");
		int id = Integer.parseInt(str_id);
		String title = request.getParameter("textTitle");
		String content = request.getParameter("textarea");
		
		BulletinDAO btDAO = new BulletinDAO();
		btDAO.updateBulletin(title, content, id);
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
		
		request.getRequestDispatcher("addBulletin.jsp").forward(request, response);
		
	}
}

