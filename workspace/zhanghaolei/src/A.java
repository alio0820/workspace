
public  class A {
	private  int i=111;
	public void m1(){};
	public void m2(){
		System.out.println("A���ж����m2����");
	}

	class B extends A{
		private int i=100;

		@Override
		public void m1() {
			System.out.println("B���ж����m1����");
		}
		public void m2()
		{
			System.out.println(i);
			System.out.println(this.i);
			System.out.println(A.this.i);
		}
	}
}



