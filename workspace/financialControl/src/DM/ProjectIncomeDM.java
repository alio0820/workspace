//Source file: c:\\DM\\ProjectIncomeDM.java

package DM;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import cn.edu.swu.sql.DBConnection;

import PD.ProjectIncome;
import PD.ApplicationForm;
import PD.RenderAccount;

public class ProjectIncomeDM extends  DBConnection//��Ŀ����
{
   private ProjectIncome PI;
   
   /**
    * @roseuid 4FE1D62503C4
    */
   public ProjectIncomeDM() 
   {
    
   }
   
   /**
    * @param ID
    * @return PD.ApplicationForm
    * @roseuid 4FE02AC90033
    */
   public ApplicationForm searchForm(long ID) 
   {
    return null;
   }//����
   
   /**
    * @return ArrayList<ProjectIncome>
    * @roseuid 4FE0850D00FB
    */
   public ArrayList<ProjectIncome> searchAll(String name)
   {
	   ArrayList<ProjectIncome> list = new ArrayList();			
		System.out.println(name);
		this.OpenDB();
		String selectSQL="select  Apply_ID,amount,income,reason,isManApproval,isFinProjectCheck,isManProjectCheck,bztime,protime from ApplicationForm where ApplicationForm.Staff_ID='"+name+"'";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				ProjectIncome pi=new ProjectIncome();
				pi.setReason(rs.getString("reason"));
				pi.setIsManApproval(rs.getString("isManApproval"));
				pi.setApply_ID(rs.getString("Apply_ID"));		//����ID
				pi.setAmount(rs.getDouble("amount"));			//������
				pi.setIncome(rs.getDouble("income"));		//��Ŀ����
				pi.setIsFinProjectCheck(rs.getString("isFinProjectCheck"));	//��������ʵ
				pi.setIsManProjectCheck(rs.getString("isManProjectCheck"));	//������ʵ
				pi.setProtime(rs.getString("protime"));	//�ύʱ��
				pi.setBztime(rs.getString("bztime"));
				list.add(pi);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
   }//����ȫ��
   
   /**
    * @param income
    * @return String
    * @roseuid 4FE02BC0005D
    */
   public String insertPI()
   {
	   	 HttpServletRequest request=ServletActionContext.getRequest();
		 String Apply_ID = request.getParameter("Apply_ID");
		 Double income = Double.valueOf(request.getParameter("income"));
		 Date date = new Date();
		 Timestamp ts = new Timestamp(date.getTime());
		 String protime = ts.toString().substring(0,10);
		 this.OpenDB();
		 boolean bl=false;
		 String sql="update applicationform set income=?,protime=? where Apply_ID=?;";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setDouble(1, income);
				pst.setString(2, protime);
				pst.setString(3, Apply_ID);
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
   }//��Ŀ�������㱨
   
   /**
    * @roseuid 4FE02C7E0371
    */
   public void isFinCheck() 
   {
    
   }//����Ƿ�ͨ��
   
   /**
    * @param ID
    * @return String
    * @roseuid 4FE02C9A01FD
    */
   public String deletePI(Long ID) 
   {
    return null;
   }//ɾ��
}
