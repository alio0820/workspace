package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.jsp.PageContext;

import cn.edu.model.Bulletin;
import cn.edu.model.GoodsInfo;
import cn.edu.model.PageModel;
import cn.edu.util.DBConn;
import cn.edu.util.PageUtil;
import cn.edu.util.PublicUtil;


public class GoodsInfoDAO {

	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**	
	 * 
	 * 查询商品---select
	 * @param key
	 * @param pm
	 * @return
	 */
	public ArrayList<GoodsInfo> getAllGoodsInfoList(String key,PageModel pm)
	{
		
		int currentPage = pm.getCurrentPage();
		int perPageCount = pm.getPerPageCount();

		if(pm.getCurrentPage()==pm.getLastPage() && pm.getSumCount()%pm.getPerPageCount()!=0)
		{
			perPageCount = pm.getSumCount()%pm.getPerPageCount();
		}
		System.out.println(perPageCount);
		String sql = "select * from (select top "+perPageCount+" * from (select top "+pm.getPerPageCount()*currentPage+" * from GoodsInfo where goodsName like '%"+key+"%' order by goodsid) as a order by goodsid desc) as b order by goodsid";
		
		ArrayList<GoodsInfo> goodsInfoList = DBConn.ExecGoodsInfo(sql);
		
		return goodsInfoList; 
	}
	
	/**
	 * 
	 * 根据商品Id获得商品信息--select(删除单个时使用的方法)
	 * @param btId
	 * @return
	 */
	public GoodsInfo getGoodsInfo(int gdId)
	{
		String sql = "select * from GoodsInfo where goodsid = "+gdId;
		GoodsInfo gd = new GoodsInfo();
		
		Connection conn = DBConn.getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
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
			}
			return gd;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally
		{
			DBConn.closeConn(conn, rs, pstmt);
		}
		return null;
	}
	
	public void InsertGoodsInfo(int typeId,String goodsName,String price,String discount,int isNew,int isRecommend,int status,String photo,String remark)
	{
		String sql = "insert into goodsinfo values ("+typeId+",'"+goodsName+"',"+price+","+discount+","+isNew+","+isRecommend+","+status+",'"+photo+"','"+remark+"')";
		
		DBConn.ExecIUD(sql);
	}
	
	public void deleteOne(String deleteValue)
	{
		Connection conn = DBConn.getConn();
		
		String sql = "delete from GoodsInfo where goodsid in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql);
	}
	/**
	 * 
	 * 获取所有的行数--select
	 * 
	 * @return
	 */
	public int getSumCount()
	{
		return DBConn.getSumCount("GoodsInfo");
	}
	
	/**
	 * 
	 * 按类型查询总行数
	 * @param typeId
	 * @return
	 */
	public int getTypeSumCount(int typeId)
	{
		Connection conn = DBConn.getConn();
		String sql = "select count(*) from GoodsInfo where typeId = "+typeId;
		
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
			DBConn.closeConn(conn, rs, pstmt);
		}
		return 0;

	}
	public void updateGoodsInfo(String goodsName,String typeId,String price,String discount,String[] chk,String photo,String remark,String goodsId)
	{
		
		String sql = "update GoodsInfo set goodsName = "+goodsName+",typeId = "+typeId+",price = "+price+",discount = "+discount+",isNew = "+chk[2]+",isRecommend = "+chk[1]+",status = "+chk[0]+",photo = "+photo+" ,remark = "+remark+" where goodsid ="+goodsId;
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 根据类型编号来查询对应的最新五件商品
	 * @param typeId
	 * @return
	 */
	public ArrayList<GoodsInfo> getFiveGoodsInfo(int typeId)
	{
		String sql = "select top 5 * from GoodsInfo where typeId = "+typeId+" order by goodsId desc";
		
		ArrayList<GoodsInfo> gdList = DBConn.ExecGoodsInfo(sql);
		
		return gdList;
	}

	public ArrayList<GoodsInfo> getTopNineGoodsInfo(int num)
	{
		
		if(num==0)
		{
			String sql = "select top 9 * from GoodsInfo where isRecommend = 0 order by goodsId desc";
			ArrayList<GoodsInfo> gdList = DBConn.ExecGoodsInfo(sql);
			return gdList;
		}
		else if(num==1)
		{
			String sql = "select top 9 * from GoodsInfo where isNew = 0 order by goodsId desc";
			ArrayList<GoodsInfo> gdList = DBConn.ExecGoodsInfo(sql);
			return gdList;
		}
		else if(num==2)
		{
			String sql = "select top 9 * from GoodsInfo where status = 0 order by goodsId desc";
			ArrayList<GoodsInfo> gdList = DBConn.ExecGoodsInfo(sql);
			return gdList;
		}
		return null;
	}
	
}
