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
 * 此类实现的功能：数据库的使用类（连接，更新，查询）
 * 
 * @Copyright:
 * @Company:
 * @author
 * @see 测试数据类型
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
	 * 此方法实现的功能: 获取数据库的连接
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

		System.out.println("获取连接成功---->this.conn:" + this.conn);
		return this.conn;
	}

	/**
	 * 
	 * 此方法实现的功能: 根据SQL进行数据更新（增删改）
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
	 * 此方法实现的功能: 实现数据的查询
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
	 * 此方法实现的功能:实现统一的释放资源
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
	 * 将ResultSet转化为LIST
	 * 
	 * @param rs
	 * @param clazz
	 * @return
	 * @throws Exception
	 */
	public List populate(ResultSet rs, Class clazz) throws Exception {
		ResultSetMetaData metaData = rs.getMetaData(); // 取得结果集的元元素
		int colCount = metaData.getColumnCount(); // 取得所有列的个数
		List ret = new ArrayList(); // 存放返回结果的容器
		Field[] fields = clazz.getDeclaredFields(); // 取得业务对象的属性

		while (rs.next()) {
			Object newInstance = clazz.newInstance(); // 构造业务对象实例
			// 将结果集中每一条记录，每一个字段取出，根据命名规则，对对应的业务对象的属性进行赋值
			for (int i = 1; i <= colCount; i++) { // 对于该记录的每一列
				try {
					Object value = rs.getObject(i);
					for (int j = 0; j < fields.length; j++) {
						Field f = fields[j];
						if (f.getName().equalsIgnoreCase(
								metaData.getColumnName(i))) {
							BeanUtils.copyProperty(newInstance, f.getName(),
									value);
							String str=metaData.getColumnName(i).toString();
							System.out.println("元数据="+str);
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
