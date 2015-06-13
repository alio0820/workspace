
public class Person {
	private String name;
	private String sex;
	private int age;
	private static int a=0;//类属性,所有的对象只有一个属性a
	public final int B;//final标记的成员变量必须且只能在声明或者构造方法中对他初始化
	public static final int NUM;//静态常量，全局的常量，只能在声明的时候或者静态代码块中对其进行初始化
	static {//静态代码块只在类加载的时候执行一次
		a=2;
		System.out.println("执行静态代码块");
		NUM=2;
	}
	public static void show(){//类的方法，无需创建对象即可用类名.方法名调用
		System.out.println("我是一个人！");
		//name="";//静态方法中不可以访问非静态变量
		//getName();//静态方法中不可以访问非静态方法
		//this.a=2;//静态方法中不能使用this或者super关键字
	}
	public String getName() {
		show();//非静态方法可以调用静态方法
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public Person(){
		a++;
		B=1;
	}
	public Person(String name,String sex,int age){
		this(name,sex);
		this.age=age;
	}
	public Person(String name,String sex){
		this.name=name;
		this.sex=sex;
		B=2;
	}
	public static void main(String[] args) {
		show();
		Person p1=new Person();
		Person p2=new Person();
		Person p3=new Person();
		Person p4=new Person();
		Person p5=new Person();
		System.out.println(a);
		System.out.println(p1.a);
		System.out.println(p2.a);
		System.out.println(Person.a);
	}
	public final void fun(){//这是对象的方法
		
	}
}

class Student extends Person{
	private String school;
//	public void fun(){//final标记的方法不能被重写
//		
//	}
	public Student(String name,String sex,int age,String school){
		super(name,sex,age);
		this.school=school;
		Person.show();
	}
	public void fun(Person p){
		System.out.println(p.B);
	}
}
