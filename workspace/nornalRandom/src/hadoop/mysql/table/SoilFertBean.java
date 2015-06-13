package hadoop.mysql.table;
//土壤肥力表对应的JavaBean
//采集周期一个月
public class SoilFertBean {
	private  String ID;	//地域标识
	private	 long	TimeStam;//时间戳
	private	 double NCont;	//氮肥含量
	private  double PCont;  //磷肥含量
	private  double KCont;  //钾肥含量
	private  double PHValu;  //PH值
	

	
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
