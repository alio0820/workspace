package com.common;

import java.io.File;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;
import java.util.TreeMap;

import com.bean.FileBean;
import com.tool.ChineseCalendar;
/**
 * author:翟灿东
 * 日期:2013-04-14
 * 修改日期:2013-07-21 2014-2-21 2014-4-14
 * 该类完成对常用功能的封装
 */
public class Common {
	public static String TodayByGC;//公历
	public static String TodayByLC;//农历
	private final static String[] hexDigits = {"0", "1", "2", "3", "4",  
        "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"};
	/**
	 * 获取今天的农历日期
	 * @return String
	 */
	public static String getTodayByLC(){
		Date date = new Date();
		String dateFormat = getDate(date);
		if(TodayByGC==null||!TodayByGC.equals(dateFormat)){
			TodayByGC = dateFormat;
			TodayByLC = new ChineseCalendar(date).toString();
		}
		return TodayByLC;
	}
	/**  
     * 转换字节数组为十六进制字符串 
     * @param     字节数组 
     * @return    十六进制字符串 
     */  
    public static String byteArrayToHexString(byte[] b){  
        StringBuffer resultSb = new StringBuffer();  
        for (int i = 0; i < b.length; i++){  
            resultSb.append(byteToHexString(b[i]));  
        }  
        return resultSb.toString();  
    }  
      
    /** 将一个字节转化成十六进制形式的字符串     */  
    public static String byteToHexString(byte b){  
        int n = b;  
        if (n < 0)  
            n = 256 + n;  
        int d1 = n / 16;  
        int d2 = n % 16;  
        return hexDigits[d1] + hexDigits[d2];  
    }
	/** 
	 * 对字符串进行MD5加密
	 */  
    public static String encodeByMD5(String originString){
        if (originString != null){
            try{
                //创建具有指定算法名称的信息摘要  
                MessageDigest md = MessageDigest.getInstance("MD5");  
                //使用指定的字节数组对摘要进行最后更新，然后完成摘要计算  
                byte[] results = md.digest(originString.getBytes());  
                //将得到的字节数组变成字符串返回  
                String resultString = byteArrayToHexString(results);
                return resultString.toUpperCase();
            } catch(Exception ex){
            	MyLog.getLogError(ex,"md5加密出错...");
            }
        }
        return null;
    }
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return boolean
	 */
	public static boolean isBlank(String str){
		if(str==null||str.equals(""))
			return true;
		else
			return false;
	}
	/**
	 * 获取当前日期
	 * @return String
	 */
	public static String getDate(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		return df.format(date);
	}
	/**
	 * 获取当前日期（格式化）
	 * @return String
	 * @param DATEFMT
	 */
	public static String getDate(String DATEFMT){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat(DATEFMT);
		return df.format(date);
	}
	/**
	 * 获取指定日期的指定格式
	 * @return String
	 */
	public static String getDate(Date date){
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd");
		return df.format(date);
	}
	/**
	 * 获取当前时间（全称）
	 * @return String
	 */
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy.MM.dd HH:mm:ss");
		return df.format(date);
	}
	/**
	 * 获取格式化的NO
	 * @return String
	 */
	public static String getNoByFormat(String NOFMT,int i){
		String num = "1"+NOFMT;
		int temp = Integer.parseInt(num);
		temp+=i;
		num =(temp+"").substring(1);
		return num;
	}
	/**
	 * 从数据库表中获取最大的流水号
	 * @return String
	 */
	public static String getMaxSerialNoFromDB(Connection conn,String tableName,String columnName,String today,String NOFMT){
		String maxSerialNo = "";
		String maxSerialNoSql = "select max("+columnName+") from "+tableName+" where "+columnName+" like '"+today+"%'";
		try {
			ResultSet rs = DBConnection.executeQuery(conn,maxSerialNoSql);
			if(rs.next()){
				maxSerialNo = rs.getString(1);
				if(maxSerialNo!=null&&!maxSerialNo.equals(""))
					maxSerialNo = today + getNoByFormat(maxSerialNo.substring(today.length()),1);
				else
					maxSerialNo = today + getNoByFormat(NOFMT,1);
			}
			else{
				maxSerialNo = today + getNoByFormat(NOFMT,1);
			}
			rs.close();
		} catch (Exception e) {
			MyLog.getLogError(e,"从数据库表中获取最大的流水号出错...");
		}
		return maxSerialNo;
	}
	/**
	 * 动态生成流水号
	 * @update 2014-2-25
	 * @return String
	 */
	public static String getSerialNo(String tableName,String columnName){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		String sSerialNo = getSerialNo(conn,tableName,columnName,"yyyyMMdd","00000000");
		try {
			conn.close();
		} catch (SQLException e) {
			MyLog.getLogError(e,"关闭连接出错...");
		}
		db.CloseDB();
		return sSerialNo;
	}
	public static String getSerialNo(Connection conn,String tableName,String columnName){
		return getSerialNo(conn,tableName,columnName,"yyyyMMdd","00000000");
	}
	public static String getSerialNo(Connection conn,String tableName,String columnName,String DATEFMT){
		return getSerialNo(conn,tableName,columnName,DATEFMT,"00000000");
	}
	public static String getSerialNo(Connection conn,String tableName,String columnName,String DATEFMT,String NOFMT){
		String sLockSql = "update OBJECT_MAXSN set maxSerialNo = maxSerialNo where tableName='"+tableName+"' and columnName='"+columnName+"' and DATEFMT='"+DATEFMT+"' and NOFMT='"+NOFMT+"'";
		String sQuerySql ="select maxSerialNo from OBJECT_MAXSN where tableName='"+tableName+"' and columnName='"+columnName+"' and DATEFMT='"+DATEFMT+"' and NOFMT='"+NOFMT+"'";
		String sUpdateSql = "update OBJECT_MAXSN set maxSerialNo =? where tableName='"+tableName+"' and columnName='"+columnName+"' and DATEFMT='"+DATEFMT+"' and NOFMT='"+NOFMT+"'";
		String sInsertSql = "insert into OBJECT_MAXSN(tableName,columnName,maxSerialNo,DATEFMT,NOFMT) values(?,?,?,?,?)";
		String today = getDate(DATEFMT);
		String sSerialNo= "";
		ResultSet rs =null;
		try {
			conn.setAutoCommit(false);
			DBConnection.executeSQL(conn,sLockSql);
			rs = DBConnection.executeQuery(conn,sQuerySql);
			if(rs.next()){
				//如果存在，则计算新的流水号
				String sMaxSerialNo = rs.getString(1);
				rs.close();
				//判断是否存在今天的记录，如果有则从当前号开始增加,否则从1开始
				if(sMaxSerialNo!=null&&sMaxSerialNo.indexOf(today)!=-1){
					sSerialNo = today + getNoByFormat(sMaxSerialNo.substring(today.length()),1);
				}
				else{
					sSerialNo = today + getNoByFormat(NOFMT,1);
				}
				//更新OBJECT_MAXSN表
				DBConnection.executeSQL(conn,sUpdateSql,sSerialNo);
			}
			else{
				rs.close();
				//如果不存在，则从数据库表中取得最大的流水号
				sSerialNo = getMaxSerialNoFromDB(conn,tableName,columnName,today,NOFMT);
				//OBJECT_MAXSN表插入记录
				DBConnection.executeSQL(conn,sInsertSql,tableName,columnName,sSerialNo,DATEFMT,NOFMT);
			}
			conn.commit();
			conn.setAutoCommit(true);
		} catch (SQLException e) {
			MyLog.getLogError(e,"动态生成流水号出错...");
			return null;
		}finally{
		}
		return sSerialNo;
	}
	
	public static void main(String[] args){
//		
	}
	
//	/**
//	 * 获取session
//	 * @return HttpSession
//	 */
//	public static HttpSession getSession(){
//		WebContext webContext = WebContextFactory.get();
//        return webContext.getSession();  
//	}
//	/**
//	 * 获取request
//	 * @return HttpServletRequest
//	 */
//	public static HttpServletRequest getRequest(){
//		WebContext webContext = WebContextFactory.get();
//		return webContext.getHttpServletRequest();
//	}
//	/**
//	 * 获取response
//	 * @return HttpServletResponse
//	 */
//	public static HttpServletResponse getResponse(){
//		WebContext webContext = WebContextFactory.get();
//		return webContext.getHttpServletResponse();
//	}
//	
//	public static void main(String[] args){
//		System.out.println(Common.getTime());
//	}
}
