
public class Student extends Person1 {
	
	private String schoolName;
	
	
	//子类调用父类的构造方法规则：
	//1.子类默认调用父类不带参数的构造方法。	
	//2.必须在构造函数的开始就调用父类的构造方法。
	public Student(String schoolName){		
		super("zhouqi");
		this.schoolName = schoolName;	

	}
	
	
	//重写：重新实现父类所提供的方法
	//条件：
	//1、方法名相同 2、返回值相同 3、参数列表相同 
	//（4、子类的访问修饰符要大于等于父类的访问修饰符
	//5、子类的异常要小于等于父类的异常）
	
	
	//重载：在同一个类中相同的方法有不同的实现
	//条件：
	//1、方法名字相同
	//2、参数列表不同
	//3、和返回值无关
	//4、和访问修饰符无关
	//5、和异常也无关
	
	public  String getInfo(){
		return "人员名字"+getName()+"学校名字"+schoolName;
	}
	
	public void callChild(){
		System.out.println("--------");
		System.out.println(super.getInfo());
		System.out.println(super.toString());
		System.out.println("--------");
	}
	
	public static void main(String[] args) {
		Student stu=new Student
	}

	
	
}
