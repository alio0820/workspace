package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import swu.edu.cn.sql.UserManagement;

public class Filter extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=gb2312");
		PrintWriter out = response.getWriter();
		
		String userName=request.getParameter("userName");
			
		String password=request.getParameter("password");
		
		String incode = (String)request.getParameter("Code");
		String rightcode = (String)request.getSession().getAttribute("numrand");//汉字验证码的话则是hanzirand
		
		System.out.print(rightcode + "DJDDFFDF");
		
		if (incode != null && rightcode != null) {
			if (rightcode.equals(incode)){				
				String target = null;				//跳转的目标页的地址
				System.out.println(userName);
				System.out.println(password);
				System.out.println();
				
				RequestDispatcher dispatcher=null;
				UserManagement userManager=new UserManagement();
				userManager.OpenDB();				
				
				boolean bb=userManager.isUserExistAndLegal(userName, password);
				System.out.print(bb);								
				
				if (bb) {					
					out.print("<script>alert('登录成功，为您跳转中');</script>");			
					HttpSession  hs=request.getSession();	
					hs.setAttribute("userName", userManager.userName);
					hs.setAttribute("departmentId", userManager.classes);
					hs.setAttribute("realName", userManager.realName);
					hs.setAttribute("departmentName", userManager.departmentName);
					
					if(userManager.classes.trim().equalsIgnoreCase("admin")){	
						System.out.print("admin login!");
						System.out.print("admin login!");
						//response.sendRedirect("http://www.baidu.com");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index.htm");
						//系统管理员页面
					}else if(userManager.classes.equalsIgnoreCase("ducha")){
						hs.setAttribute("position", "duchashi_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//督查室页面			
					}else if(userManager.classes.equalsIgnoreCase("fenguanLeader")){
						hs.setAttribute("position", "qufenguan_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//区分管领导页面			
					}else if(userManager.classes.equalsIgnoreCase("pishiLeader")){
						hs.setAttribute("position", "lead_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//批示领导页面			
					}else{
						hs.setAttribute("position", "department");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//实际部门页面			
					}
				}else {
					out.print("<script>alert('用户名或密码错误！');history.back();</script>");			
					//response.sendRedirect("index.jsp");	
				}
				userManager.CloseDB();
				
			} else {
				out.print("<script>alert('验证码错误');history.back();</script>");
				//response.sendRedirect("index.jsp");
			}
		}
		
		
//		String radio=request.getParameter("radio");
		
		
		//dispatcher = request.getRequestDispatcher(target);  //跳转到目标页面
		
//		request.setAttribute("userName", userManager.userName);
//		request.setAttribute("classes", userManager.classes);
//		request.setAttribute("realName", userManager.realName);
		
		//dispatcher.forward(request, response);
	}
	
//		
//		if(radio.equals("department")){			//部门用户
//			System.out.println("这是一个部门用户");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//该部门用户存在
//					target="/index_duty.htm";
//				}else{
//					System.out.println("该用户不存在");
//					target="/login.htm";
//				}
//		}else if(radio.equals("admin")){
//			System.out.println("这是管理员");
//			boolean flag=userManager.isAdminExist(userName, password);
//			if(flag){		//该部门用户存在
//				target="/index_duty.htm";
//			}else{
//				System.out.println("该用户不存在");
//				target="/login.htm";
//			}
//		}else if(radio.equals("ducha")) {
//			System.out.println("这是一个督查用户");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//该部门用户存在
//					target="/index_duty.htm";
//				}else{
//					System.out.println("该用户不存在");
//					target="/login.htm";
//				}
//		}else if(radio.equals("fenguanLeader")){
//			System.out.println("这是一个分管领导用户");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//该部门用户存在
//					target="/index_duty.htm";
//				}else{
//					System.out.println("该用户不存在");
//					target="/login.htm";
//				}
//		}else if(radio.equals("pishiLeader")) {
//			System.out.println("这是一个批示领导用户");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//该部门用户存在
//					target="/index_duty.htm";
//				}else{
//					System.out.println("该用户不存在");
//					target="/login.htm";
//				}
//		}else {
//			target="/login.htm";
//		}
		
//		userManager.CloseDB();
//		dispatcher = request.getRequestDispatcher(target);  //跳转到目标页面
//		dispatcher.forward(request, response);
//	}


	public void init() throws ServletException {
		// Put your code here
	}

}
