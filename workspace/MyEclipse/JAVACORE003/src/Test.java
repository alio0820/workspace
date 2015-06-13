
public class Test {
	
	public void doTest(Person1 p){
		System.out.println("11111");
		System.out.println(p.getInfo());
	}
	
	public void doTest(Student p){
		System.out.println("22222");
		p.callChild();
	}

	
	
	//成员变量 p1 是存放在堆里面的

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	//步骤：
	
	//在栈里面创建一个引用对象P
	//执行到关键字“new”的时候，在堆里面开辟一个内存空间
	//把Person类里面的成员变量赋初值
	//执行构造方法，运行构造方法里面定义的内柔
	//把堆的地址返回给P
		
		Test test = new Test();
		Student p = new Student("zhouqi");
		

		
		test.doTest(p);
		
		
	
	}

}
