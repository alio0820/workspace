//Source file: c:\\PD\\FinanicalCheck.java

package PD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.swu.sql.DBConnection;


public class FinanicalCheck extends  DBConnection
{
   private Long Apply_ID;//所报销的申请表id
   private String CheckingPerson;//核实人
   public FinanicalCheck theFinanicalCheck;
   
   /**
    * @roseuid 4FE1D46A0098
    */
   public FinanicalCheck() 
   {
    
   }
   
   /**
    * @param isFinCheck
    * @return Boolean
    * @roseuid 4FDE2F7603CC
    */
   public ArrayList<ApplicationForm> FinCheck(){
	    ArrayList<ApplicationForm> list = new ArrayList();			
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,receiptAccount,reason,shroffAccountNumber,bztime from ApplicationForm,person where ApplicationForm.isFinCheck IS NULL and bztime is not null and ApplicationForm.Staff_ID=person.name";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ApplicationForm af=new ApplicationForm();
				
				af.setApply_ID(rs.getString("Apply_ID"));
				af.setApplicant(rs.getString("realName"));
				af.setAmount(rs.getDouble("amount"));
				af.setReceiptAccount(rs.getDouble("receiptAccount"));
				af.setReason(rs.getString("reason"));
				af.setShroffAccountNumber(rs.getString("shroffAccountNumber"));
				af.setBztime(rs.getString("bztime"));
				list.add(af);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
  }
  
  public String FinCheckUpdate(){
	     HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String isFinCheck = request.getParameter("isFinCheck");
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set isFinCheck=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, isFinCheck);
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
   
  
  public ArrayList<ApplicationForm> FinProCheck(){
	    ArrayList<ApplicationForm> list = new ArrayList();			
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,receiptAccount,reason,income,shroffAccountNumber,protime from ApplicationForm,person where isFinProjectCheck IS NULL and protime is not null and ApplicationForm.Staff_ID=person.name";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ApplicationForm af=new ApplicationForm();
				
				af.setApply_ID(rs.getString("Apply_ID"));
				af.setApplicant(rs.getString("realName"));
				af.setAmount(rs.getDouble("amount"));
				af.setIncome(rs.getDouble("income"));
				af.setProtime(rs.getString("protime"));
				af.setReceiptAccount(rs.getDouble("receiptAccount"));
				af.setReason(rs.getString("reason"));
				af.setShroffAccountNumber(rs.getString("shroffAccountNumber"));
				list.add(af);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
}

  	public String FinProCheckUpdate(){
	     HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String isFinProjectCheck = request.getParameter("isFinProjectCheck");
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set isFinProjectCheck=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, isFinProjectCheck);
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
			 return "project";
		 else
			 return "input";
}

   /**
    * @return Double
    * @roseuid 4FDE2FDB00D8
    */
   public Double calcAmount() 
   {
    return null;
   }//计算金额是否正确
}
