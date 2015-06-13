import edu.zcd.pack.Person;

import edu.zcd.pack.*;


class Teacher extends Person {
    public  Teacher()
    {
    	super();
    }
	public Teacher(String work, String name, int age) {
		super(work, name, age);
		// TODO Auto-generated constructor stub
	}
	
	public void havaclass()
	{
		System.out.println("huhu");
	}
	public static void main(String[] args) {
		Person p=new Teacher("teacher","王芳",35);
		System.out.println("你的职业是："+p.work);
		System.out.println("你的名字是："+p.name);
		System.out.println("你的年龄是："+p.age);
	}
	

}
