package com.etc.OurProgram.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.etc.OurProgram.service.financeUpdateSuccessService;
import com.etc.OurProgram.util.Conn;
import java.sql.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

public class financeUpdateSuccessServiceImpl implements financeUpdateSuccessService {

	public boolean updateSucess(int Id,String Date,String Own_project,String Money,String Borrow_object,String Pay_way,String Government_buystyle,String Government_buysite,String ProofID,String Contract_special,String Summary,String Haber_subject,String Project_manage,String Government_buyway,String Government_buyclassify,String IsSubmit) {
		   Conn conn=new Conn();
		  try {
			Connection connection=conn.getConnection(null);
			//PreparedStatement psmt=(PreparedStatement) connection.prepareStatement("update finance set isSubmit=? where id=?");
			PreparedStatement psmt=(PreparedStatement) connection.prepareStatement("update  finance set date=? ,own_project=? ,money=? ,borrow_object=? ,pay_way=? ,government_buystyle=? ,government_buysite=? ,contract_special=? ,summary=? ,haber_subject=?, project_manage=?, government_buyway=?, government_buyclassify=? ,isSubmit=? where proofID=? ");
			psmt.setString(1,Date);
			psmt.setString(2,Own_project);
			psmt.setString(3,Money);
			psmt.setString(4,Borrow_object);
			psmt.setString(5,Pay_way);
			psmt.setString(6,Government_buystyle);
			psmt.setString(7,Government_buysite);
			
			
			psmt.setString(8,Contract_special);
			psmt.setString(9,Summary);
			psmt.setString(10,Haber_subject);
			psmt.setString(11,Project_manage);
			psmt.setString(12,Government_buyway);
			psmt.setString(13,Government_buyclassify);
			psmt.setString(14,IsSubmit);
			psmt.setString(15,ProofID);
			int i=psmt.executeUpdate();
			System.out.println(i);
			System.out.println(Id);
			System.out.println(Summary);
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

}
