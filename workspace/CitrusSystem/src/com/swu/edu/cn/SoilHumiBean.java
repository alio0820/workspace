package com.swu.edu.cn;
//土壤湿度表SoilHumi对应的JavaBean，采集周期为1小时
//采集周期1小时
public class SoilHumiBean {
	private  String  ID; //地域标识
	private  int	TimeStam; //时间戳
	private  double  Hume1;		//表层湿度
	private  double  Hume2;		//中层湿度
	private  double  Hume3;		//底层湿度
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getTimeStam() {
		return TimeStam;
	}
	public void setTimeStam(int timeStam) {
		TimeStam = timeStam;
	}
	public double getHume1() {
		return Hume1;
	}
	public void setHume1(double hume1) {
		Hume1 = hume1;
	}
	public double getHume2() {
		return Hume2;
	}
	public void setHume2(double hume2) {
		Hume2 = hume2;
	}
	public double getHume3() {
		return Hume3;
	}
	public void setHume3(double hume3) {
		Hume3 = hume3;
	}
	
	
}
