package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.model.GoodsType;
import cn.edu.model.PageModel;
import cn.edu.util.DBConn;


public class GoodsTypeDAO {

	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**	
	 * 
	 * 查询商品类型---select
	 * @param key
	 * @param pm
	 * @return
	 */
	public ArrayList<GoodsType> getAllGoodsTypeList(String key,PageModel pm)
	{
		
		int currentPage = pm.getCurrentPage();
		int perPageCount = pm.getPerPageCount();
		
		if(pm.getCurrentPage()==pm.getLastPage() && pm.getSumCount()%pm.getPerPageCount()!=0)
		{
			perPageCount = pm.getSumCount()%pm.getPerPageCount();
		}
		
		String sql = "select * from (select top "+perPageCount+" * from (select top "+currentPage*pm.getPerPageCount()+"* from GoodsType where typeName like '%"+key+"%' order by typeId) as a order by typeId desc) as b order by typeId";
		
		ArrayList<GoodsType> goodsTypeList = DBConn.ExecGoodsType(sql);
		
		return goodsTypeList;
	}
	
	public ArrayList<GoodsType> getAllGoodsType()
	{
		String sql = "select * from GoodsType";
		
		ArrayList<GoodsType> goodsTypeList = DBConn.ExecGoodsType(sql);
		
		return goodsTypeList;
	}
	/**
	 * 
	 * 根据商品类型Id获得公告信息--select(删除单个时使用的方法)
	 * @param btId
	 * @return
	 */
	public GoodsType getGoodsType(int gtId)
	{
		String sql = "select * from GoodsType where typeId = "+gtId;
		GoodsType gt = new GoodsType();
		
		Connection conn = DBConn.getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				gt.setTypeId(rs.getInt("typeId"));
				gt.setTypeName(rs.getString("typeName"));

			}
			return gt;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 
	 * 获取所有的行数--select
	 * 
	 * @return
	 */
	public int getSumCount()
	{
		return DBConn.getSumCount("GoodsType");
	}
	
	/**
	 * 
	 * 删除公告--delete
	 * @param deleteValue
	 */
	public void deleteGoodsType(String deleteValue)
	{
		Connection conn = DBConn.getConn();
		System.out.println(deleteValue.length());
		deleteValue = deleteValue.substring(0,deleteValue.length()-1);
		System.out.println(deleteValue);
		String sql = "delete from GoodsType where typeId in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql);
	}
	public void deleteOne(String deleteValue)
	{
		Connection conn = DBConn.getConn();
		
		String sql = "delete from GoodsType where typeid in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql);
	}
	/**
	 * 
	 * 更新公告--update
	 * @param title
	 * @param content
	 * @param id
	 */
	public void updateGoodsType(String typeName,int typeId)
	{
		Connection conn = DBConn.getConn();
		String sql = "update GoodsType set typeName='"+typeName+"' where typeId = "+typeId;
		
		DBConn.ExecIUD(sql);
		
	}
	/**
	 * 
	 * 添加公告
	 * 
	 */
	public void InsertGoodsType(String typeName)// 参数还要加 int Id
	{
		Connection conn = DBConn.getConn();
		String sql = "insert into GoodsType values ('"+typeName+"')";
		
		DBConn.ExecIUD(sql);
	}
	
}
