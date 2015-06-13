package com.swu.edu.cn;
//土壤肥力表对应的JavaBean
//采集周期一个月
public class SoilFertBean {
	private  String ID;	//地域标识
	private	 int	TimeStam;//时间戳
	private	 double NCont;	//氮肥含量
	private  double PCont;  //磷肥含量
	private  double KCont;  //钾肥含量
	private  double PHValu;  //PH值
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
	public double getNCont() {
		return NCont;
	}
	public void setNCont(double nCont) {
		NCont = nCont;
	}
	public double getPCont() {
		return PCont;
	}
	public void setPCont(double pCont) {
		PCont = pCont;
	}
	public double getKCont() {
		return KCont;
	}
	public void setKCont(double kCont) {
		KCont = kCont;
	}
	public double getPHValu() {
		return PHValu;
	}
	public void setPHValu(double pHValu) {
		PHValu = pHValu;
	}
	
}
