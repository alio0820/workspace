package hadoop.mysql.table;
//����λ�ñ�Loca��Ӧ��javaBean
//һ���Բɼ�
public class LocaBean {
		private double  High;  //����
		private double  Dime; //ά��
		private double  Litu; //����
    	private String  ID;//�����ʾ
    	
    	
    	public LocaBean(double  High,double  Dime,double  Litu,String  ID){
    		this.High=High;
    		this.Dime=Dime;
    		this.Litu=Litu;
    		this.ID=ID;
    	}
    	
    	
		public LocaBean() {
			super();
		}


		public double getHigh() {
			return High;
		}
		public void setHigh(double high) {
			High = high;
		}
		public double getDime() {
			return Dime;
		}
		public void setDime(double dime) {
			Dime = dime;
		}
		public double getLitu() {
			return Litu;
		}
		public void setLitu(double litu) {
			Litu = litu;
		}
		public String getID() {
			return ID;
		}
		public void setID(String iD) {
			ID = iD;
		}
		

}
