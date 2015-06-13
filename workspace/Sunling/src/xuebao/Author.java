package xuebao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Author {
	private String authorname;
	

	public String getAuthorname() {
		return authorname;
	}

	public void setAuthorname(String authorname) {
		this.authorname = authorname;
	}

	public Author() {
	}

	public List author(String fileName,int i) throws ClassNotFoundException,
			SQLException { // 浣跨敤DocumentHelp绫诲垱寤轰竴涓枃妗ｅ疄渚�
		Connection connection = null;
		PreparedStatement pstmt;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager
				.getConnection(
						"jdbc:mysql://127.0.0.1:3306/computernewspaper?useUnicode=true&characterEncoding=utf-8",
						"root", "xingye");
		try {
			pstmt = connection.prepareStatement("select * from ComputerNewspaper where id="+i);
			ResultSet rs = pstmt.executeQuery();
			List list = new ArrayList();
			while(rs.next()){
				Author author = new Author();
				author.setAuthorname(rs.getString("author"));
				list.add(author);
			}
			try {
				pstmt.close();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	public int count() throws ClassNotFoundException, SQLException {
		int intRowCount = 0;// 鎬昏鏁�
		Connection connection = null;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager
				.getConnection(
						"jdbc:mysql://127.0.0.1:3306/computernewspaper?useUnicode=true&characterEncoding=utf-8",
						"root", "xingye");
		PreparedStatement pstmt;
		try {
			pstmt = connection
					.prepareStatement("SELECT count(id) FROM ComputerNewspaper");
			ResultSet rsq = pstmt.executeQuery();
			rsq.next();// 娓告爣鎸囧悜绗竴琛�
			intRowCount = rsq.getInt(1);// 鍙栧緱鎬昏鏁�
			rsq.close();
			pstmt.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return intRowCount;
	}

	public static void main(String[] args) throws ClassNotFoundException,
			SQLException {
		String fileName = "C://info.xml";
		Create xmlTest = new Create();
		int intRowCount = xmlTest.count();
		for (int i = 1; i <=intRowCount; i++)
		{
			//fileName = "C://info"+i+".xml";
			xmlTest.create(fileName,i);
		}
	}
}
