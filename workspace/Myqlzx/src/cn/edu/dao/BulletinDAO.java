package cn.edu.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import cn.edu.model.Bulletin;
import cn.edu.model.PageModel;
import cn.edu.util.DBConn;


public class BulletinDAO {
	
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	/**	
	 * 
	 * 查询公告---select
	 * @param key
	 * @param pm
	 * @return
	 */
	public ArrayList<Bulletin> getAllBulletinList(String key,PageModel pm)
	{
		
		int currentPage = pm.getCurrentPage();
		int perPageCount = pm.getPerPageCount();
		
		
		if(pm.getCurrentPage()==pm.getLastPage() && pm.getSumCount()%pm.getPerPageCount()!=0)
		{
			perPageCount = pm.getSumCount()%pm.getPerPageCount();
		}
		
		String sql = "select * from (select top "+perPageCount+" * from (select top "+pm.getPerPageCount()*currentPage+" * from Bulletin where title like '%"+key+"%' order by id desc) as a order by id desc) as b order by id";
		
		ArrayList<Bulletin> bulletinInfoList = DBConn.ExecBulletinIUD(sql);
		
		return bulletinInfoList;
	}
	/**
	 * 
	 * 
	 * 获得最新的五条公告
	 * @return
	 */
	public ArrayList<Bulletin> getTopFiveBulletinList()
	{
		String sql = "select top 5 * from Bulletin order by id desc";
		
		ArrayList<Bulletin> bulletinInfoList = DBConn.ExecBulletinIUD(sql);
		
		return bulletinInfoList;
	}
	/**
	 * 
	 * 根据公告Id获得公告信息--select(删除单个时使用的方法)
	 * @param btId
	 * @return
	 */
	public Bulletin getBulletin(int btId)
	{
		String sql = "select * from bulletin where id = "+btId;
		Bulletin bt = new Bulletin();
		
		Connection conn = DBConn.getConn();
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bt.setId(rs.getInt("id"));
				bt.setTitle(rs.getString("title"));
				bt.setContent(rs.getString("content"));
				bt.setCreateTime(rs.getDate("createTime"));
				bt.setUserId(rs.getInt("userId"));
			}
			return bt;
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
		return DBConn.getSumCount("Bulletin");
	}
	
	/**
	 * 
	 * 删除公告--delete
	 * @param deleteValue
	 */
	public void deleteBulletin(String deleteValue)
	{
		System.out.println(deleteValue.length());
		deleteValue = deleteValue.substring(0,deleteValue.length()-1);
		
		String sql = "delete from Bulletin where id in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql);
	}
	
	/**
	 * 
	 * 删除单个公告
	 * @param deleteValue
	 */
	public void deleteOne(String deleteValue)
	{		
		String sql = "delete from Bulletin where id in ("+deleteValue+")";
		
		DBConn.ExecIUD(sql);
	}
	/**
	 * 
	 * 更新公告--update
	 * @param title
	 * @param content
	 * @param id
	 */
	public void updateBulletin(String title,String content,int id)
	{
		Connection conn = DBConn.getConn();
		String sql = "update Bulletin set title='"+title+"',content='"+content+"' where id = "+id;
		
		DBConn.ExecIUD(sql);
		
	}
	/**
	 * 
	 * 添加公告
	 * 
	 */
	public void InsertBulletin(String title,String content)// 参数还要加 int Id
	{
		Connection conn = DBConn.getConn();
		String sql = "insert into bulletin values ('"+title+"','"+content+"',2,default)";
		
		DBConn.ExecIUD(sql);
	}
}
