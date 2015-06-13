<%@ page language="java" import="java.util.*" pageEncoding="gbk"%>
<%@page import="com.weather.WeatherForCountry"%>
<div id="checkonbyday" width="100%">
  <%
  	  String timestamp = request.getParameter("timestamp");
  	  Date date;
  	  if(timestamp!=null)
  		  date = new Date(Long.parseLong(timestamp));
  	  else
  		  date = new Date();
      int month = date.getMonth()+1;
      int day = date.getDate();
      int week = date.getDay();
      for(int i=-6;i<2;i++){
    	  int day_now = day+i;
    	  int week_now = (week+i)>0?(week+i):(week+i+7);
    	  boolean flag = (week_now>5)?true:false;
    	  String date_show = (month<10?"0"+month:""+month)+"/"+(day_now<10?"0"+day_now:""+day_now);
    	  if(day_now<=0){
    		  Date date2 = new Date(date.getTime()+1000*60*60*24*i);
    		  day_now = date2.getDate();
    		  int month_now = date2.getMonth()+1;
    		  date_show =(month_now<10?"0"+month_now:""+month_now)+"/"+(day_now<10?"0"+day_now:""+day_now);
    	  }
  %>
    <span class="check_td">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <%="<td colspan=\"2\" align=\"center\" title=\""+WeatherForCountry.getWeek(week_now+1>7?1:(week_now+1))+"\" "+(flag?"class=\"day_title_O\">"+date_show+"<span class=\"day_title_O_icon\"></span>":"class=\"day_title_W\">"+date_show)+"</td>"%>
        </tr>
      <tr>
        <td align="center" class="PM_line hover">上午<br />
         <span class="day_ap_V"> <%=flag?"非工作":"出勤"%></span></td>
        <td align="center" class="hover">下午<br />
           <span class="day_ap_V"> <%=flag?"非工作":"出勤"%></span></td>
      </tr>
    </table>
    </span>
   <%}%>
</div>
