package hadoop.mysql.table;
//������Ӧ��JavaBean
//�ɼ�����12Сʱ
public class MeteBean {
	private	String	ID;		//�����ʶ
	private	long		TimeStam; //ʱ��� ƽ������ͣ����
	private double	AirTemp;	//����28.75��15��42.9
	private double	Humi;		//ʪ��%100��15��100
	private double	AtmoPres;   //��ѹ974.64����962.5��991.3
	private double	UVRadi;		//�������0.91��0��6.9
	private double	Evap;		//��ɢ��0.11��0��0.61
	private double	RainFall;	//����0.073��0��14.2
	
//	public MeteBean(String	ID,int	TimeStam,double	AirTemp,double	Humi,double	AtmoPres,double	UVRadi,double	Evap,double	RainFall){
//		this.ID=ID;
//		this.TimeStam=TimeStam;
//		this.AirTemp=AirTemp;
//		this.Humi=Humi;
//		this.AtmoPres=AtmoPres;
//		this.UVRadi=UVRadi;
//		this.Evap=Evap;
//		this.RainFall=RainFall;
//	}
	
	
	
	public MeteBean() {
		super();
		AirTemp=NormalRandom.getNormalRandom(28.75,15);
		Humi=NormalRandom.getNormalRandom(100,5);
		AtmoPres=NormalRandom.getNormalRandom(974.64,20);
		UVRadi=NormalRandom.getNormalRandom(0.91,4);
		Evap=NormalRandom.getNormalRandom(0.11,0.5);
		RainFall=NormalRandom.getNormalRandom(0.073,13);	
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
