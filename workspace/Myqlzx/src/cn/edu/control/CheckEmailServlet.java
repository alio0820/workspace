package cn.edu.control;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.dao.CustomerInfoDAO;
import cn.edu.model.CustomerInfo;


public class CheckEmailServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public CheckEmailServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String email = request.getParameter("email");

		CustomerInfoDAO ciDAO = new CustomerInfoDAO();
		ArrayList<CustomerInfo> ctList = ciDAO.getAllCustomerInfo();
		
		if(ctList!=null)
		{
			int i=0;
			for(;i<ctList.size();i++)
			{
				if(ctList.get(i).getEmail().equals(email))
				{
					out.print("true");
					break;
				}
			}
			if(i>=ctList.size())
			{
				if(email.indexOf("@")==-1||email.indexOf(".")==-1)
				{
					out.print("other");
				}
				else
				{
					out.print("false");
				}	
			}
		}
		
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
