package com.swu.edu.cn;
//气象表对应的JavaBean
//采集周期12小时
public class MeteBean {
	private	String	ID;		//地域标识
	private	int		TimeStam; //时间戳
	private double	AirTemp;	//气温
	private double	Humi;		//湿度
	private double	AtmoPres;   //气压
	private double	UVRadi;		//紫外辐射
	private double	Evap;		//蒸散量
	private double	RainFall;	//雨量
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
	public double getAirTemp() {
		return AirTemp;
	}
	public void setAirTemp(double airTemp) {
		AirTemp = airTemp;
	}
	public double getHumi() {
		return Humi;
	}
	public void setHumi(double humi) {
		Humi = humi;
	}
	public double getAtmoPres() {
		return AtmoPres;
	}
	public void setAtmoPres(double atmoPres) {
		AtmoPres = atmoPres;
	}
	public double getUVRadi() {
		return UVRadi;
	}
	public void setUVRadi(double uVRadi) {
		UVRadi = uVRadi;
	}
	public double getEvap() {
		return Evap;
	}
	public void setEvap(double evap) {
		Evap = evap;
	}
	public double getRainFall() {
		return RainFall;
	}
	public void setRainFall(double rainFall) {
		RainFall = rainFall;
	}
	
}
