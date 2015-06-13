package hadoop.mysql.table;
//柑橘树表CitrTress对应的JavaBean
//一次性采集
public class CitrTreeBean {
	private  String ID;			 			//地域标识
	private  long   TimeStam; 				//时间戳
	private  int   Spec;  					//树木品种
	private  int   Age; 					//树龄
	private	 String  soilProp;				//土壤性质
	
	public  CitrTreeBean(String ID,int   TimeStam,int  Spec,int   Age)
	{
		this.ID=ID;
		this.TimeStam=TimeStam;
		this.Spec=Spec;
		this.Age=Age;
	}
	
	public  CitrTreeBean()  //无参构造
	{
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
	public int getSpec() {
		return Spec;
	}
	public void setSpec(int spec) {
		Spec = spec;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}

	public String getSoilProp() {
		return soilProp;
	}

	public void setSoilProp(String soilProp) {
		this.soilProp = soilProp;
	}
	
	
}
