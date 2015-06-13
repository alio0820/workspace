package Xproer;
import java.sql.*;
import java.util.*;

import javax.servlet.ServletContext;

import org.apache.commons.lang.StringUtils;

/*
 *���ݿ���ʲ���
 *���¼�¼��
 *	2012-05-22 ���� 
 *	2012-05-24 ����
 */
public class HttpUploaderDB {
	//��ǰӦ�ó���·����D:\\WebApps\\HttpUploader3\\
	String m_curPath;

	//���ݿ������ַ���
	//String conString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=DbPath;User Id=admin;Password=;";
	String m_conString = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=DbPath";

	public String GetConStr()
	{
		String str = "jdbc:odbc:driver={Microsoft Access Driver (*.mdb)};DBQ=";
		str += this.m_curPath;
		str += "db.mdb";
		this.m_conString = str;
		return str;
	}
	/*
	 * ������
	 * 		sc = this.getServletContext()
	 * */
	public HttpUploaderDB(ServletContext sc)
	{
		this.m_curPath = sc.getRealPath("/");
	}
	
	public Connection GetCon()
	{		
		Connection con = null;
		
		try 
		{
			con = DriverManager.getConnection(this.GetConStr());
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return con;
	}
	
	/*
	 * ��JSON��ʽ��ȡ�ļ��б�
	 * ��ʽ��
	 * 	[{item1},{item2},{item3},{item4}]
	 * */
	public String GetFilesJsonByUid(String uid)
	{
		ArrayList<String> jsons = new ArrayList<String>();
		Vector<xdb_files> files = this.GetFilesByUid(uid);
		
		Iterator<xdb_files> i = files.iterator();
		while(i.hasNext())
		{
		    xdb_files item = i.next();
		    jsons.add(item.ToJsonItem());		    
		}
		Object[] arrJson = jsons.toArray();

		StringBuilder sb = new StringBuilder();
		sb.append("[");
		sb.append( StringUtils.join(arrJson,",") );
		sb.append("]");
		return sb.toString();
	}
	
	public Vector<xdb_files> GetFilesByUid(String uid)
	{
		return this.GetFilesByUid(Integer.parseInt(uid));
	}
	
	/*
	 * ����UID��ȡ�ļ��б�
	 * ������
	 * 	uid �û�ID
	 * */
	public Vector<xdb_files> GetFilesByUid(int uid)
	{
		Vector<xdb_files> tb = new Vector<xdb_files>();
		String sql = "select * from xdb_files where uid=? and IsDeleted=0;";
		Connection con = this.GetCon();	    
	    PreparedStatement stmt;
	    
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, uid);
		    ResultSet rst = stmt.executeQuery();
		    
		    while(rst.next())
		    {
		    	xdb_files file = new xdb_files(rst);
		    	tb.add(file);
		    }
		    rst.close();
		    stmt.close();
		    con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	    return tb;
	}

	/*
	 * �����ļ�ID��ȡ�ļ���Ϣ
	 * ����ֵ��
	 * 	null
	 * */
	public xdb_files GetFileInfByFid(int fid)
	{
		xdb_files file = null;
		Connection con = this.GetCon();
		String sql = "select top 1 * from xdb_files where fid=?";
		PreparedStatement stmt;
		
		try {
			stmt = con.prepareStatement(sql);
			stmt.setInt(1, fid);
			ResultSet rst = stmt.executeQuery();
			file = new xdb_files();
			
			if (rst.next())
			{
				file.Read(rst);
				
			}
			rst.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return file;
	}
	
	/*
	 * �����ļ�MD5��ȡ�ļ���Ϣ
	 * ������
	 * 	md5 �ļ�MD5
	 * ����ֵ��
	 * 	null
	 * */
	public xdb_files GetFileInfByMd5(String md5)
	{
		xdb_files inf = null;		
		Connection con = this.GetCon();		
		String sql = "select top 1 * from xdb_files where FileMD5=?";
		
		try {
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, md5);
			ResultSet r = stmt.executeQuery();
						
			if(r.next())
			{
				inf = new xdb_files();
				inf.Read(r);			
			}
			r.close();
			stmt.close();
			con.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inf;
	}

	// ����һ�����ݣ��������������ݵ�ID
	// ��ajax_create_fid.aspx�е���
	// �ļ����ƣ�����·����Զ��·�������·����ʹ��ԭʼ�ַ�����
	// d:\soft\QQ2012.exe	
	public int Add(xdb_files model)
	{
		int fid = 0;
		StringBuilder strSql = new StringBuilder();
		strSql.append("insert into xdb_files(");
		strSql.append("FileSize,FilePos,PostedLength,PostedPercent,PostComplete,IsDeleted,uid,FileNameLocal,FileNameRemote,FilePathLocal,FilePathRemote,FilePathRelative,FileMD5,FileLength");
		strSql.append(") values (");
		strSql.append("?,?,?,?,?,?,?,?,?,?,?,?,?,?");
		strSql.append(") ");
		Connection con = this.GetCon();
		PreparedStatement stmt;
		
		try
		{
			stmt = con.prepareStatement(strSql.toString());
			stmt.setString(1, model.getFileSize());
			stmt.setString(2, model.getFilePosStr());
			stmt.setString(3, model.getFileLengthStr());
			stmt.setString(4, model.getPostedPercent());			
			stmt.setBoolean(5, model.getPostComplete());
			stmt.setBoolean(6, model.getIsDeleted());
			stmt.setInt(7, model.getUid());
			stmt.setString(8, model.getFileNameLocal());
			stmt.setString(9, model.getFileNameRemote());
			stmt.setString(10, model.getFilePathLocal());
			stmt.setString(11, model.getFilePathRemote());
			stmt.setString(12, model.getFilePathRelative());
			stmt.setString(13, model.getFileMD5());
			stmt.setString(14, model.getFileLengthStr());
			
			stmt.execute();
			stmt.close();
			
			String sql = "select top 1 fid from xdb_files order by fid desc";
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			if(rs.next())
			{
				fid = rs.getInt(1);
			}
			rs.close();
			stmt.close();
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return fid;
	}

	// �����ϴ�����
	//<param name="uid">�û�ID</param>
	//<param name="fid">�ļ�ID</param>
	//<param name="filePos">�ļ�λ�ã���С���ܳ���2G��������Ҫʹ��long����</param>
	//<param name="postedLength">���ϴ����ȣ��ļ���С���ܳ���2G��������Ҫʹ��long����</param>
	//<param name="postedPercent">���ϴ��ٷֱ�</param>
	public boolean UpdateProgress(int uid,int fid,long filePos,long postedLength,String postedPercent)
	{
		String sql = "update xdb_files set FilePos=?,PostedLength=?,PostedPercent=? where uid=? and fid=?";
		
		try
		{
			Connection con = this.GetCon();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, Long.toString(filePos));
			stmt.setString(2, Long.toString(postedLength));
			stmt.setString(3, postedPercent);
			stmt.setInt(4, uid);
			stmt.setInt(5, fid);
			stmt.execute();
			stmt.close();
			con.close();
			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
		return true;
	}

	// �ϴ���ɡ���������ͬMD5�ļ����ȶ���Ϊ100%
	public void UploadComplete(String md5)
	{
		String sql = "update xdb_files set PostedLength=FileLength,PostedPercent='100%',PostComplete=1 where FileMD5=?";
		
		try
		{
			Connection con = this.GetCon();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setString(1, md5);
			stmt.execute();
			stmt.close();
			con.close();
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}

	/*
	ɾ��һ�����ݣ���������ɾ����ֻ����ɾ����ʶ��
	������
		uid �û�ID
		fid �ļ�ID
	 * 
	 */
	public void Delete(int uid,int fid)
	{
		String sql = "update xdb_files set IsDeleted=1 where uid=? and fid=?";
		try
		{
			Connection con = this.GetCon();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, uid);
			stmt.setInt(2, fid);
			stmt.execute();
			stmt.close();
			con.close();			
		}
		catch(SQLException e)
		{
			e.printStackTrace();
		}
	}
	
	public void Delete(String uid,String fid)
	{
		this.Delete(Integer.parseInt(uid), Integer.parseInt(fid));
	}
}
