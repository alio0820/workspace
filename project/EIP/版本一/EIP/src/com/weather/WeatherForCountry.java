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
	 * 得到未来6天的天气(含今天)
	 * @author Chewl
	 *
	 */
	public class WeatherForCountry {
	    String cityId;
	    URLConnection connectionData;
	    StringBuilder sb;
	    BufferedReader br;// 读取data数据流
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
			else{//如果为空，则返回上海市天气预报代码
				cityId = "101020100";
			}
	    	return this.cityId;
	    }
		public WeatherForCountry(String CityName) throws SQLException{
	        // 解析本机ip地址
			getCityId(CityName);
	        // 连接中央气象台的API
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
				    System.out.println("连接超时");
				} catch (FileNotFoundException e) {
				    System.out.println("加载文件出错");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
	            String datas = sb.toString();
	           jsonData = JSONObject.fromObject(datas);
	          //  System.out.println(jsonData.toString()); 
	           info = jsonData.getJSONObject("weatherinfo");
	         
	        //得到1到3天的天气情况
	        for(int i=1;i<=3;i++){
	            //得到未来3天的日期
	            Calendar cal = Calendar.getInstance();
	            cal.add(Calendar.DAY_OF_YEAR, i-1);
//	            Date date = cal.getTime();
//	            SimpleDateFormat sf = new SimpleDateFormat("yyyy年MM月dd日");
	             
	            Map<String,Object> map = new HashMap<String, Object>();
	            map.put("city", info.getString("city").toString());//城市
//	            map.put("date_y", sf.format(date));//日期
	            map.put("week", getWeek(cal.get(Calendar.DAY_OF_WEEK)));//星期
	            map.put("fchh", info.getString("fchh").toString());//发布时间
	            map.put("weather", info.getString("weather"+i).toString());//天气
	            map.put("temp", info.getString("temp"+i).toString());//温度
	            map.put("wind", info.getString("wind"+i).toString());//风况
	            map.put("fl", info.getString("fl"+i).toString());//风速
	            map.put("index", info.getString("index").toString());// 今天的穿衣指数
	            map.put("index_uv", info.getString("index_uv").toString());// 紫外指数
	            map.put("index_tr", info.getString("index_tr").toString());// 旅游指数
	            map.put("index_co", info.getString("index_co").toString());// 舒适指数
	            map.put("index_cl", info.getString("index_cl").toString());// 晨练指数
	            map.put("index_xc", info.getString("index_xc").toString());//洗车指数
	            map.put("index_d", info.getString("index_d").toString());//天气详细穿衣指数
	            map.put("img", getWeatherImg(map.get("weather").toString()));
	            if(i==1){//查询当天AQI
	            	map.put("cityId", cityId);
	            	try {
						String quality = AirQuality.getAQIByCity(CityName);
						if(quality.length()>2){
							int index = quality.indexOf(",");
							map.put("AQI", quality.substring(0,index));
							map.put("quality", quality.substring(index+1));
						}
						else{
							map.put("AQI", "无");
							map.put("quality", "无");
						}
					} catch (SQLException e) {
						e.printStackTrace();
					}
	            }
	            list.add(map);
	        }
	        //控制台打印出天气
//	       System.out.println("城市\t星期\t发布时间\t天气\t温度\t风况\t风速\t\t\t今天的穿衣指数\t紫外指数\t旅游指数\t舒适指数\t晨练指数\t洗车指数\t穿衣指数");
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
			if(weather.startsWith("晴"))
				suffix = "a0.jpg";
			else if(weather.startsWith("多云"))
				suffix = "a1.jpg";
			else if(weather.startsWith("阴"))
				suffix = "a2.jpg";
			else if(weather.startsWith("小雨"))
				suffix = "a7.jpg";
			else if(weather.startsWith("中雨"))
				suffix = "a8.jpg";
			else if(weather.startsWith("大雨"))
				suffix = "a9.jpg";
			else if(weather.startsWith("暴雨"))
				suffix = "a10.jpg";
			else if(weather.startsWith("特大暴雨"))
				suffix = "a11.jpg";
			else if(weather.startsWith("特特大暴雨"))
				suffix = "a12.jpg";
			else if(weather.startsWith("小雪"))
				suffix = "a13.jpg";
			else if(weather.equals("雨夹雪"))
				suffix = "a6.jpg";
			else if(weather.startsWith("霾"))
				suffix = "a53.jpg";
			else if(weather.startsWith("雷暴"))
				suffix = "a4.jpg";
			else if(weather.startsWith("雷雨"))
				suffix = "a5.jpg";
			return prefix+suffix;
		}
	    public static String getWeek(int iw){
	        String weekStr = "";
	        switch (iw) {
	        case 1:weekStr = "星期天";break;
	        case 2:weekStr = "星期一";break;
	        case 3:weekStr = "星期二";break;
	        case 4:weekStr = "星期三";break;
	        case 5:weekStr = "星期四";break;
	        case 6:weekStr = "星期五";break;
	        case 7:weekStr = "星期六";break;
	        default:
	            break;
	        }
	        return weekStr;
	    }
	    public static void main(String[] args) {
	        try {
	            new WeatherForCountry("潼关"); // 101010100(北京)就是你的城市代码
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    
	}