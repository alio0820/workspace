package swu.edu.cn.Action;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import swu.edu.cn.sql.LeaderCheckManagement;

public class LeaderCheckAction {
	public void ps() throws IOException{
		 HttpServletRequest request=ServletActionContext.getRequest();
		 HttpServletResponse response=ServletActionContext.getResponse();
		 String responseText="";
		 int taskMonth=-1;
		 //��ȡǰֵ̨
		 String value = request.getParameter("value");
		 value=new String(value.getBytes("ISO8859-1"),"GBK");		//ת����ı������ҳ��ı����й�
		 int projectId = Integer.parseInt(request.getParameter("projectId"));
		 HttpSession session = request.getSession();
		 String name = session.getAttribute("realName").toString();
		 if(request.getParameter("taskMonth")!=null)
			 taskMonth = Integer.parseInt(request.getParameter("taskMonth").toString());
		 LeaderCheckManagement lcm=new LeaderCheckManagement();
		 lcm.OpenDB();
		 boolean bl = lcm.createCheck(projectId, taskMonth, name, value);
		 if(bl)
			 responseText = "����ʾ";
		 else
			 responseText = "��ʾʧ��";
		 response.setContentType("text/html;charset=UTF-8");		 
		 PrintWriter out =response.getWriter(); 			 
		 out.print(responseText);    
		 out.flush();    
		 out.close();
	}
}
