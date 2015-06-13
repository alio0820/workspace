package jingtai;


public class Ex extends Use{
 int i=200;

static{
	int i=400;
	System.out.println(i);
}
	public static void main(String[] args) {
		Ex p=new Ex();
		System.out.println(p.i);
		

	}

}
