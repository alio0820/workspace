package xuebao;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;

public class Create {

	public Create() {
	}

	public void create(String fileName,int i) throws ClassNotFoundException,
			SQLException { // 浣跨敤DocumentHelp绫诲垱寤轰竴涓枃妗ｅ疄渚�
		Connection connection = null;
		PreparedStatement pstmt;
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager
				.getConnection(
						"jdbc:mysql://127.0.0.1:3306/computernewspaper?useUnicode=true&characterEncoding=utf-8",
						"root", "xingye");
		pstmt = connection.prepareStatement("select * from ComputerNewspaper where id=1");
		ResultSet rs = pstmt.executeQuery();
		Document doc = DocumentHelper.createDocument();
		Element rootElement = doc.addElement("root");
		Element firstElement = rootElement.addElement("info");
		while (rs.next()) {

			Element element1 = firstElement.addElement("subject");
			element1.setText(rs.getString("subject"));
			Element element2 = firstElement.addElement("author");
			element2.setText(rs.getString("author"));
			Element element3 = firstElement.addElement("author_unit");
			element3.setText(rs.getString("author_unit"));
			Element element4 = firstElement.addElement("publish_vintage");
			element4.setText(rs.getString("publish_vintage"));
			Element element5 = firstElement.addElement("publish_month");
			element5.setText(rs.getString("publish_month"));
			Element element6 = firstElement.addElement("abstract");
			element6.setText(rs.getString("abstract"));
			// 灏嗗垱寤虹殑XML鏂囨。瀛樼洏
		}
		try {
			XMLWriter output = null;
			OutputFormat format = OutputFormat.createPrettyPrint();
			// 浣跨敤TAB缂╄繘
			format.setIndent("\t");
			// 鍒涘缓涓�釜XMLWriter瀵硅薄
			output = new XMLWriter(new FileOutputStream(new File(fileName)),
					format);
			output.write(doc);
			output.close();
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
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
		String fileName = "I://info.xml";
		Create xmlTest = new Create();
		int intRowCount = xmlTest.count();
		for (int i = 1; i <= intRowCount; i++)
		{
			fileName = "C://info"+i+".xml";
			xmlTest.create(fileName,i);
		}
	}
}
