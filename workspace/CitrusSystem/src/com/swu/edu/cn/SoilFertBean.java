package com.swu.edu.cn;
//�����������Ӧ��JavaBean
//�ɼ�����һ����
public class SoilFertBean {
	private  String ID;	//�����ʶ
	private	 int	TimeStam;//ʱ���
	private	 double NCont;	//���ʺ���
	private  double PCont;  //�׷ʺ���
	private  double KCont;  //�طʺ���
	private  double PHValu;  //PHֵ
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
