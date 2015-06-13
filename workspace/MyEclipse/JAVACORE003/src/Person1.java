
public class Person1{
	
	private String name;
	//构造方法的特点：1没有返回值，2方法名和类名相同
	//系统会自动的定义一个没有参数的构造方法(前提：没有定义任何的构造方法的时候)
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
		return "人员名字="+name;
	}


	public String toString(String s) {
		return "parent";
	}
	
	

}
