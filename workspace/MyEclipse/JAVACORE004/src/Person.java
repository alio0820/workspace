
public class Person {
	private String name;
	private String sex;
	private int age;
	private static int a=0;//������,���еĶ���ֻ��һ������a
	public final int B;//final��ǵĳ�Ա����������ֻ�����������߹��췽���ж�����ʼ��
	public static final int NUM;//��̬������ȫ�ֵĳ�����ֻ����������ʱ����߾�̬������ж�����г�ʼ��
	static {//��̬�����ֻ������ص�ʱ��ִ��һ��
		a=2;
		System.out.println("ִ�о�̬�����");
		NUM=2;
	}
	public static void show(){//��ķ��������贴�����󼴿�������.����������
		System.out.println("����һ���ˣ�");
		//name="";//��̬�����в����Է��ʷǾ�̬����
		//getName();//��̬�����в����Է��ʷǾ�̬����
		//this.a=2;//��̬�����в���ʹ��this����super�ؼ���
	}
	public String getName() {
		show();//�Ǿ�̬�������Ե��þ�̬����
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
	public final void fun(){//���Ƕ���ķ���
		
	}
}

class Student extends Person{
	private String school;
//	public void fun(){//final��ǵķ������ܱ���д
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
