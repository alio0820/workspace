package cn.edu.util;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class PublicUtil {
	/**
	 * 
	 * 检验字符串是否为空
	 * @param obj
	 * @return
	 */
	public static boolean publicCheckNull(Object obj){
		
		if(obj!= null && !obj.toString().trim().equals(""))
		{
			return true;
		}
		return false;
	}
	
	/**
	 * 小数保留两位小数
	 * @param num
	 * @return
	 */
	public static double Convert(double num)
	{
		DecimalFormat df = new DecimalFormat("0.00");
		
		return Double.parseDouble(df.format(num));
		
	}

	public static String Convert(int status)
	{
		if(status == 0)
		{
			return "<a href='OrderServlet?key=0&method=search' style='color:#FF0000'>未确认</a>";
		}
		if(status == 1)
		{
			return "<a href='OrderServlet?key=1&method=search' style='color:#0000FF'>已确认</a>";
		}
		return null;
	}
	
	public static void CheckLogin(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		String name = (String)session.getAttribute("name");
		String pwd = (String)session.getAttribute("pwd");
		if(name==null||pwd==null)
		{
			try {
				response.sendRedirect("../login.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
