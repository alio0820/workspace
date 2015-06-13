package com.etc.OurProgram.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.etc.OurProgram.service.financeInsertService;
import com.etc.OurProgram.util.Conn;
import java.sql.Connection;
import com.mysql.jdbc.Statement;
import com.opensymphony.xwork2.Result;

public class financeInsertServiceImpl implements financeInsertService {

	public boolean insert(String Date,String Own_project,String Money,String Borrow_object,String Pay_way,String Government_buystyle,String Government_buysite,String ProofID,String Contract_special,String Summary,String Haber_subject,String Project_manage,String Government_buyway,String Government_buyclassify,String IsSubmit) throws ClassNotFoundException, SQLException {
		Conn conn=new Conn();
		Connection connection=conn.getConnection(null);
		Statement st=(Statement) connection.createStatement();
		ResultSet rt=st.executeQuery("select proofID from finance");
		while(rt.next()){
			String id=rt.getString("proofID");
			if(ProofID.equals(id))
			{
				return false;
			}
		}
		  int i=st.executeUpdate("insert into finance(date,own_project,money,borrow_object,pay_way,government_buystyle,government_buysite,proofID,contract_special,summary,haber_subject,project_manage,government_buyway,government_buyclassify)" +
		  		"values('"+Date+"','"+Own_project+"','"+Money+"','"+Borrow_object+"','"+Pay_way+"','"+Government_buystyle+"','"+Government_buysite+"','"+ProofID+"','"+Contract_special+"','"+Summary+"','"+Haber_subject+"','"+Project_manage+"','"+Government_buyway+"','"+Government_buyclassify+"')");
		  connection.close();
		
		return true;
	}

	

}
