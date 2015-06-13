package com.tool;
/*
 * 给出数据库JAR包，数据库链接路径，数据库表空间名，数据库名，数据库密码，表名
 *可以提取出来创建表属性的javaBean文件，并且提供标准的get,set方法。
 * 此程序将所有字段和数据提取出来定义为String类型，如有别的需要可以提取表中字段的类型和别的表信息，自动生成
 * java文件
 * \t 表示 空格
 * \r 表示换行 等价于 \n
 * ResultSetMetaData 关键
 * */
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

public class SqlToBean {
  private Connection conn = null;    //保存链接路径
  private Statement stmt = null;     //建立连接
  private ResultSetMetaData meta = null;  //保存表属性信息
  private ResultSet rs = null;  //查询结果集
  private OutputStreamWriter osw = null;
  private BufferedWriter bw = null;
  private FileOutputStream fos = null;
  private static StringBuffer coding = new StringBuffer();  //字符串缓冲区
  private String driver = null;    //数据库包名
  private String url = null;          //路径名
  private String table = null;        //表空间名
  private String password = null;     //密码
  private String[] tableNames = null;	  //表名集合
  private HashMap<String,ArrayList<String>> keyMap = new HashMap<String,ArrayList<String>>();
 
  public SqlToBean(String driver, String url, String table, String password) {
    this.driver = driver;
    this.url = url;
    this.table = table;
    this.password = password;
  }
 
  private String getCoding(StringBuffer code) {
    return code.toString();
  }
  private StringBuffer createPriKey(ArrayList<String> keys){
	  System.out.println(keys);
	  String prikey ="";
	  for(int i=0;i<keys.size();i++){
		  prikey +=","+keys.get(i);
	  }
	  prikey=prikey.replaceAll("^,", "");
	  coding.append("\r \t private static String[] prikey={\""+ prikey +"\"};");
	  coding.append("\r \t public static String[] getPrikey(){\r \t\t return prikey;\r \t }");
	  return coding;
  }
  private StringBuffer createGenerate(String property,String type,String label) {
    String prop = property;
    coding.append("\r \t private "+getColType(type)+" " + prop + ";");
    return coding;
  }
 
  private StringBuffer createMethod(String[][] str){
    for(int i=0;i<str.length;i++){
      //str[i].charAt(0) - 32)转成大写   思路
      String colName = str[i][0];
      String type = getColType(str[i][1]);
      coding.append("\r \t public void set" + (colName.charAt(0)+"").toUpperCase()+ colName.substring(1)+"("+type+" " + colName +"){");
      coding.append("\r \t\t this."+colName + "=" + colName + ";");
      coding.append("\r \t }");
      coding.append("\r \t public "+type+" get" + (colName.charAt(0)+"").toUpperCase()+ colName.substring(1)+"(){");
      coding.append("\r \t\t return this."+colName +  ";");
      coding.append("\r \t }\n");
    }
    return coding;
  }
  
  public static String getColType(String type){
	  type = type.toLowerCase();
	  switch(type){
	  	case "varchar":type = "String";break;
	  }
	  return type;
  }
  /*
   * 关闭与数据库的所有链接
   * */
  private void destroy() {
    try {
      if(conn != null){
        conn.close();
        conn = null;
      }
      if(stmt != null){
        stmt.close();
        stmt = null;
      }
      if(rs != null){
        rs.close();
        rs = null;
      }
 
      if(bw != null){
        bw.close();
        bw = null;
      }
      if(fos != null) {
        fos.close();
        fos = null;
      }
      if(osw != null) {
        osw.close();
        osw = null;
      }
 
    } catch (SQLException e) {
      e.printStackTrace();
    }  catch (IOException e) {
      e.printStackTrace();
    }
  }
  /*
   * 数据库连接发生异常就关闭链接
   * */
  private  void connect () {
    try {
      Class.forName(driver);
      conn = DriverManager.getConnection(url,table,password);
      stmt = conn.createStatement();
    } catch (Exception e) {
      e.printStackTrace();
    } 
  }
  private void getTableName(){
	  if(stmt==null) System.out.println("Statement 为空");
	  try {
		rs = stmt.executeQuery("select table_name from tables where table_schema = 'cooteklife'");
		String tableNames = "";
		while(rs.next()){
			tableNames +=";"+rs.getString(1);
		}
		this.tableNames = tableNames.replaceAll("^;", "").split(";");
		
	  }catch (SQLException e) {
		e.printStackTrace();
	  }
  }
  private void getTableKey(){
	  try {
		for(int i=0,length=tableNames.length;i<length;i++){
			ArrayList<String> prikeys = new ArrayList<String>();
			rs = stmt.executeQuery("select column_name from information_schema.columns where table_name='"+tableNames[i]+"' and table_schema = 'cooteklife' and column_key='PRI';");
			while(rs.next()){
				prikeys.add(rs.getString(1));
			}
			keyMap.put(tableNames[i],prikeys);
//			System.out.println(keyMap);
		}
	  }catch (SQLException e) {
		e.printStackTrace();
	  }
  }
  /**
   * 得到表的所有列名以字符串数组的形式返回
   */
  private String[][] getColumenName() {
    
    int count;
    String[][] str = null;
    try {
      count = meta.getColumnCount();
      String[][] strColumenName = new String[count][3];
      for(int i = 1;i <= count; i++) {
        strColumenName[i-1][0] = meta.getColumnName(i);
        strColumenName[i-1][1] = meta.getColumnTypeName(i);
        strColumenName[i-1][2] = meta.getColumnLabel(i);
      }
      str = strColumenName;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return str;
  }
  /**
   * 写入指定的文件中
   * @param message
   */
  private void writeData(String message,String className) {
    String file = System.getProperty("user.dir")+"/src/com/bean/"+className+".java";
    try {
      fos = new FileOutputStream(file);
      osw = new OutputStreamWriter(fos);
      bw = new BufferedWriter(osw);
      bw.write(message);
      bw.flush();
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
  }
 
  public String createClassName(String className){
	try {
		rs = stmt.executeQuery("select  * from " + className ); //查询下确定结果集是那个表的
		meta = rs.getMetaData();	//调用结果集的记录表信息的方法
	} catch (SQLException e) {
		e.printStackTrace();
	}
	className = (""+className.charAt(0)).toUpperCase()+className.substring(1) + "Bean";
	coding.append("package com.bean;\n\n");
    coding.append("public class " + className + " {");
    return className;
  }
 
  public static void main(String[] args) {
    //SqlToBean sqlToBean = new SqlToBean("oracle.jdbc.driver.OracleDriver","jdbc:oracle:thin:@192.168.3.11:1521:orcl","mamibon","mamibon","my_standard_data2");
    SqlToBean sqlToBean = new SqlToBean("com.mysql.jdbc.Driver","jdbc:mysql://127.0.0.1:3306/information_schema","root","");
    //连接数据库
    sqlToBean.connect();
    sqlToBean.getTableName();
    sqlToBean.getTableKey();
    sqlToBean.url = "jdbc:mysql://127.0.0.1:3306/cooteklife";
    sqlToBean.connect();
    for(int i=0;i<sqlToBean.tableNames.length;i++){
    	coding = new StringBuffer();
    	String tableName = sqlToBean.tableNames[i];
    	if((tableName.equals("user_info")||tableName.equals("object_maxsn"))){
    		continue ;
    	}
    	
    	String className = sqlToBean.createClassName(tableName);
    	
        //获取表的字段
        String[][] str ;
        str = sqlToBean.getColumenName();
        for(int j = 0;j<str.length ;j++) {
          sqlToBean.createGenerate(str[j][0],str[j][1],str[j][2]);
        }
        sqlToBean.createPriKey(sqlToBean.keyMap.get(tableName));
        coding.append("\n");
        sqlToBean.createMethod(str);
        coding.append("\n}");
        //写入文件
        sqlToBean.writeData(sqlToBean.getCoding(coding),className);
    }
    
    sqlToBean.destroy();
 
    System.out.println("生成完成,当前路径为："+System.getProperty("user.dir"));
  }
 
}