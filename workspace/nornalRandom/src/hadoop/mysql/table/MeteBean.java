package hadoop.mysql.table;
//气象表对应的JavaBean
//采集周期12小时
public class MeteBean {
	private	String	ID;		//地域标识
	private	long		TimeStam; //时间戳 平均，最低，最高
	private double	AirTemp;	//气温28.75；15；42.9
	private double	Humi;		//湿度%100；15；100
	private double	AtmoPres;   //气压974.64；；962.5；991.3
	private double	UVRadi;		//紫外辐射0.91；0；6.9
	private double	Evap;		//蒸散量0.11；0；0.61
	private double	RainFall;	//雨量0.073；0；14.2
	
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
