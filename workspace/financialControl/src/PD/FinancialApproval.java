//Source file: c:\\PD\\FinancialApproval.java

package PD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.ServletActionContext;
import cn.edu.swu.sql.DBConnection;

public class FinancialApproval extends  DBConnection
{
   private String approvingPerson;//财政部批准人
   private Long Apply_ID;//被批准申请表id
   
   /**
    * @roseuid 4FE1D466020F
    */
   public FinancialApproval() 
   {    
   }
   
   /**
    * @param isFinApproval
    * @return Boolean
    * @roseuid 4FDE1EB9015B
    * //查找所有待批准的申请，以列表的形式返回
    */
   public ArrayList<ApplicationForm> FinApproval(){
	    ArrayList<ApplicationForm> list = new ArrayList();			
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,reason,shroffAccountNumber,appTime from ApplicationForm,person where ApplicationForm.isFinApproval IS NULL and ApplicationForm.Staff_ID=person.name";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ApplicationForm af=new ApplicationForm();
				
				af.setApply_ID(rs.getString("Apply_ID"));
				af.setApplicant(rs.getString("realName"));
				af.setAmount(rs.getDouble("amount"));
				af.setReason(rs.getString("reason"));
				af.setShroffAccountNumber(rs.getString("shroffAccountNumber"));
				af.setAppTime(rs.getString("appTime"));
				list.add(af);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
   }
   
   public String FinApprovalUpdate(){
	     HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String isFinApproval = request.getParameter("isFinApproval");
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set isFinApproval=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, isFinApproval);
				pst.setString(2, Apply_ID);
				int n=pst.executeUpdate();
				if(n>0)
					bl=true;
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		 this.CloseDB();
		 if(bl)
			 return "success";
		 else
			 return "input";
   }
}
