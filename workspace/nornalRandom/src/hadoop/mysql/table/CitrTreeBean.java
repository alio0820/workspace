package hadoop.mysql.table;
//��������CitrTress��Ӧ��JavaBean
//һ���Բɼ�
public class CitrTreeBean {
	private  String ID;			 			//�����ʶ
	private  long   TimeStam; 				//ʱ���
	private  int   Spec;  					//��ľƷ��
	private  int   Age; 					//����
	private	 String  soilProp;				//��������
	
	public  CitrTreeBean(String ID,int   TimeStam,int  Spec,int   Age)
	{
		this.ID=ID;
		this.TimeStam=TimeStam;
		this.Spec=Spec;
		this.Age=Age;
	}
	
	public  CitrTreeBean()  //�޲ι���
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
