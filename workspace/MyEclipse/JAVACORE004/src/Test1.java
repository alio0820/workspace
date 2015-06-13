class One{
	private int x;

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}
}

class Two{
	private One y;

	public One getY() {
		return y;
	}

	public void setY(One y) {
		this.y = y;
	}
}

public class Test1 {

	public static void main(String[] args) {
		One one=new One();
		Two two=new Two();
		int n=10;
		one.setX(n);
		two.setY(one);
		//≤Â»Î¥˙¬Î
		two.setY(one);one=new One();one.setX(100);
		System.out.println(two.getY().getX());

	}

}

//A:n=100;
//B:one.setX(100);
//C:two.getY().setX(100);
//D:one=new One();one.setX(100);
//E:two.setY(one);one=new One();one.setX(100);
//F:one=new One();one.setX(100);two.setY(one);
