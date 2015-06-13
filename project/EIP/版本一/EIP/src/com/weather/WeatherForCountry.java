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
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.conn.Conn;
	 
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
	/**
	 * �õ�δ��6�������(������)
	 * @author Chewl
	 *
	 */
	public class WeatherForCountry {
	    String cityId;
	    URLConnection connectionData;
	    StringBuilder sb;
	    BufferedReader br;// ��ȡdata������
	    JSONObject jsonData;
	    JSONObject info;
	    List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
	    static Map<String,String> city = new HashMap<String, String>();
	    
	    public String getList() {
	    	if(list.size()==0)
	    		return null;
			String retu = JSONArray.fromObject(list).toString();
			return retu;
		}
	    private String getCityId(String cityName) throws SQLException{
	    	
	    	Conn conn = new Conn();
			Connection connection = conn.getConnection(null);
			PreparedStatement pstmt = null;
			pstmt = connection.prepareStatement("select weatherCode from weather where cityName=?");
			pstmt.setString(1,cityName);
		    ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				cityId = rs.getString("weatherCode");
			}
			else{//���Ϊ�գ��򷵻��Ϻ�������Ԥ������
				cityId = "101020100";
			}
	    	return this.cityId;
	    }
		public WeatherForCountry(String CityName) throws SQLException{
	        // ��������ip��ַ
			getCityId(CityName);
	        // ������������̨��API
	        try {
				URL url = new URL("http://m.weather.com.cn/data/" + cityId + ".html");//101190401
				connectionData = url.openConnection();
				connectionData.setConnectTimeout(1000);
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
			} catch (Exception e) {
				e.printStackTrace();
			}
	            String datas = sb.toString();
	           jsonData = JSONObject.fromObject(datas);
	          //  System.out.println(jsonData.toString()); 
	           info = jsonData.getJSONObject("weatherinfo");
	         
	        //�õ�1��3����������
	        for(int i=1;i<=3;i++){
	            //�õ�δ��3�������
	            Calendar cal = Calendar.getInstance();
	            cal.add(Calendar.DAY_OF_YEAR, i-1);
//	            Date date = cal.getTime();
//	            SimpleDateFormat sf = new SimpleDateFormat("yyyy��MM��dd��");
	             
	            Map<String,Object> map = new HashMap<String, Object>();
	            map.put("city", info.getString("city").toString());//����
//	            map.put("date_y", sf.format(date));//����
	            map.put("week", getWeek(cal.get(Calendar.DAY_OF_WEEK)));//����
	            map.put("fchh", info.getString("fchh").toString());//����ʱ��
	            map.put("weather", info.getString("weather"+i).toString());//����
	            map.put("temp", info.getString("temp"+i).toString());//�¶�
	            map.put("wind", info.getString("wind"+i).toString());//���
	            map.put("fl", info.getString("fl"+i).toString());//����
	            map.put("index", info.getString("index").toString());// ����Ĵ���ָ��
	            map.put("index_uv", info.getString("index_uv").toString());// ����ָ��
	            map.put("index_tr", info.getString("index_tr").toString());// ����ָ��
	            map.put("index_co", info.getString("index_co").toString());// ����ָ��
	            map.put("index_cl", info.getString("index_cl").toString());// ����ָ��
	            map.put("index_xc", info.getString("index_xc").toString());//ϴ��ָ��
	            map.put("index_d", info.getString("index_d").toString());//������ϸ����ָ��
	            map.put("img", getWeatherImg(map.get("weather").toString()));
	            if(i==1){//��ѯ����AQI
	            	map.put("cityId", cityId);
	            	try {
						String quality = AirQuality.getAQIByCity(CityName);
						if(quality.length()>2){
							int index = quality.indexOf(",");
							map.put("AQI", quality.substring(0,index));
							map.put("quality", quality.substring(index+1));
						}
						else{
							map.put("AQI", "��");
							map.put("quality", "��");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
	            }
	            list.add(map);
	        }
	        //����̨��ӡ������
//	       System.out.println("����\t����\t����ʱ��\t����\t�¶�\t���\t����\t\t\t����Ĵ���ָ��\t����ָ��\t����ָ��\t����ָ��\t����ָ��\tϴ��ָ��\t����ָ��");
//	       for(int j=0;j<list.size();j++){
//	           Map<String,Object> wMap = list.get(j);
//	           System.out.println(wMap.get("city")+"\t"+wMap.get("week")+"\t"+wMap.get("fchh")+"\t"
//	                   +wMap.get("weather")+"\t"+wMap.get("temp")+"\t"+wMap.get("wind")+"\t"+wMap.get("fl")+"\t"+wMap.get("index")+"\t\t"+wMap.get("index_uv")+"\t"
//	                   +wMap.get("index_tr")+"\t"+wMap.get("index_co")+"\t"+wMap.get("index_cl")+"\t"+wMap.get("index_xc")+"|\t"+wMap.get("index_d"));
//	       }
	  
	    }
		private String getWeatherImg(String weather){
			String prefix = "images/";
			String suffix = "";
			if(weather.startsWith("��"))
				suffix = "a0.jpg";
			else if(weather.startsWith("����"))
				suffix = "a1.jpg";
			else if(weather.startsWith("��"))
				suffix = "a2.jpg";
			else if(weather.startsWith("С��"))
				suffix = "a7.jpg";
			else if(weather.startsWith("����"))
				suffix = "a8.jpg";
			else if(weather.startsWith("����"))
				suffix = "a9.jpg";
			else if(weather.startsWith("����"))
				suffix = "a10.jpg";
			else if(weather.startsWith("�ش���"))
				suffix = "a11.jpg";
			else if(weather.startsWith("���ش���"))
				suffix = "a12.jpg";
			else if(weather.startsWith("Сѩ"))
				suffix = "a13.jpg";
			else if(weather.equals("���ѩ"))
				suffix = "a6.jpg";
			else if(weather.startsWith("��"))
				suffix = "a53.jpg";
			else if(weather.startsWith("�ױ�"))
				suffix = "a4.jpg";
			else if(weather.startsWith("����"))
				suffix = "a5.jpg";
			return prefix+suffix;
		}
	    public static String getWeek(int iw){
	        String weekStr = "";
	        switch (iw) {
	        case 1:weekStr = "������";break;
	        case 2:weekStr = "����һ";break;
	        case 3:weekStr = "���ڶ�";break;
	        case 4:weekStr = "������";break;
	        case 5:weekStr = "������";break;
	        case 6:weekStr = "������";break;
	        case 7:weekStr = "������";break;
	        default:
	            break;
	        }
	        return weekStr;
	    }
	    public static void main(String[] args) {
	        try {
	            new WeatherForCountry("����"); // 101010100(����)������ĳ��д���
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	}