package hadoop.mysql.table;
//�����������Ӧ��JavaBean
//�ɼ�����һ����
public class SoilFertBean {
	private  String ID;	//�����ʶ
	private	 long	TimeStam;//ʱ���
	private	 double NCont;	//���ʺ���
	private  double PCont;  //�׷ʺ���
	private  double KCont;  //�طʺ���
	private  double PHValu;  //PHֵ
	

	
	public SoilFertBean(String iD, int timeStam, double nCont, double pCont,
			double kCont, double pHValu) {
		super();
		ID = iD;
		TimeStam = timeStam;
		NCont = nCont;
		PCont = pCont;
		KCont = kCont;
		PHValu = pHValu;
	}
	
	
	public SoilFertBean() {
		super();
		NCont=NormalRandom.getNormalRandom(98,23);
		PCont=NormalRandom.getNormalRandom(72,15);
		KCont=NormalRandom.getNormalRandom(28.75,15);
		PHValu=NormalRandom.getNormalRandom(7.5,2);
		
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
