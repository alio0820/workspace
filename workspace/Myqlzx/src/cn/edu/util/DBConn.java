package cn.edu.util;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import cn.edu.model.Bulletin;
import cn.edu.model.CustomerInfo;
import cn.edu.model.GoodsInfo;
import cn.edu.model.GoodsType;


public class DBConn {

	private final static String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private final static String url = "jdbc:sqlserver://localhost:54267;DatabaseName=qlzx;characterEncoding=utf-8";
	private final static String user = "sa";
	private final static String pwd = "network";
	
	
	private static PreparedStatement pstmt = null;
	private static ResultSet rs = null;
	/**
	 * 
	 * 获得数据库连接
	 * @return
	 */
	public static Connection getConn()
	{
		try {
			
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, pwd);
			
			return conn;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public static void closeConn(Connection conn,ResultSet rs,PreparedStatement pstmt)
	{
		try {
			if(conn != null&& conn.isClosed()==false)
			{
				
					conn.close();
				
			}
		} catch (SQLException e) 
		{
			e.printStackTrace();
		}
		if(rs != null)
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		if(pstmt != null)
		{
			try {
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	/**
	 * 
	 * 获取总行数
	 * @param tableName
	 * @return
	 */
	public static int getSumCount(String tableName)
	{
		
		Connection conn = getConn();
		String sql = "select count(*) from "+tableName;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getInt(1);
			}
			else
			{
				return 0;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			closeConn(conn, rs, pstmt);
		}
		return 0;
	}
	
	
	/**
	 * 
	 * 添加删除更新操作
	 * 
	 * @param sql
	 */
	public static void ExecIUD(String sql)
	{
		Connection conn = getConn();
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
	}
	
	/**
	 * 
	 * 公告的查询操作
	 * @param sql
	 * @return
	 */
	public static ArrayList<Bulletin> ExecBulletinIUD(String sql)
	{
		Connection conn = DBConn.getConn();
		ArrayList<Bulletin> bulletinInfoList = new ArrayList<Bulletin>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				Bulletin bt = new Bulletin();
				bt.setId(rs.getInt("id"));
				bt.setTitle(rs.getString("title"));
				bt.setContent(rs.getString("content"));
				bt.setUserId(rs.getInt("userId"));
				bt.setCreateTime(rs.getDate("createTime"));
				
				bulletinInfoList.add(bt);
			}
			return bulletinInfoList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	/**
	 * 
	 * 商品类型的查询操作
	 * @param sql
	 * @return
	 */
	public static ArrayList<GoodsType> ExecGoodsType(String sql)
	{
		
		Connection conn = DBConn.getConn();
		ArrayList<GoodsType> goodsTypeList = new ArrayList<GoodsType>();
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				GoodsType gt = new GoodsType();
				gt.setTypeId(rs.getInt("typeId"));
				gt.setTypeName(rs.getString("typeName"));
				
				goodsTypeList.add(gt);
			}
			return goodsTypeList;
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
	 * 商品的查询操作
	 * @return
	 */
	public static ArrayList<GoodsInfo> ExecGoodsInfo(String sql)
	{
		Connection conn = DBConn.getConn();
		ArrayList<GoodsInfo> goodsInfoList = new ArrayList<GoodsInfo>();
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				GoodsInfo gd = new GoodsInfo();
				
				gd.setGoodsId(rs.getInt("goodsId"));
				gd.setTypeId(rs.getInt("typeId"));
				gd.setGoodsName(rs.getString("goodsName"));
				gd.setPrice(rs.getFloat("price"));
				gd.setDiscount(rs.getFloat("discount"));
				gd.setIsNew(rs.getInt("isNew"));
				gd.setIsRecommend(rs.getInt("isRecommend"));
				gd.setStatus(rs.getInt("status"));
				gd.setPhoto(rs.getString("photo"));
				gd.setRemark(rs.getString("remark"));
				
				goodsInfoList.add(gd);
			}
			return goodsInfoList;
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
	 * 客户信息的查询操作
	 * @param sql
	 * @return
	 */
	public static ArrayList<CustomerInfo> ExecCustomerInfo(String sql)
	{
		Connection conn = getConn();
		ArrayList<CustomerInfo> ctList = new ArrayList<CustomerInfo>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				CustomerInfo ci = new CustomerInfo();
				
				ci.setId(rs.getInt("id"));
				ci.setEmail(rs.getString("email"));
				ci.setPwd(rs.getString("pwd"));
				ci.setRegisterTime(rs.getDate("registerTime"));
				
				ctList.add(ci);
			}
			return ctList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 
	 * 根据商品信息中的typeId来查询对应商品类型信息中的商品类型名称
	 * @param typeId
	 * @return
	 */
	public static String getTypeNameByGoods(int typeId)
	{
		Connection conn = getConn();
		
		String sql = "select * from GoodsType where typeId="+typeId;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getString("typeName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}

	/**
	 * 
	 * 根据公告信息中的用户Id来查询用户信息中对应的用户名
	 * @param userId
	 * @return
	 */
	public static String getUserNameByUserId(int userId)
	{
		Connection conn = getConn();
		
		String sql = "select * from UserInfo where id="+userId;
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getString("userName");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	public static int getCustomerIdByCustomerEmail(String email)
	{
		Connection conn = getConn();
		
		String sql = "select * from CustomerInfo where email='"+email+"'";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getInt("id");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return 0;
	}
	
	public static CustomerInfo getCustomerInfo(String sql)
	{
		Connection conn = getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				CustomerInfo ci = new CustomerInfo();
				ci.setId(rs.getInt("id"));
				ci.setEmail(rs.getString("email"));
				ci.setPwd(rs.getString("pwd"));
				ci.setRegisterTime(rs.getDate("registerTime"));
				
				return ci;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	public static String getCustomerEmailByCustomerId(int id)
	{
		Connection conn = getConn();
		
		String sql ="select email from CustomerInfo where id ="+id;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	/**
	 * 
	 * @param id
	 * @return
	 */
	public static Date getCustomerRegisterTimeByCustomerId(int id)
	{
		Connection conn = getConn();
		
		String sql ="select registerTime from CustomerInfo where id = "+id;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getDate(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	public static int getQuantityByGoodsId(int goodsId,int orderId)
	{
		Connection conn =getConn();
		String sql = "select quantity from OrderGoodsInfo where goodsId ="+ goodsId + " and orderId =" + orderId;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				return rs.getInt("quantity");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return 0;
	}
	
	public static String getResultByOrderStatus(int orderId)
	{
		Connection conn =getConn();
		
		String sql = "select status from OrderInfo where orderId ="+orderId;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()&& rs.getInt(1)==1)
			{
				return "取消确认";
			}
			if(rs.next() && rs.getInt(1)== 0)
			{
				return "确认订单";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			closeConn(conn, rs, pstmt);
		}
		return null;
	}
}
