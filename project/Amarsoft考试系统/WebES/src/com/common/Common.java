package com.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import com.tool.ChineseCalendar;
/**
 * author:翟灿东
 * 日期:2013-04-14
 * 修改日期:2013-07-21 2014-2-21 2014-4-14 2015-03-23
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
            } catch(Exception e){
            	ILog.error(e,"md5加密出错...");
            }
        }
        return null;
    }
    /**
     * 对字符串进行SHA1加密
     */
    public static String SHA1(String originString) {
        try {
            MessageDigest digest = java.security.MessageDigest.getInstance("SHA-1");
            digest.update(originString.getBytes());
            byte messageDigest[] = digest.digest();
            // Create Hex String
            StringBuffer hexString = new StringBuffer();
            // 字节数组转换为 十六进制 数
            for (int i = 0; i < messageDigest.length; i++) {
                String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
                if (shaHex.length() < 2) {
                    hexString.append(0);
                }
                hexString.append(shaHex);
            }
            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
        	ILog.error(e,"md5加密出错...");
        }
        return "";
    }
	/**
	 * 判断字符串是否为空
	 * @param str
	 * @return boolean
	 */
	public static boolean isBlank(Object str){
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
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
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		return df.format(date);
	}
	/**
	 * 获取当前时间（全称）
	 * @return String
	 */
	public static String getTime(){
		Date date = new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
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
			ILog.error(e,"从数据库表中获取最大的流水号出错...");
		}
		return maxSerialNo;
	}
	/**
	 * 动态生成流水号
	 * @update 2014-2-25
	 * @return String
	 */
	public static String getSerialNo(String tableName,String columnName){
		Connection conn = DBConnection.getConnection();
		String sSerialNo = getSerialNo(conn,tableName,columnName,"yyyyMMdd","0000");
		try {
			conn.close();
		} catch (SQLException e) {
			ILog.error(e,"关闭连接出错...");
		}
		return sSerialNo;
	}
	public static String getSerialNo(Connection conn,String tableName,String columnName){
		return getSerialNo(conn,tableName,columnName,"yyyyMMdd","0000");
	}
	public static String getSerialNo(Connection conn,String tableName,String columnName,String DATEFMT){
		return getSerialNo(conn,tableName,columnName,DATEFMT,"0000");
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
			ILog.error(e,"动态生成流水号出错...");
			return null;
		}finally{
		}
		return sSerialNo;
	}
	/**
	 * 从Mysql数据库结果集中根据列名和类型获取列值
	 * @return
	 */
	public static Object getValue4Mysql(ResultSet rs,String type,String columnName){
		Object value = null;
		  type = type.toLowerCase();
		  try {
			  switch(type){
			  	case "varchar": value=rs.getString(columnName);break;
			  	case "int": 	value = rs.getInt(columnName);break;
			  }
		  } catch (SQLException e) {
				ILog.error(e, "从结果集中获取值出错...");
			};
		  return value;
	  }
	/**
	 * 将字符串转换成键值对
	 * @return
	 */
	public static HashMap<String,String> splitStringToMap(String str){
		HashMap<String,String> map = new HashMap<String,String>();
		String[] strs = str.split(",");
		for(int i=0;i<strs.length;i++){
			String item = strs[i];
			if(isBlank(item))
				continue;
			if(item.contains(":")){
				int index = item.indexOf(":");
				if(index>0)
				map.put(item.substring(0,index).toLowerCase(), item.substring(index+1));
			}
		}
		return map;
	}
	
	/**
	 * 获取访问ip（备用方法）
	 * @param request
	 * @return
	 */
	public static String getIp2(HttpServletRequest request) {
		String ip = request.getHeader("X-Forwarded-For");
		if(ip!=null && !"unKnown".equalsIgnoreCase(ip)){
		   //多次反向代理后会有多个ip值，第一个ip才是真实ip
		   int index = ip.indexOf(",");
		   if(index != -1){
		       return ip.substring(0,index);
		   }else{
		       return ip;
		   }
		}
		ip = request.getHeader("X-Real-IP");
		if(ip!=null && !"unKnown".equalsIgnoreCase(ip)){
		   return ip;
		}
		return request.getRemoteAddr();
	}
	
	/**
	 * 获取访问ip
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request) {
        String ip = request.getHeader("X-Forwarded-For");  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("WL-Proxy-Client-IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_CLIENT_IP");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");  
        }  
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  
            ip = request.getRemoteAddr();  
        }
        if(ip.equals("0:0:0:0:0:0:0:1"))
        	ip = "127.0.0.1";
        return ip;  
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
	public static void main(String[] args){
		System.out.println(":12".substring(3).equals(""));
	}
}
