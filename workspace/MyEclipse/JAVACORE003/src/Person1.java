
public class Person1{
	
	private String name;
	//���췽�����ص㣺1û�з���ֵ��2��������������ͬ
	//ϵͳ���Զ��Ķ���һ��û�в����Ĺ��췽��(ǰ�᣺û�ж����κεĹ��췽����ʱ��)
	//

	
	public Person1(String name){
		this.name = name;		
	}	
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public  String getInfo(){
		return "��Ա����="+name;
	}


	public String toString(String s) {
		return "parent";
	}
	
	

}
