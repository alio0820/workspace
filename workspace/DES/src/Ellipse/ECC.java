package Ellipse;

import java.util.Scanner;

public class ECC
{// Elliptic Curve Cypher椭圆曲线密码
	private int a = 1;
	private int b = 6;
	private int f = 11;
	private int x, y, x1, y1, x2, y2;

	public ECC()
	{
	}

	public ECC(int a, int b, int f, int x1, int y1)
	{
		this.a = a;
		this.b = b;
		this.f = f;
		this.x1 = x1;
		this.y1 = y1;
	}

	public ECC(int a, int b, int f, int x1, int y1, int x2, int y2)
	{
		this.a = a;
		this.b = b;
		this.f = f;
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
	}

	public void YiGeDian() // 计算一个点
	{
		if (x1 == 0 && y1 == 0)
		{
			System.out.print("请输入仿射坐标系椭圆曲线：y^2=x^3+ax+b");
			Scanner scanner = new Scanner(System.in);
			System.out.print("请输入a=");
			a = scanner.nextInt();
			System.out.print("请输入b=");
			b = scanner.nextInt();
			System.out.print("请输入f=");
			f = scanner.nextInt();
			System.out.print("请输入坐标点p:\nx=");
			x1 = scanner.nextInt();
			System.out.print("y=");
			y1 = scanner.nextInt();
		}
		x = x1;
		System.out.println("您输入的仿射坐标系椭圆曲线：y^2=x^3+" + a + "x+" + b + "  f=" + f
				+ "  坐标点p(" + x1 + "," + y1 + ")");
		int y0 = x1 * x1 * x1 + a * x1 + b;
		int y2 = y0 % f;
		for (int i = 1; i < f; i++)
		{
			if (i == y1)
				continue;
			if (i * i % f == y2)
			{
				y = i;
				break;
			}
		}
		System.out.println("您输入的p(" + x1 + "," + y1 + ")===>p(" + x + "," + y
				+ ")");
	}

	public int[] QiuHe(int x1, int y1, int x2, int y2)     // 计算P和Q的和
	{
		int r;
		this.x1 = x1;
		this.y1 = y1;
		this.x2 = x2;
		this.y2 = y2;
		if (x1 == 0 && y1 == 0 && x2 == 0 && y2 == 0)
		{
			System.out.print("请输入仿射坐标系椭圆曲线：y^2=x^3+ax+b");
			Scanner scanner = new Scanner(System.in);
			System.out.print("请输入a=");
			a = scanner.nextInt();
			System.out.print("请输入b=");
			b = scanner.nextInt();
			System.out.print("请输入f=");
			f = scanner.nextInt();
			System.out.println("请输入点p:");
			System.out.print("x=");
			x1 = scanner.nextInt();
			System.out.print("y=");
			y1 = scanner.nextInt();
			System.out.println("请输入点Q:");
			System.out.println("x=");
			x2 = scanner.nextInt();
			System.out.println("y=");
			y2 = scanner.nextInt();
		}
		if (y2 != -y1 || x2 != x1)
		{
			if (x1 != x2) // 计算r
			{
				int m = y2 - y1, n = x2 - x1;
				if (m < 0)
					m += f;
				if (n < 0)
					n += f;
				for (int i = 1; i < f; i++)
				{
					if (i * n % f == 1)
					{
						n = i;
						break;
					}
				}
				r = m * n % f;
			}
			else
			{
				int m = 3 * x1 * x1 + a, n = 2 * y1;
				if (m > f)
					m = m % f;
				if (n > f)
					n = n % f;
				for (int i = 1; i < f; i++)
				{
					if (i * n % f == 1)
					{
						n = i;
						break;
					}
				}
				r = m * n % f;
			}
			x = r * r - x1 - x2; // 计算x3
			while (x < 0)
			{
				x += f;
			}
			if (x > f)
				x = x % f;
			y = r * (x1 - x) - y1; // 计算y3
			while (y < 0)
			{
				y += f;
			}
			if (y > f)
				y = y % f;
			System.out.println("您输入的p(" + x1 + "," + y1 + ")+Q(" + x2 + ","
					+ y2 + ")=(" + x + "," + y + ")");
			
		}
		else
			System.out.println("您输入的p(" + x1 + "," + y1 + ")+Q(" + x2 + ","
					+ y2 + ")=无穷远点");
		int[] retu ={x,y};
		return retu;
	}
	public void YunSuan()
	{
		System.out.println("已知明文m<F11,公钥A(Q,P,G),给出m,随机产生私钥a以及r,计算Q=a*p及(c1,c2)");
		int m=9;
		int a0=2;
		int r=3;
		int x0,y0,xq,yq,xc,yc,xc2,yc2;
		int a1=a0,r1=r;
		x0=x1;y0=y1;
		xq=x1;yq=y1;
	    xc=x1;yc=y1;
	    xc2=x1;yc2=y1;
		while(a1>1)                    //计算Q(xq,yq)
		{
			int[] retu=QiuHe(xq,yq,x0,y0);
			xq=retu[0];
			yq=retu[1];
			a1--;
		}
		while(r1>1)                    //计算c1(xc,yc)
		{
			int[] retu=QiuHe(xc,yc,x0,y0);
			xc=retu[0];
			yc=retu[1];
			r1--;
		}
		r1=a0*r;
		while(r1>1)                    //计算(x2,y2)
		{
			int[] retu=QiuHe(xc2,yc2,x0,y0);
			xc2=retu[0];
			yc2=retu[1];
			r1--;
		}
		int c2=m*xc2%f;
		System.out.println("Q(xq,yq)=("+xq+","+yq+")");
		System.out.println("密文(c1,c2)=("+xc+","+yc+","+c2+")");
		System.out.println("怎么算回去呢？");
	}

	public static void main(String[] args)
	{
		ECC ecc = new ECC(1, 6, 11,2,7,2,7);
//		ecc.YiGeDian();
//		ecc.QiuHe(2,7,2,7);
		ecc.YunSuan();
	}
	

}
