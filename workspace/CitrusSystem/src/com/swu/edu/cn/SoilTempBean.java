package com.swu.edu.cn;
//土壤温度表SoilTemp对应的JavaBean
//采集周期十分钟
public class SoilTempBean {
 private    String   ID;	//地域标识
 private	int     TimeStam;  //时间戳
 private    double  Temp1;     //
 private    double  Temp2;
 private    double  Temp3;
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
public double getTemp1() {
	return Temp1;
}
public void setTemp1(double temp1) {
	Temp1 = temp1;
}
public double getTemp2() {
	return Temp2;
}
public void setTemp2(double temp2) {
	Temp2 = temp2;
}
public double getTemp3() {
	return Temp3;
}
public void setTemp3(double temp3) {
	Temp3 = temp3;
}
 
 
}
