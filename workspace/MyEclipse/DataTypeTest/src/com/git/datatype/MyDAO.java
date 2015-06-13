package com.git.datatype;

import java.lang.reflect.Field;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.beanutils.BeanUtils;

/**
 * ����ʵ�ֵĹ��ܣ����ݿ��ʹ���ࣨ���ӣ����£���ѯ��
 * 
 * @Copyright:
 * @Company:
 * @author
 * @see ������������
 */
public class MyDAO {

	private String url = "jdbc:sqlserver://localhost:5803;DataBaseName=pubdb_v2007";

	private String username = "sa";

	private String password = "1111";

	private Connection conn;

	private Statement statement;

	private ResultSet rs;

	public MyDAO() {

		this.getcon();
	}

	/**
	 * 
	 * �˷���ʵ�ֵĹ���: ��ȡ���ݿ������
	 * 
	 * @return
	 */
	private Connection getcon() {
		try {

			Class.forName("com.microsoft.jdbc.sqlserver.SQLServerDriver");
			this.conn = DriverManager.getConnection(this.url, this.username,
					this.password);
		} catch (ClassNotFoundException e) {
			System.out.println("database connection ClassNotFoundException:"
					+ e.getMessage());
		} catch (SQLException e) {
			System.out.println("database connection SQLException:"
					+ e.getMessage());
		}

		System.out.println("��ȡ���ӳɹ�---->this.conn:" + this.conn);
		return this.conn;
	}

	/**
	 * 
	 * �˷���ʵ�ֵĹ���: ����SQL�������ݸ��£���ɾ�ģ�
	 * 
	 * @param SQL
	 * @return
	 */
	public int update(String SQL) {
		try {
			this.statement = this.conn.createStatement();
			return this.statement.executeUpdate(SQL);
		} catch (SQLException e) {
			System.out
					.println("database update SQLException:" + e.getMessage());
		}
		return -1;
	}

	public boolean delete(String SQL) {

		try {
			this.statement = this.conn.createStatement();
			return this.statement.execute(SQL);
		} catch (SQLException e) {
			System.out
					.println("database update SQLException:" + e.getMessage());
		}
		return false;
	}

	/**
	 * 
	 * �˷���ʵ�ֵĹ���: ʵ�����ݵĲ�ѯ
	 * 
	 * @param SQL
	 * @return
	 */
	public ResultSet query(String SQL) {
		try {
			this.statement = this.conn.createStatement();
			this.rs = this.statement.executeQuery(SQL);
		} catch (SQLException e) {
			System.out.println("database query SQLException:" + e.getMessage());
		}
		System.out.println(rs);
		return rs;
	}

	/**
	 * 
	 * �˷���ʵ�ֵĹ���:ʵ��ͳһ���ͷ���Դ
	 */
	public void release() {
		try {
			if (this.rs != null) {
				this.rs.close();
			}

			if (this.statement != null) {
				this.statement.close();
			}

			if (this.conn != null) {
				this.conn.close();
			}

		} catch (SQLException e) {
			System.out.println("database release SQLException:"
					+ e.getMessage());
		}
	}

	/**
	 * ��ResultSetת��ΪLIST
	 * 
	 * @param rs
	 * @param clazz
	 * @return
	 * @throws Exception
	 */
	public List populate(ResultSet rs, Class clazz) throws Exception {
		ResultSetMetaData metaData = rs.getMetaData(); // ȡ�ý������ԪԪ��
		int colCount = metaData.getColumnCount(); // ȡ�������еĸ���
		List ret = new ArrayList(); // ��ŷ��ؽ��������
		Field[] fields = clazz.getDeclaredFields(); // ȡ��ҵ����������

		while (rs.next()) {
			Object newInstance = clazz.newInstance(); // ����ҵ�����ʵ��
			// ���������ÿһ����¼��ÿһ���ֶ�ȡ���������������򣬶Զ�Ӧ��ҵ���������Խ��и�ֵ
			for (int i = 1; i <= colCount; i++) { // ���ڸü�¼��ÿһ��
				try {
					Object value = rs.getObject(i);
					for (int j = 0; j < fields.length; j++) {
						Field f = fields[j];
						if (f.getName().equalsIgnoreCase(
								metaData.getColumnName(i))) {
							BeanUtils.copyProperty(newInstance, f.getName(),
									value);
							String str=metaData.getColumnName(i).toString();
							System.out.println("Ԫ����="+str);
						}
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				}
			}
			ret.add(newInstance);
		}
		return ret;
	}

	public static void main(String[] args) {
		MyDAO dUtil = new MyDAO();
		String SQL = "select * from DDdmDataType";

		// String SQL02 = "insert into menu(menuid,name,parentmenuid)
		// values('002','002','0')";
		// dUtil.update(SQL02);
		ResultSet rs = dUtil.query(SQL);

		try {
			while (rs.next()) {
				// System.out.println("studentid="+rs.getString("MovName"));
				// System.out.println("password="+rs.getString("picAddr"));
				System.out.println("studentid=" + rs.getString("DataTypeID"));
				// System.out.println("password="+rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			dUtil.release();
		}
	}

}
