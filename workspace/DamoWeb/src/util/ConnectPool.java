/*
 * Created on 2003-9-27
 *
 * To change the template for this generated file go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
package util;


import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.naming.Context;
import javax.naming.InitialContext;

/**
 *
 * To change the template for this generated type comment go to
 * Window&gt;Preferences&gt;Java&gt;Code Generation&gt;Code and Comments
 */
public class ConnectPool {
	private javax.sql.DataSource pool;
	Connection conn=null;
	Statement stmt=null;
	ResultSet rs=null;
	
	/**�������ӳ�
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
	
	/*
	 * @param str  
	 * @return rs
	 * ժ    Ҫ������һ��SQL��䣬�õ�һ�������
	 * ע�⣺�ڵ��ñ���������ʹ�����е�executeClose()�����ر����ӣ�
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
			System.out.println(str+"ִ�г���");
		}
		return rs;
   }
   
   /* 
		* �������ƣ�getInt(String str)	��ȡ��������
		* @param str  
		* @return rs
		* ժ    Ҫ������һ����ȡ�������ݵ�SQL��䣬�����ص�һ����¼�ĵ�һ������
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
			System.out.println("Exception error:��ȡ���ӳ����ӳ���");
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
			System.out.println(str+"ִ�г���");
		}
		return returnInt;
	}
	
	/*
		 * �������ƣ�getInt(String str)	��ȡʵ������
		 * @param str  
		 * @return rs
		 * ժ    Ҫ������һ����ȡʵ����SQL��䣬�����ص�һ����¼�ĵ�һ������
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
			System.out.println(str+"ִ�г���");
		}
		return returnFloat;
	}
	
	/*
	 * @param str  
	 * @return rs
	 * ժ    Ҫ������һ����ȡ�ַ������ݵ�SQL��䣬�����ص�һ����¼�ĵ�һ������
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
			System.out.println(str+"ִ�г���");
		}
		return returnInt;
	}
	
   /* 
	* @param updateStr
	* @return �ɹ����򷵻�1�����򷵻�-1
	* ժ    Ҫ������һ��SQL��䣬�����ݿ�ִ��update��insert��delete�ȵȲ���
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
			System.out.println(updateStr+"ִ�г���");
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
				
				System.out.println("�ر����ݿ�����ʧ�ܣ�");
			}
			return -1;	   
	   	}		
   }
   
   /* 
		* @param str  
		* @return rs
		* ժ    Ҫ������һ����ȡ�������ݵ�SQL��䣬�����ص�һ����¼�ĵ�һ������
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
			System.out.println("Exception error:��ȡ���ӳ����ӳ���");
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
			System.out.println(str+"ִ�г���");
		}
		return returnInt;
	}
	
   /* 
	* @param  ��
	* @return  ��
	* ժ    Ҫ��ÿ�ε��������Ϸ�����������ø÷�����
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
	    	System.err.println(ey.getMessage()+"�ر����ݿ����ӳ���");
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