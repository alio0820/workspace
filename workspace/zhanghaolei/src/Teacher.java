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
		Person p=new Teacher("teacher","����",35);
		System.out.println("���ְҵ�ǣ�"+p.work);
		System.out.println("��������ǣ�"+p.name);
		System.out.println("��������ǣ�"+p.age);
	}
	

}
