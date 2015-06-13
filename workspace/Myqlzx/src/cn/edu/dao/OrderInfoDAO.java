package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.model.CustomerDetailInfo;
import cn.edu.model.CustomerInfo;
import cn.edu.model.OrderInfo;
import cn.edu.model.PageModel;
import cn.edu.util.DBConn;


public class OrderInfoDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**
	 * 下订单
	 * @param customerId
	 */
	public void addOrderInfo(int customerId)
	{
		String sql = "insert into OrderInfo values("+customerId+",default,getdate())";
		
		DBConn.ExecIUD(sql);
	}
	
	public ArrayList<Integer> getOrderIdByCustomerId(int customerId)
	{
		Connection conn = DBConn.getConn();
		String sql = "select orderId from orderInfo where customerId ="+customerId;
		ArrayList<Integer> iList = new ArrayList<Integer>();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				iList.add(rs.getInt(1));
			}
			return iList;
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
	 * 用分页的形式获得全部订单信息
	 * @return
	 */
	public ArrayList<OrderInfo> getAllOrderInfo(String key,PageModel pm)
	{
		Connection conn = DBConn.getConn();
		
		int currentPage = pm.getCurrentPage();
		int perPageCount = pm.getPerPageCount();
		
		
		if(pm.getCurrentPage()==pm.getLastPage() && pm.getSumCount()%pm.getPerPageCount()!=0)
		{
			perPageCount = pm.getSumCount()%pm.getPerPageCount();
		}

		String sql = "select * from (select top "+perPageCount+" * from (select top "+pm.getPerPageCount()*currentPage+" * from OrderInfo where status like '%"+key+"%' order by orderId desc) as a order by orderId desc) as b order by orderId";
		ArrayList<OrderInfo> oiList = new ArrayList<OrderInfo>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				OrderInfo oi = new OrderInfo();
				
				oi.setOrderId(rs.getInt("orderId"));
				oi.setCustomerId(rs.getInt("customerId"));
				oi.setStatus(rs.getInt("status"));
				oi.setOrderTime(rs.getDate("orderTime"));
				
				oiList.add(oi);
			}
			return oiList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	
	public int getSumCount()
	{
		return DBConn.getSumCount("OrderInfo");
	}
	
	
	public void deleteOrder(String deleteValue)
	{
		Connection conn = DBConn.getConn();
		System.out.println(deleteValue.length());
		deleteValue = deleteValue.substring(0,deleteValue.length()-1);
		
		String sql1 = "delete from OrderInfo where orderId in ("+deleteValue+")";
		String sql2 = "delete from OrderGoodsInfo where orderId in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql2);
		DBConn.ExecIUD(sql1);
	}
	
	/**
	 * 
	 * 删除单个订单
	 * @param deleteValue
	 */
	public void deleteOne(String deleteValue)
	{	
		String sql1 = "delete from OrderInfo where orderId in ("+deleteValue+")";
		String sql2 = "delete from OrderGoodsInfo where orderId in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql2);
		DBConn.ExecIUD(sql1);
	}

	/**
	 * 
	 * 通过orderId获得单个OrderInfo
	 * @param orderId
	 * @return
	 */
	public OrderInfo getOrderInfoByOrderId(int orderId)
	{
		Connection conn = DBConn.getConn();
		String sql = "select * from OrderInfo where orderId =" + orderId;
		OrderInfo oi = new OrderInfo();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				oi.setOrderId(rs.getInt("orderId"));
				oi.setCustomerId(rs.getInt("customerId"));
				oi.setStatus(rs.getInt("status"));
				oi.setOrderTime(rs.getDate("orderTime"));
			}
			return oi;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	public void updateStatusByOrderId(int orderId,int status)
	{
		if(status==0)
		{
			String sql = "update OrderInfo set status = 1 where orderId = "+orderId;
			
			DBConn.ExecIUD(sql);
		}
		if(status==1)
		{
			String sql = "update OrderInfo set status = 0 where orderId = "+orderId;
			
			DBConn.ExecIUD(sql);
		}
	}
}
