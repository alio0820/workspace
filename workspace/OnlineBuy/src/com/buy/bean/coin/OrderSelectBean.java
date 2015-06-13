package com.buy.bean.coin;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.buy.bean.database.DBConnect;

public class OrderSelectBean {
	//设置默认起始日期的年月日为1700-1-1至2099-1-1，默认的状态为0，订单号为空
	String s_year = "1700",s_month="1",s_day = "1",e_year="2099",e_month="1",e_day="1",status = "0",num=null;
    public OrderSelectBean(){
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
    public StringBuffer selectOrder(String userID){
    	String type1 =null;
    	int j= Integer.parseInt(status);
    	switch(j){
    	case 0:
    		type1="Any";break;
    	case 1:
    		type1="正在处理";break;
    	case 2:
    		type1="支付成功";break;
    	case 3:
    		type1="支付失败";break;
    	}
    	String s_date = s_year+"-"+s_month+"-"+s_day;
    	String e_date = e_year+"-"+e_month+"-"+e_day;
    	String condition;
    	if(num!=null){
    		//则生成以订单号为条件的查询语句
    		condition="select orderid,type,price,datetime,productname from buy.order where USERID="+userID+"and orderid="+num;
    	}
    	else{
    		//否则生成以日期为条件的查询语句
    		condition="select orderid,type,price,datetime,productname from buy.order where USERID="+userID+"and datetime<="+e_date+"and datetime>="+s_date;
    		if(j!=0){
    			//如果用户同时选择了类型，则把类型条件加到语句中
    			condition+="and type ="+type1;
    		}
    	}
    	ResultSet rs =null;
    	Statement sql= null;
    	String num,status,c_date,p_date,cabi;
    	StringBuffer buffer = new StringBuffer();
    	try{
    		Connection conn =DBConnect.getConnection();//建立数据库连接
    		sql = conn.createStatement();
    		rs = sql.executeQuery(condition);
    		int i=1;
    		//将JSP页面写进一个StringBuffer类型的变量中，这是JavaBean+Jsp的一个经典做法
    		buffer.append("<table width="+"100%"+" border="+"0"+"cellpadding="+"0"+"cellspacing="+"1"+">");
    		buffer.append("<tr align="+"center"+">");
    		buffer.append("<td width="+"150"+"height"+"25"+"class="+"cal_td12"+">订单号</td>");
    		buffer.append("<td width='180' height='25' class='cal_td12'>订单状态</td>");//
    		buffer.append("<td width="+"150"+"height"+"25"+"class="+"cal_td12"+">金额</td>");
    		buffer.append("<td width="+"150"+"height"+"25"+"class="+"cal_td12"+">订单创建时间</td>");
    		buffer.append("<td width="+"150"+"height"+"25"+"class="+"cal_td12"+">订购商品名称</td>");
    		buffer.append("</tr>");
    		while(rs.next()){
				buffer.append("<tr align='center'>");//
				//取得结果集中一条记录的第一个字段，赋给num
				num= rs.getString(1);
				if(i%2==1){                                //这句话有问题、、、、、、、、、、、、、、、、、
				//取得结果集中的一条记录的第2个字段，赋给status
				status = rs.getString(2);
				buffer.append("<TD width='150' height='20' class='cal_td06'>"+status+"<TD>");
				//取得结果集中的一条记录的第3个字段，赋给coin
				String coin = rs.getString(3);
				buffer.append("<TD width='150' height='20' class='cal_td06'>"+coin+"<TD>");
				//取得结果集中的一条记录的第4个字段，赋给date
				String date = rs.getString(4);
				buffer.append("<TD width='150' height='20' class='cal_td06'>"+date+"<TD>");
				//取得结果集中的一条记录的第5个字段，赋给name
				String name = rs.getString(5);
				buffer.append("<TD width='150' height='20' class='cal_td06'>"+name+"<TD>");
			    }else{
				//取得结果集中的一条记录的第2个字段，赋给status
				status = rs.getString(2);
				buffer.append("<TD width='150' height='20' class='cal_td08'>"+status+"<TD>");
				//取得结果集中的一条记录的第3个字段，赋给coin
				String coin = rs.getString(3);
				buffer.append("<TD width='150' height='20' class='cal_td08'>"+coin+"<TD>");
				//取得结果集中的一条记录的第4个字段，赋给date
				String date = rs.getString(4);
				buffer.append("<TD width='150' height='20' class='cal_td08'>"+date+"<TD>");
				//取得结果集中的一条记录的第5个字段，赋给name
				String name = rs.getString(5);
				buffer.append("<TD width='150' height='20' class='cal_td08'>"+name+"<TD>");
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

