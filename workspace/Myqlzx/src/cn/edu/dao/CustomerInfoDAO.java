package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.edu.model.CustomerInfo;
import cn.edu.model.PageModel;
import cn.edu.util.DBConn;
import cn.edu.util.PublicUtil;


public class CustomerInfoDAO {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	/**
	 * 
	 * 判断用户是否登录
	 * @param userName
	 * @param userPwd
	 * @return
	 */
	public boolean judgeUserInfo(String userName,String userPwd)
	{
		Connection conn = DBConn.getConn();
		String sql = "select * from CustomerInfo";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				if(rs.getString("email").equals(userName) && rs.getString("pwd").equals(userPwd))
				{
					return true;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return false;
	}
	
	/**
	 * 
	 * 根据用户邮箱查询用户
	 * @param email
	 * @return
	 */
	public CustomerInfo getCustomerInfoByEmail(String email)
	{
		
		String sql = "select * from CustomerInfo where email = " + email;
		CustomerInfo ci = DBConn.getCustomerInfo(sql);
		
		return ci;
	}
	
	/**
	 * 通过Id来获取客户信息
	 * @param id
	 * @return
	 */
	public CustomerInfo getCustomerInfoById(int id)
	{
		String sql = "select * from CustomerInfo where id = " + id;
		CustomerInfo ci = DBConn.getCustomerInfo(sql);
		return ci;
	}
	
	/**
	 * 
	 * 获得全部的客户信息
	 * @return
	 */
	public ArrayList<CustomerInfo> getAllCustomerInfo()
	{
		String sql = "select * from customerInfo";
		
		return DBConn.ExecCustomerInfo(sql);		
	}
	
	/**
	 * 
	 * 获得全部的客户信息（具有分页关键字查询功能）
	 * @param key
	 * @param pm
	 * @return
	 */
	public ArrayList<CustomerInfo> getAllCustomerInfo(String key,PageModel pm)
	{
		int currentPage = pm.getCurrentPage();
		int perPageCount = pm.getPerPageCount();
		
		if(pm.getCurrentPage()==pm.getLastPage() && pm.getSumCount()%pm.getPerPageCount()!=0)
		{
			perPageCount = pm.getSumCount()%pm.getPerPageCount();
		}
		
		String sql = "select * from (select top "+perPageCount+" * from (select top "+pm.getPerPageCount()*currentPage+" * from CustomerInfo where email like '%"+key+"%' order by id desc) as a order by id desc) as b order by id";
		
		return DBConn.ExecCustomerInfo(sql);
	}

	/**
	 * 
	 *添加新客户
	 * @param name
	 * @param pwd
	 */
	public void addCustomer(String email,String pwd)
	{
		String sql = "insert into CustomerInfo values('"+email+"','"+pwd+"',getdate())";
		
		DBConn.ExecIUD(sql);
	}
	public void addCustomer(String email,String pwd,Date registerTime)
	{
		String sql = "insert into CustomerInfo values('"+email+"','"+pwd+"','"+registerTime+"')";
		
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 删除单个或者多个客户的操作
	 * @param deleteValue
	 */
	public void deleteCustomerInfo(String deleteValue) 
	{
		System.out.println(deleteValue.length());
		deleteValue = deleteValue.substring(0,deleteValue.length()-1);
		
		String sql1 = "delete from CustomerDetailInfo where customerId in ("+deleteValue+")";
		String sql2 = "delete from CustomerInfo where id in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql1);
		DBConn.ExecIUD(sql2);
	}
	
	public void deleteOne(String deleteValue)
	{		
		String sql1 = "delete from CustomerDetailInfo where customerId in ("+deleteValue+")";
		String sql2 = "delete from CustomerInfo where id in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql1);
		DBConn.ExecIUD(sql2);
	}
	/**
	 * 
	 * 通过客户的Id来删除客户
	 * @param id
	 */
	public void deleteCustomerInfoById(int id)
	{
		
		String sql = "delete CustomerInfo where id ="+id;
		
		DBConn.ExecIUD(sql);
	}
	
	public int getSumCount()
	{
		return DBConn.getSumCount("CustomerInfo");
	}
	
	/**
	 * 修改客户信息
	 * @param id
	 * @param email
	 * @param registerTime
	 */
	public void updateCustomerInfo(int id,String email,String registerTime)
	{
		String sql = "update CustomerInfo set email = '"+email+"',registerTime ='"+registerTime+"' where id = "+id;
		
		DBConn.ExecIUD(sql);
	}
}
