package hadoop.mysql.table;
//����ʪ�ȱ�SoilHumi��Ӧ��JavaBean���ɼ�����Ϊ1Сʱ
//�ɼ�����1Сʱ
public class SoilHumiBean {
	private  String  ID; //�����ʶ
	private  long	TimeStam; //ʱ���
	private  double  Hume1;		//���ʪ��67.06;0;200
	private  double  Hume2;		//�в�ʪ��47.53;4;98
	private  double  Hume3;		//�ײ�ʪ��45.91;9;96
	
	
//	public SoilHumiBean(String iD, int timeStam, double hume1, double hume2,
//			double hume3) {
//		super();
//		ID = iD;
//		TimeStam = timeStam;
//		Hume1 = hume1;
//		Hume2 = hume2;
//		Hume3 = hume3;
//	}
	
	
	public SoilHumiBean() {
		super();
		 Hume1=NormalRandom.getNormalRandom(67.06,20);
		 Hume2=NormalRandom.getNormalRandom(47.53,25);
		 Hume3=NormalRandom.getNormalRandom(45.91,26);
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
