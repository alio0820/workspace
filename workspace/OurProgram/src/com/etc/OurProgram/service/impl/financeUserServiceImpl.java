package com.etc.OurProgram.service.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.etc.OurProgram.javabean.financeUser;
import com.etc.OurProgram.service.financeUserService;
import com.etc.OurProgram.util.Conn;
import java.sql.Connection;
import com.mysql.jdbc.Statement;

public class financeUserServiceImpl implements financeUserService {

	public List queryUser() {
		// TODO Auto-generated method stub
		Conn conn=new Conn();
		Connection connection = null;
		connection = conn.getConnection(null);
		Statement st = null;
		try {
			st = (Statement) connection.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			
			ResultSet rs=st.executeQuery("select * from finance order by date");
			List list=new ArrayList();
			while(rs.next()){
				financeUser u=new financeUser();
				u.setId(rs.getInt("id"));
				u.setDate(rs.getString("date"));
				u.setOwn_project(rs.getString("own_project"));
				u.setMoney(rs.getString("money"));
				u.setBorrow_object(rs.getString("borrow_object"));
				u.setPay_way(rs.getString("pay_way"));
				u.setGovernment_buystyle(rs.getString("government_buystyle"));
				u.setGovernment_buysite(rs.getString("government_buysite"));
				u.setProofID(rs.getString("proofID"));
				u.setContract_special(rs.getString("contract_special"));
				u.setSummary(rs.getString("summary"));
				u.setHaber_subject(rs.getString("haber_subject"));
				u.setProject_manage(rs.getString("project_manage"));
				u.setGovernment_buyway(rs.getString("government_buyway"));
				u.setGovernment_buyclassify(rs.getString("government_buyclassify"));
				u.setIsSubmit(rs.getString("isSubmit"));
				list.add(u);
				
			}
			st.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally{
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}

}
