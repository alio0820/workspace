package com.chinasoft.controller;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.chinasoft.service.CostImpl;
import com.chinasoft.service.UserImpl;
import com.chinasoft.utils.ConnectionUitls;

public class LoginAndCost {
	
	public Map login(Map map){
		
		Connection con = ConnectionUitls.getConnection();
		try {
			con.setAutoCommit(false);
		} catch (SQLException e) {			
			e.printStackTrace();
		}
		
		CostImpl costImpl = new CostImpl();
		UserImpl userImpl = new UserImpl();
		Map m= new HashMap();
		try{
			costImpl.updateCost(m);
			userImpl.doLogin(map);
			con.commit();
		}catch(Exception e){
			try {
				con.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
}
