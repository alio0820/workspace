/*
 * Created on 2003-9-27
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package com.cait.db;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 * @author 饶志华、stone(罗中伟)
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ConnectPool {
	private javax.sql.DataSource pool;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	/**建立联接池
	 * 
	 * 建立人：罗中伟
	 * 建立时间
	 * 修改人：饶志华
	 * 修改时间：20031022
	 *	限制：本方法只使用于Resin,其来源于Resin配置中的Pool参数
	 */
	public ConnectPool()
	{
		try
		{ 
			javax.naming.Context env = (Context)new InitialContext().lookup("java:comp/env"); 
			System.out.println(env.lookup("jdbc/3FACTORY"));
			pool=(javax.sql.DataSource) env.lookup("jdbc/3FACTORY"); 
		}
		catch(Exception e)
		{
			System.err.println("Exception error:"+e.getMessage());
		} 
	}
	
	/* Copyright (c) 2003,长安信息
	 * 方法名称：getRs(String str)
	 * 当前版本：1.0
	 * 完成日期：2003年10月8日
	 * 作    者：stone
	 * @param str  
	 * @return rs
	 * 摘    要：传入一个SQL语句，得到一个结果集
	 * 注意：在调用本方法后，需使用类中的executeClose()方法关闭联接！
	 */
    public ResultSet getRS(String str) 
    {
		try 
    	{ 
    		conn = pool.getConnection(); 
    	}
    	catch(Exception e)
    	{
			executeClose();
    		System.out.println("Exception error:"+e.getMessage());
    	} 
    	try
    	{
        	stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
    		rs=stmt.executeQuery(str);
    	}
    	catch(SQLException e)
    	{ 
			executeClose();
			System.out.println(str+"执行出错！");
		}
		return rs;
   }
   
   /* Copyright (c) 2003,长安信息
		* 方法名称：getInt(String str)	获取整型数据
		* 当前版本：1.0
		* 完成日期：2003年10月8日
		* 作    者：饶志华
		* @param str  
		* @return rs
		* 摘    要：传入一个获取整形数据的SQL语句，并返回第一条记录的第一个数据
		*/
	public int getInt(String str) 
	{
		int returnInt=0;
		try 
		{ 
			conn = pool.getConnection(); 
		}
		catch(Exception e)
		{
			executeClose();
			System.out.println("Exception error:获取联接池联接出错！");
		} 
		try
		{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(str);
			if(rs.next())
			{
				returnInt=rs.getInt(1);
			}
			executeClose();
		}
		catch(SQLException e)
		{ 
			executeClose();
			System.out.println(str+"执行出错！");
		}
		return returnInt;
	}
	
	/* Copyright (c) 2003,长安信息
		 * 方法名称：getInt(String str)	获取实型数据
		 * 当前版本：1.0
		 * 完成日期：2003年10月8日
		 * 作    者：饶志华
		 * @param str  
		 * @return rs
		 * 摘    要：传入一个获取实数的SQL语句，并返回第一条记录的第一个数据
		 */
	 public float getFloat(String str) 
	{
		float returnFloat=0;
		try 
		{ 
			conn = pool.getConnection(); 
		}
		catch(Exception e)
		{
			executeClose();
			System.out.println("Exception error:"+e.getMessage());
		} 
		try
		{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(str);
			if(rs.next())
			{
				returnFloat=rs.getFloat(1);
			}
			executeClose();
		}
		catch(SQLException e)
		{ 
			executeClose();
			System.out.println(str+"执行出错！");
		}
		return returnFloat;
	}
	
	/* Copyright (c) 2003,长安信息
	 * 方法名称：getInt(String str)	获取字符串数据
	 * 当前版本：1.0
	 * 完成日期：2003年10月8日
	 * 作    者：饶志华
	 * @param str  
	 * @return rs
	 * 摘    要：传入一个获取字符串数据的SQL语句，并返回第一条记录的第一个数据
	 */
	public String getString(String str) 
	{
		String returnInt="";
		try 
		{ 
			conn = pool.getConnection(); 
		}
		catch(Exception e)
		{
			executeClose();
			System.out.println("Exception error:"+e.getMessage());
		} 
		try
		{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(str);
			if(rs.next())
			{
				returnInt=rs.getString(1);
			}
			executeClose();
		}
		catch(SQLException e)
		{ 
			executeClose();
			System.out.println(str+"执行出错！");
		}
		return returnInt;
	}
	
   /* Copyright (c) 2003,长安信息
	* 方法名称：excuteUpdate(String updateStr)
	* 当前版本：1.0
	* 完成日期：2003年10月8日
	* 作    者：stone
	* 修改人：饶志华
	* 修改时间：20031022
	* @param updateStr
	* @return 成功，则返回1，否则返回-1
	* 摘    要：传入一个SQL语句，对数据库执行update、insert、delete等等操作
	*/
   public int executeUpdate(String updateStr)
   {
		Connection thisConnection=null;
		Statement thisStatement=null;
		try
	   	{
			thisConnection=pool.getConnection();
			thisStatement=thisConnection.createStatement();
			thisStatement.executeUpdate(updateStr);
			thisStatement.close();
			thisConnection.close();
			return 1; 
	   	}
		catch(SQLException e)
	   	{	
			System.out.println(updateStr+"执行出错！");
			try 
			{
				if(thisStatement!=null)
				{
					thisStatement.close();
				}
				if(thisConnection!=null)
				{
					thisConnection.close();
				}
			} 
			catch (SQLException e1) 
			{
				
				System.out.println("关闭数据库联接失败！");
			}
			return -1;	   
	   	}		
   }
   
   /* Copyright (c) 2003,长安信息
		* 方法名称：getInt(String str)	获取整型数据
		* 当前版本：1.0
		* 完成日期：2003年10月8日
		* 作    者：饶志华
		* @param str  
		* @return rs
		* 摘    要：传入一个获取整形数据的SQL语句，并返回第一条记录的第一个数据
		*/
	public int executeQuery(String str) 
	{
		int returnInt=0;
		try 
		{ 
			conn = pool.getConnection(); 
		}
		catch(Exception e)
		{
			executeClose();
			System.out.println("Exception error:获取联接池联接出错！");
		} 
		try
		{
			stmt=conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
			rs=stmt.executeQuery(str);
			executeClose();
			returnInt=1;
		}
		catch(SQLException e)
		{ 
			executeClose();
			System.out.println(str+"执行出错！");
		}
		return returnInt;
	}
	
   /* Copyright (c) 2003,长安信息
	* 方法名称：executeClose()
	* 当前版本：1.0
	* 完成日期：2003年10月8日
	* 作    者：stone
	* @param  无
	* @return  无
	* 摘    要：每次调用完以上方法，必须调用该方法！
	*/
   public void executeClose()
   {
   		try
   		{
	    	if(rs!=null) 
	    	{
	    		rs.close();
	    	} 
			if(stmt!=null) 
			{
				stmt.close();
			} 
			if(conn!=null) 
			{
				conn.close();
			} 
		}
   		catch(Exception ey)
   		{
	    	System.err.println(ey.getMessage()+"关闭数据库联接出错！");
		}
	}


	/**
	 * @return
	 */
	public javax.sql.DataSource getPool() {
		return pool;
	}

	/**
	 * @param source
	 */
	public void setPool(javax.sql.DataSource source) {
		pool = source;
	}

}