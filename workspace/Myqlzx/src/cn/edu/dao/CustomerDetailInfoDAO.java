package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.util.DBConn;


public class CustomerDetailInfoDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**
	 * 
	 * 添加用户的详细信息
	 * @param customerId
	 * @param name
	 * @param telphone
	 * @param movePhone
	 * @param address
	 */
	public void addCustomerDetail(int customerId,String name,String telphone,String movePhone,String address)
	{
		String sql = "insert into CustomerDetailInfo values ("+customerId+",'"+name+"','"+telphone+"','"+movePhone+"','"+address+"')";
		
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 通过客户ID来获取客户的详细信息
	 * @param customerId
	 * @return
	 */
	public CustomerDetailInfo getCustomerDetailByCustomerId(int customerId)
	{
		Connection conn = DBConn.getConn();
		String sql = "select * from CustomerDetailInfo where customerId = "+customerId;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				CustomerDetailInfo ctd = new CustomerDetailInfo();
				ctd.setName(rs.getString("name"));
				ctd.setCustomerId(rs.getInt("customerId"));
				ctd.setTelphone(rs.getString("telphone"));
				ctd.setMobilephone(rs.getString("movePhone"));
				ctd.setAddress(rs.getString("address"));
				
				return ctd;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	/**
	 * 
	 * 删除客户的详细信息
	 */
	public void deleteCustomerDetailInfoById(int customerId)
	{
		String sql = "delete CustomerDetailInfo where customerId = "+customerId;
		
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 修改客户详细信息
	 * @param customerId
	 * @param name
	 * @param telphone
	 * @param movePhone
	 * @param address
	 */
	public void updateCustomerDetailInfo(int customerId,String name,String telphone,String movePhone,String address)
	{
		String sql = "update CustomerDetailInfo set name = '"+name+"',telphone = '"+telphone+"',movePhone = '"+movePhone+"',address = '"+address+"' where customerId = " + customerId;
		
		DBConn.ExecIUD(sql);
	}
	
}
