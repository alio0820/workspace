//Source file: c:\\PD\\ManagementCheck.java

package PD;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.swu.sql.DBConnection;


public class ManagementCheck extends  DBConnection
{
   private String checkPerson;//∫À µ»À
   private Long Apply_ID;//…Í«Î±Ìid
   
   /**
    * @roseuid 4FE1D4600320
    */
   public ManagementCheck() 
   {
    
   }
   
   /**
    * @param (isManCheck
    * @return Boolean
    * @roseuid 4FDE30E90390
    */
   public ArrayList<ApplicationForm> ManCheck(){
	    ArrayList<ApplicationForm> list = new ArrayList();			
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,receiptAccount,reason,shroffAccountNumber,bztime from ApplicationForm,person where ApplicationForm.isFinCheck='true' and isManCheck is null and bztime is not null and ApplicationForm.Staff_ID=person.name";
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
 
 public String ManCheckUpdate(){
	     HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String isManCheck = request.getParameter("isManCheck");
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set isManCheck=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, isManCheck);
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
 
 public ArrayList<ApplicationForm> ManProCheck(){
	    ArrayList<ApplicationForm> list = new ArrayList();			
		this.OpenDB();
		String selectSQL="select  Apply_ID,realName,amount,receiptAccount,reason,income,protime,shroffAccountNumber,bztime from ApplicationForm,person where isFinProjectCheck='true' and isManProjectCheck is null and protime is not null and ApplicationForm.Staff_ID=person.name";
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

public String ManProCheckUpdate(){
	     HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String isManProjectCheck = request.getParameter("isManProjectCheck");
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set isManProjectCheck=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, isManProjectCheck);
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
}
