package hadoop.mysql.table;
//土壤温度表SoilTemp对应的JavaBean
//采集周期十分钟
public class SoilTempBean {
 private    String   ID;	//地域标识
 private	long     TimeStam;  //时间戳
 private    double  Temp1;     //31.27;20;41.1	
 private    double  Temp2;		//30.85;20;41
 private    double  Temp3;		//29.90;21.7;35.60
 
 
//public SoilTempBean(String iD, int timeStam, double temp1, double temp2,
//		double temp3) {
//	super();
//	ID = iD;
//	TimeStam = timeStam;
//	Temp1 = temp1;
//	Temp2 = temp2;
//	Temp3 = temp3;
//}

public SoilTempBean() {
	super();
	Temp1=NormalRandom.getNormalRandom(45.91,40);
	Temp2=NormalRandom.getNormalRandom(47.53,43);
	Temp3=NormalRandom.getNormalRandom(67.06,100);
}


public String getID() {
	return ID;
}
public void setID(String iD) {
	ID = iD;
}
public long getTimeStam() {
	return TimeStam;
}
public void setTimeStam(long timeStam) {
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
