package com.swu.edu.cn;
//����ʪ�ȱ�SoilHumi��Ӧ��JavaBean���ɼ�����Ϊ1Сʱ
//�ɼ�����1Сʱ
public class SoilHumiBean {
	private  String  ID; //�����ʶ
	private  int	TimeStam; //ʱ���
	private  double  Hume1;		//���ʪ��
	private  double  Hume2;		//�в�ʪ��
	private  double  Hume3;		//�ײ�ʪ��
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
