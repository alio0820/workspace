package Euclidean;

public class Euclidean
{
	private int a0;
	private int b0;	
	public int gcd(int a,int b)
	{
		this.a0=a;
		this.b0=b;
		int r=0;
		if(a<b) {r=a;a=b;b=r;}
		while(b!=0)
		{
			r=a%b;
			a=b;
			b=r;
		}
		return a;
	}
	public int[] ExtendGcd(int a,int b)
	{
		this.a0=a;
		this.b0=b;
		int r=0;
		if(a<b) {r=a;a=b;b=r;}
		if(b==0) 
		{
			int[] retu={a,1,0};
			return retu;
		}
		int x1=0,y1=1,x2=1,y2=0;
		while(b!=0)
		{
			int q =a/b;
			r=a-q*b;
		    int x=x2-q*x1;
		    int y=y2-q*y1;
		    a=b;
		    b=r;
		    x2=x1;y2=y1;x1=x;y1=y;
		}int[] retu={a,x2,y2};
		return retu;
	}
	public static void main(String[] args)
	{
		Euclidean ed =new Euclidean();
		int m=ed.gcd(136, 188);
		int[] n=ed.ExtendGcd(188, 136);
		System.out.println(ed.a0+"和"+ed.b0+"最大公约数为:"+m);
		System.out.println("满足等式ax+by=d的d,x,y分别为:("+n[0]+","+n[1]+","+n[2]+")");
	}
}
