package com.swu.edu.cn;
//������Ӧ��JavaBean
//�ɼ�����12Сʱ
public class MeteBean {
	private	String	ID;		//�����ʶ
	private	int		TimeStam; //ʱ���
	private double	AirTemp;	//����
	private double	Humi;		//ʪ��
	private double	AtmoPres;   //��ѹ
	private double	UVRadi;		//�������
	private double	Evap;		//��ɢ��
	private double	RainFall;	//����
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
