//Source file: c:\\DM\\RenderAccountDM.java

package DM;

import java.sql.PreparedStatement;
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
import PD.RenderAccount;

public class RenderAccountDM extends  DBConnection //����
{
   private RenderAccount RA;
   
   /**
    * @roseuid 4FE1D625027F
    */
   public RenderAccountDM() 
   {
    
   }
   
   /**
    * @param ID
    * @return Double
    * @roseuid 4FE0291602BD
    */
   public Double searchAmount(Long ID) 
   {
    return null;
   }//����
   
   /**
    * @param account
    * @return String
    * @roseuid 4FE02AD800C7
    */
   public String insertRA() 
   {
	   	 HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 String receiptAccount = request.getParameter("receiptAccount");
		 String balance = request.getParameter("balance");
		 Date date = new Date();
		 Timestamp ts = new Timestamp(date.getTime());
		 String bztime = ts.toString().substring(0,10);
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set receiptAccount=?,balance=?,bztime=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, receiptAccount);
				pst.setString(2, balance);
				pst.setString(3, bztime);
				pst.setString(4, Apply_ID);
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
   }//���
   
   /**
    * @roseuid 4FE0298801D8
    */
   public void isFinCheck() 
   {
    
   }//��������ʵ�Ƿ�ͨ��
   
   /**
    * @param ID
    * @return String
    * @roseuid 4FE02A1F006A
    */
   public String deleteRA(Long ID) 
   {
    return null;
   }
   
   /**
    * @return ArrayList<RenderAccount>
    * @roseuid 4FE084F50190
    */
   public ArrayList<RenderAccount> searchAll(String name) 
   {
	   ArrayList<RenderAccount> list = new ArrayList();			
		System.out.println(name);
		this.OpenDB();
		String selectSQL="select  Apply_ID,amount,reason,receiptAccount,balance,isManApproval,isFinCheck,isManCheck,bztime,protime from ApplicationForm where ApplicationForm.Staff_ID='"+name+"'";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				RenderAccount ra=new RenderAccount();
				ra.setReason(rs.getString("reason"));
				ra.setApply_ID(rs.getString("Apply_ID"));		//����ID
				ra.setAmount(rs.getDouble("amount"));			//������
				ra.setReceiptAccount(rs.getDouble("receiptAccount"));	//���ѽ��
				ra.setBalance(rs.getDouble("balance"));		//���
				ra.setIsFinCheck(rs.getString("isFinCheck"));	//��������ʵ
				ra.setIsManCheck(rs.getString("isManCheck"));	//������ʵ
				ra.setIsManApproval(rs.getString("isManApproval"));//�������׼
				ra.setBztime(rs.getString("bztime"));	//����ʱ��
				ra.setProtime(rs.getString("protime"));
				list.add(ra);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
   }//����ȫ��
}
