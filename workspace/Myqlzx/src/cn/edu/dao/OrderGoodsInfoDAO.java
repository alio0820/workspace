package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.util.DBConn;

public class OrderGoodsInfoDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	
	/**
	 * 
	 * 添加
	 * @param orderId
	 * @param goodsId
	 * @param num
	 */
	public void addOrderGoodsInfo(int orderId,int goodsId,int num)
	{
		System.out.println("!!建立关系！！");
		System.out.println("orderId--------->"+orderId);
		System.out.println("goodsId--------->"+goodsId);
		System.out.println("num------------->"+num);
		String sql = "insert into OrderGoodsInfo values('"+orderId+"','"+goodsId+"','"+num+"')";
		
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 根据订单编号查询购买的商品
	 * @param orderId
	 * @return
	 */
	public ArrayList<Integer> getGoodsIdByOrderId(int orderId)
	{
		Connection conn = DBConn.getConn();
		String sql = "select goodsId from OrderGoodsInfo where orderId = "+orderId;
		ArrayList<Integer> goodsIdList = new ArrayList<Integer>();
		try {
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next())
			{
				goodsIdList.add(rs.getInt("goodsId"));
			}
			return goodsIdList;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return null;
	}
}
