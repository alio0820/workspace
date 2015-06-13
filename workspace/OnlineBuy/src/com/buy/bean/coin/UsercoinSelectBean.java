package com.buy.bean.coin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import com.buy.bean.database.DBConnect;

public class UsercoinSelectBean {

	public String selectUsercoin(String ID,int i){
		String condition;
		if(i==0)
			condition = "select coin from user where id = "+ID;
		else if(i==1)
			condition = "select consume from user where id = "+ID;
		else if(i==2)
			condition = "select consume + coin from user where id = "+ID;
		else if(i==3)
			condition = "select name from user where id = "+ID;
		else
			condition = "select type from user where id = "+ID;
		ResultSet rs = null;
		Statement sql = null;
		String str = new String();
		try{
			int coin;
			Connection conn = DBConnect.getConnection();
			sql = conn.createStatement();
			rs = sql.executeQuery(condition);
			while(rs.next()){
				str = rs.getString(1);                  //取结果集记录中的第一个字段
			}
			coin = Integer.parseInt(str);
			rs.close();
			sql.close();
			conn.close();
		}catch(SQLException ex){
			return new String ("can not select");
		}
		return str;
	}
}
