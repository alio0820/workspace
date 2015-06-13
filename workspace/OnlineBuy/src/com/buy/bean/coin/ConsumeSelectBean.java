package com.buy.bean.coin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.buy.bean.database.DBConnect;

public class ConsumeSelectBean {
	//设置默认起始日期的年月日为1700-1-1至2099-1-1，默认的状态为0，订单号为空
	String s_year = "1700",s_month="1",s_day = "1",e_year="2099",e_month="1",e_day="1",status = "0",num=null;
    public ConsumeSelectBean(){
    }
    public void setNum(String num){
    	this.num=num;
    }
	public void setS_year(String s_year) {
		this.s_year = s_year;
	}
	public void setS_month(String s_month) {
		this.s_month = s_month;
	}
	public void setS_day(String s_day) {
		this.s_day = s_day;
	}
	public void setE_year(String e_year) {
		this.e_year = e_year;
	}
	public void setE_month(String e_month) {
		this.e_month = e_month;
	}
	public void setE_day(String e_day) {
		this.e_day = e_day;
	}
	public void setStatus(String status) {
		this.status = status;
	}
    public StringBuffer selectCosume(String userID){
    	String s_date = s_year+"-"+s_month+"-"+s_day;
    	String e_date = e_year+"-"+e_month+"-"+e_day;
    	String condition;
    	if(num!=null){
    		//则生成以订单号为条件的查询语句
    		condition="select consumeid,procuctname,price,datetime from buy.consume where USERID="+userID+"and consumeid="+num;
    	}
    	else{
    		//否则生成以日期为条件的查询语句
    		condition="select consumeid,procuctname,price,datetime from buy.consume where USERID="+userID+"and datetime<="+e_date+"and datetime>="+s_date;
    	}
    	ResultSet rs =null;
    	Statement sql= null;
    	String name,coin,date;
    	StringBuffer buffer = new StringBuffer();
    	try{
    		Connection conn =DBConnect.getConnection();//建立数据库连接
    		sql = conn.createStatement();
    		rs = sql.executeQuery(condition);
    		int i=1;
    		//将JSP页面写进一个StringBuffer类型的变量中，这是JavaBean+Jsp的一个经典做法
    		buffer.append("<table width="+"100%"+" border="+"0"+"cellpadding="+"0"+"cellspacing="+"1"+">");
    		buffer.append("<tr align="+"center"+">");
    		buffer.append("<td width="+"236"+"height"+"25"+"class="+"cal_td12"+">消费者记录编号</td>");
    		buffer.append("<td width='280' height='25' class='cal_td12'>商品名称</td>");//
    		buffer.append("<td width="+"264"+"height"+"25"+"class="+"cal_td12"+">商品价格</td>");
    		buffer.append("<td width="+"264"+"height"+"25"+"class="+"cal_td12"+">购买日期</td>");
    		buffer.append("</tr>");
    		while(rs.next()){
				buffer.append("<tr align='center'>");//
				num= rs.getString(1);
				if(i%2==1){                                //这句话有问题、、、、、、、、、、、、、、、、、
				//取得结果集中的一条记录的第1个字段，赋给num	
				buffer.append("<TD  height='20' class='cal_td06'>"+num+"<TD>");
				//取得结果集中的一条记录的第2个字段，赋给name
				name = rs.getString(2);
				buffer.append("<TD  height='20' class='cal_td06'>"+name+"<TD>");
				//取得结果集中的一条记录的第3个字段，赋给coin
				coin = rs.getString(3);
				buffer.append("<TD height='20' class='cal_td06'>"+coin+"<TD>");
				//取得结果集中的一条记录的第4个字段，赋给date
				date = rs.getString(4);
				buffer.append("<TD height='20' class='cal_td06'>"+date+"<TD>");
			    }
				else{				
				buffer.append("<TD width='150' height='20' class='cal_td08'>"+num+"<TD>");
				//取得结果集中的一条记录的第2个字段，赋给type
				name = rs.getString(2);
				buffer.append("<TD height='20' class='cal_td08'>"+name+"<TD>");
				//取得结果集中的一条记录的第3个字段，赋给coin
				coin = rs.getString(3);
				buffer.append("<TD height='20' class='cal_td08'>"+coin+"<TD>");
				//取得结果集中的一条记录的第4个字段，赋给date
				date = rs.getString(4);
				buffer.append("<TD height='20' class='cal_td08'>"+date+"<TD>");
			}
    		buffer.append("</tr>");
    		i++;
    		}
    		buffer.append("</table>");
			rs.close();
			sql.close();
			conn.close();
		}catch(SQLException ex){
			return new StringBuffer("查询错误");
		}
		return buffer;
    	}
    	
    }
