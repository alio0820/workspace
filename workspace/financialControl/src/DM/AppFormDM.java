//Source file: c:\\DM\\AppFormDM.java

package DM;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import cn.edu.swu.sql.DBConnection;
import PD.ApplicationForm;

public class AppFormDM extends  DBConnection//申请表
{
   private ApplicationForm form;
   
   /**
    * @roseuid 4FE1D6250168
    */
   public AppFormDM() 
   {
    
   }
   
   /**
    * @param ID
    * @return PD.ApplicationForm
    * @roseuid 4FE023EE01B5
    */
   public ApplicationForm searchForm(long ID) 
   {
    return null;
   }//查找
   
   /**
    * @return list
    * @roseuid 4FE06917018D
    */
   public ArrayList<ApplicationForm> searchAll(String name)
   {
	   	ArrayList<ApplicationForm> list = new ArrayList();			
		System.out.println(name);
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,reason,shroffAccountNumber,isFinApproval,isManApproval,appTime from ApplicationForm,person where ApplicationForm.Staff_ID='"+name+"' and ApplicationForm.Staff_ID=person.name";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ApplicationForm af=new ApplicationForm();
				
				af.setApply_ID(rs.getString("Apply_ID"));
				af.setApplicant(rs.getString("realName"));
				af.setAmount(rs.getDouble("amount"));
				af.setReason(rs.getString("reason"));
				af.setShroffAccountNumber(rs.getString("shroffAccountNumber"));
				af.setIsFinApproval(rs.getString("isFinApproval"));
				af.setIsManApproval(rs.getString("isManApproval"));
				af.setAppTime(rs.getString("appTime"));
				list.add(af);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//查找单个

   
   /**
    * @param form
    * @return String
    * @roseuid 4FE0267800B8
    */
   public String insertForm()
   {	   	 
	   	 HttpServletRequest request=ServletActionContext.getRequest();
	   	 HttpSession session = request.getSession();
	   	 String Staff_ID = session.getAttribute("name").toString();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String amount = request.getParameter("amount");
		 String reason = request.getParameter("reason");
		 String shroffAccountNumber = request.getParameter("shroffAccountNumber");
		 Date date = new Date();
		 Timestamp ts = new Timestamp(date.getTime());
		 String apptime = ts.toString().substring(0,10);
		 String insertSQL="insert into applicationform(Apply_ID,Staff_ID,amount,reason,shroffAccountNumber,appTime) values('"+Apply_ID+"','"+Staff_ID+"','"+amount+"','"+reason+"','"+shroffAccountNumber+"','"+apptime+"');";
		 System.out.println(insertSQL);
		 this.OpenDB();
		 boolean bl = this.insertDB(insertSQL);
		 this.CloseDB();
		 if(bl)
			 return "success";
		 else
			 return "input";
   }//添加
   
   /**
    * @param ID
    * @return String
    * @roseuid 4FE0245501CC
    */
   public String deleteForm(Long ID)
   {
    return null;
   }//删除
   
   /**
    * @roseuid 4FE0285A03BB
    */
   public void isFinApproval() 
   {
    
   }
}
