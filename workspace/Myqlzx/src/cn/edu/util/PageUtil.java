package cn.edu.util;

import javax.servlet.http.HttpServletRequest;

import cn.edu.model.PageModel;

public class PageUtil {

	/**
	 * 
	 * 设置PageModel
	 * @param request
	 * @param sumCount
	 * @return
	 */
	public static PageModel getPageInfo(HttpServletRequest request,int sumCount)
	{
		PageModel pm = new PageModel();
		pm.setSumCount(sumCount);
		String currentPage = request.getParameter("currentPage");
		pm.setLastPage(pm.getSumPage());
		
		//设置当前页
		if(PublicUtil.publicCheckNull(currentPage))
		{
			pm.setCurrentPage(Integer.parseInt(currentPage));
		}
		else
		{
			pm.setCurrentPage(1);
		}
		//如果当前页为首页，则上一页为不能减一
		if(pm.getCurrentPage()==1)
		{
			pm.setPrePage(1);
		}
		else
		{
			pm.setPrePage(pm.getCurrentPage()-1);
		}
		
		
		//如果当前页为最后一页，则下一页不能加一
		if(pm.getCurrentPage()==pm.getLastPage())
		{
			pm.setNextPage(pm.getLastPage());
		}
		else
		{
			pm.setNextPage(pm.getCurrentPage()+1);
		}
		
		request.setAttribute("homePage", 1);//首页
		request.setAttribute("currentPage", pm.getCurrentPage());//当前页
		request.setAttribute("prePage", pm.getPrePage());//上一页
		request.setAttribute("nextPage", pm.getNextPage());//下一页
		request.setAttribute("sumPage",pm.getSumPage());//总页数 
		request.setAttribute("lastPage", pm.getLastPage());//尾页
		
		return pm;
		
	}
	/**
	 * 
	 * 设置分页信息
	 * @param request
	 * @param url
	 * @param colspan
	 * @return
	 */
	public static String getUrlInfo(HttpServletRequest request,String url,int colspan)
	{	
		StringBuffer str = new StringBuffer();
		str.append("<tr>");
		str.append("<td align='center' colspan='"+colspan+"' width='80%'>");
		str.append("<a href='"+url+"?currentPage="+request.getAttribute("homePage")+"&method=search'>首页</a>&nbsp;&nbsp;");
		str.append("<a href='"+url+"?currentPage="+request.getAttribute("prePage")+"&method=search'>上一页</a>&nbsp;&nbsp;");
		str.append("<a href='"+url+"?currentPage="+request.getAttribute("nextPage")+"&method=search'>下一页</a>&nbsp;&nbsp;");
		str.append("<a href='"+url+"?currentPage="+request.getAttribute("lastPage")+"&method=search'>尾页</a>&nbsp;&nbsp;");
		str.append("当前"+ request.getAttribute("currentPage") +"/"+request.getAttribute("sumPage") +"页&nbsp;&nbsp;");
		str.append("<input type='text' size='5' name='page' id='page'/>&nbsp;&nbsp;</a>");
		str.append("<input type='button' onClick='GO();' value='GO' class='btn'/></td>");
		str.append("</tr>");
		
		return str.toString();
		
	}
	
}
