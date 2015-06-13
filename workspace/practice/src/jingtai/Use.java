package jingtai;

public class Use {
	/*
	 * 有继承时，
	 * 1、有static代码块，先执行父类的static代码块，再执行子类的static代码块，
	 * 如果父类没有static代码块，则最先执行的是子类的static代码块
	 * 总之是当类装载的时候就执行static代码块
	 * 2、如果有{}代码块，则执行父类代码块的内容，然后调用父类的成员变量和构造器，然后是子类的代码块、成员变量和构造器
	 *
	 */
	int i=100;
	Use(){
	
		System.out.println(i);
	}
	{
		int i=300;
		System.out.println(i);
	}
	
}

