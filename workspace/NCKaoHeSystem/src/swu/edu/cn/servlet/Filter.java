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
		String rightcode = (String)request.getSession().getAttribute("numrand");//������֤��Ļ�����hanzirand
		
		System.out.print(rightcode + "DJDDFFDF");
		
		if (incode != null && rightcode != null) {
			if (rightcode.equals(incode)){				
				String target = null;				//��ת��Ŀ��ҳ�ĵ�ַ
				System.out.println(userName);
				System.out.println(password);
				System.out.println();
				
				RequestDispatcher dispatcher=null;
				UserManagement userManager=new UserManagement();
				userManager.OpenDB();				
				
				boolean bb=userManager.isUserExistAndLegal(userName, password);
				System.out.print(bb);								
				
				if (bb) {					
					out.print("<script>alert('��¼�ɹ���Ϊ����ת��');</script>");			
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
						//ϵͳ����Աҳ��
					}else if(userManager.classes.equalsIgnoreCase("ducha")){
						hs.setAttribute("position", "duchashi_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//������ҳ��			
					}else if(userManager.classes.equalsIgnoreCase("fenguanLeader")){
						hs.setAttribute("position", "qufenguan_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//���ֹ��쵼ҳ��			
					}else if(userManager.classes.equalsIgnoreCase("pishiLeader")){
						hs.setAttribute("position", "lead_lead");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//��ʾ�쵼ҳ��			
					}else{
						hs.setAttribute("position", "department");
						response.sendRedirect("http://192.168.0.12:8080/NCKaoHeSystem/index/indicatorBrowse.jsp");
						//ʵ�ʲ���ҳ��			
					}
				}else {
					out.print("<script>alert('�û������������');history.back();</script>");			
					//response.sendRedirect("index.jsp");	
				}
				userManager.CloseDB();
				
			} else {
				out.print("<script>alert('��֤�����');history.back();</script>");
				//response.sendRedirect("index.jsp");
			}
		}
		
		
//		String radio=request.getParameter("radio");
		
		
		//dispatcher = request.getRequestDispatcher(target);  //��ת��Ŀ��ҳ��
		
//		request.setAttribute("userName", userManager.userName);
//		request.setAttribute("classes", userManager.classes);
//		request.setAttribute("realName", userManager.realName);
		
		//dispatcher.forward(request, response);
	}
	
//		
//		if(radio.equals("department")){			//�����û�
//			System.out.println("����һ�������û�");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//�ò����û�����
//					target="/index_duty.htm";
//				}else{
//					System.out.println("���û�������");
//					target="/login.htm";
//				}
//		}else if(radio.equals("admin")){
//			System.out.println("���ǹ���Ա");
//			boolean flag=userManager.isAdminExist(userName, password);
//			if(flag){		//�ò����û�����
//				target="/index_duty.htm";
//			}else{
//				System.out.println("���û�������");
//				target="/login.htm";
//			}
//		}else if(radio.equals("ducha")) {
//			System.out.println("����һ�������û�");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//�ò����û�����
//					target="/index_duty.htm";
//				}else{
//					System.out.println("���û�������");
//					target="/login.htm";
//				}
//		}else if(radio.equals("fenguanLeader")){
//			System.out.println("����һ���ֹ��쵼�û�");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//�ò����û�����
//					target="/index_duty.htm";
//				}else{
//					System.out.println("���û�������");
//					target="/login.htm";
//				}
//		}else if(radio.equals("pishiLeader")) {
//			System.out.println("����һ����ʾ�쵼�û�");			
//			boolean flag=userManager.isDepartmentUserExist(userName, password);				
//			if(flag){		//�ò����û�����
//					target="/index_duty.htm";
//				}else{
//					System.out.println("���û�������");
//					target="/login.htm";
//				}
//		}else {
//			target="/login.htm";
//		}
		
//		userManager.CloseDB();
//		dispatcher = request.getRequestDispatcher(target);  //��ת��Ŀ��ҳ��
//		dispatcher.forward(request, response);
//	}


	public void init() throws ServletException {
		// Put your code here
	}

}
