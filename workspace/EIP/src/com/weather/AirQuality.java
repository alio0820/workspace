package com.weather;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.InputStreamReader;
import java.net.SocketTimeoutException;
import java.net.URL;
import java.net.URLConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.conn.Conn;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * ��ȡ��������
 * @date:2013-12-24
 * @author cdzhai
 */
public class AirQuality extends Thread{
	StringBuilder sb;
    BufferedReader br;// ��ȡdata������
    JSONObject jsonData;
	public void getAQIOnline(String CityName) throws Exception {
		// http://www.pm25.in/api/querys/pm2_5.json?city=%E4%B8%8A%E6%B5%B7&token=3xfrpBfgJMzHqRCa6Wzg
//		URL url = new URL("http://www.pm25.in/api/querys/pm2_5.json?city=%E4%B8%8A%E6%B5%B7&token=3xfrpBfgJMzHqRCa6Wzg");
		System.out.println("��ʼ��ȡ����������������Ϣ...");
		URL url = new URL("http://www.pm25.in/api/querys/aqi_ranking.json?token=3xfrpBfgJMzHqRCa6Wzg");
		URLConnection connectionData = url.openConnection();
        connectionData.setConnectTimeout(30000);
        try {
            br = new BufferedReader(new InputStreamReader(
                    connectionData.getInputStream(), "UTF-8"));
            sb = new StringBuilder();
            String line = null;
            while ((line = br.readLine()) != null)
                sb.append(line);
        } catch (SocketTimeoutException e) {
            System.out.println("���ӳ�ʱ");
        } catch (FileNotFoundException e) {
            System.out.println("�����ļ�����");
        }
        String datas = sb.toString();
        if(datas.startsWith("{")){
        	JSONObject jsonObject = JSONObject.fromObject(datas);
        	System.out.println(jsonObject.getString("error"));
        	return;
        }
        JSONArray data = JSONArray.fromObject(datas);
        saveAQI(data);
        System.out.println("������ȡ����������������Ϣ...");
//      datas = datas.replaceAll("^[", "{\"weatherinfo\":").replaceAll("]$", "}");
//        jsonData = JSONObject.fromObject(data.get(data.size()-1));
//        System.out.println(jsonData.toString()); 
//        String aqi = jsonData.getString("aqi");
//        String quality = jsonData.getString("quality");
//        System.out.println(aqi+quality);
	}
	public void saveAQI(JSONArray data){
		System.out.println("��ʼ���¸���������������Ϣ���...");
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;
		JSONObject jsonData;
		try
		{
			for(int i=0;i<data.size();i++){
				jsonData = JSONObject.fromObject(data.get(i));
				String areaName = jsonData.getString("area");
				int aqi = Integer.parseInt(jsonData.getString("aqi"));
		        String quality = jsonData.getString("quality");
		        pstmt = connection.prepareStatement("select id from AQI where areaName=?");
				pstmt.setString(1,areaName);
			    ResultSet rs = pstmt.executeQuery();
				if(rs.next()){
					pstmt = connection.prepareStatement("update AQI set AQI=?,quality=? where areaName=?");
				}
				else{
					pstmt = connection.prepareStatement("insert into AQI(AQI,quality,areaName) values(?,?,?)");
				}
				pstmt.setInt(1,aqi);
				pstmt.setString(2,quality);
				pstmt.setString(3,areaName);
				pstmt.execute();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println("�������¸���������������Ϣ���...");
	}
	public static String getAQIByCity(String CityName) throws SQLException{
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;
		pstmt = connection.prepareStatement("select AQI,quality from AQI where areaName=?");
		pstmt.setString(1,CityName);
	    ResultSet rs = pstmt.executeQuery();
	    int AQI=0;
	    String quality ="";
		if(rs.next()){
			AQI = rs.getInt("AQI");
			quality = rs.getString("quality");
		}
		return AQI+","+quality;
	}
	public void run(){
		while(true){
			try {
				getAQIOnline(null);
				sleep(3600000);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	public static void main(String[] args) throws Exception{
		new AirQuality().start();
	}

}
