

	public class Test{
		public static void main(String[] args) {
			A c1= new A();
			A.B c2=c1.new B();
			c2.m1();
			c2.m2();
		}
	}