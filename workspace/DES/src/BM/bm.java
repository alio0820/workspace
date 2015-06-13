package BM;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Scanner;

public class bm
{  
	private int up = 7;
	public void bmsuanfa() throws IOException
	{
		int[] a=input();
		//int[] a = { 0, 0, 1, 1, 1, 0, 1 };
		String[][] f = new String[up +1][up +1];
		int[] l = new int[up+1];
		int[] d = new int[up];
		int[] c = new int[up+1];
		c[0] = 1;
		l[0] = 0;
		d[0] = 1 * a[0];
		for (int i = 0; i <= up; i++) // 初始化f
		{
			for (int j = 0; j <= up; j++)
				f[i][j] = "0";
			f[0][0] = "1";
		}

		for (int n = 0; n < up; n++)
		{
			for (int j = 0; j <= n; j++)
				// 求d[n]
				d[n] += c[j] * a[n - j];
			d[n] = d[n] % 2;

			if (d[n] == 0) // 求l[n+1]和f[n+1]
			{
				f[n + 1] = f[n];
				c[n + 1] = Integer.parseInt(f[n + 1][n + 1]);
				l[n + 1] = l[n];
			}
			if (d[n] == 1)
			{
				int total = 0, m = 0;
				for (int j = 0; j <= n; j++)
				{
					if (l[j] == 0)
						total++;
				}
				if (total == n + 1) // d[n]=1时的第一种情况
				{
					int f_num = (Integer.parseInt(f[n + 1][0]) + 1);
					f[n + 1][0] = "" + f_num;
					c[0] = Integer.parseInt(f[n + 1][0]);
					f_num = (Integer.parseInt(f[n + 1][n + 1]) + 1);
					f[n + 1][n + 1] = "" + f_num;
					c[n + 1] = Integer.parseInt(f[n + 1][n + 1]);
					l[n + 1] = n + 1;
				} else
				{

					for (int j = 0; j <= n; j++) // d[n]=1时的第二种情况
					{
						if (l[j] < l[j + 1])
						{
							total = 0;
							m = 0;
							if (j + 1 == n) // 前一个小于它
							{
								m = j; // 记录m
								f[n + 1] = fh(f[n], fc(n - m, f[m]));
								for (int cc = 0; cc <= n + 1; cc++)
								{
									c[cc] = Integer.parseInt(f[n + 1][cc]);
								}
								l[n + 1] = l[n] > (n + 1 - l[n]) ? l[n]: (n + 1 - l[n]);
							} else
							// 其他的情况
							{
								for (int k = j + 2; k <=n; k++)
								{
									if (l[j + 1] == l[k])
										total++;
								}
								if (total == n - j - 1)
								{
									m = j; // 记录m
									f[n + 1] = fh(f[n], fc(n - m, f[n]));
									for (int cc = 0; cc <= n + 1; cc++)
									{
										c[cc] = Integer.parseInt(f[n + 1][cc]);
									}
									l[n + 1] = l[n] > (n + 1 - l[n]) ? l[n]
											: (n + 1 - l[n]);
								}
							}
						}
					}
				}
			}
		}
		String[] fx= new String[up+1];
		//System.out.println("f(x)=");
		for(int i=0;i<=up;i++)
		{
			fx[i]="f"+i+"(x)=1";
		    for (int j = 1; j < f[i].length; j++)
		    {
		    	 
			     if(f[i][j].equals("1"))              //为什么这个时候又要用equals呢
				    fx[i]=fx[i]+"+x"+j;
		    }		    
		}
		for(int i=0;i<up;i++)
			System.out.println(fx[i]+" l"+i+"="+l[i]+" d"+i+"="+d[i]);
		System.out.println(fx[up]+" l"+up+"="+l[up]);
		fx[up]="("+fx[up].substring(fx[up].indexOf("=")+1)+","+l[up]+")";
		System.out.println("产生给定"+up+"长二元序列a的最短的线性移位寄存器为:"+fx[up]);
	}
    
	public String[] fh(String[] ff1, String[] ff2) // f 的求和
	{		
		for (int i = ff1.length - 1; i >=0 ; i--) // 字符串长度是ff1.length()，数组的长度是length
		{
			int fff_num = Integer.parseInt(ff1[i]) + Integer.parseInt(ff2[i]);
			if(fff_num%2==0&&fff_num!=0)
			{
				ff1[i+1]="1";
				ff1[i]="0";
			}
			else
			    ff1[i] = "" + fff_num;
		}
		return ff1;
	}

	public String[] fc(int mm, String[] ff1)    //f的求乘
	{
		for (int i = ff1.length-1; i >=0; i--)// 所有对象引用类型变量默认初始值为null，即不指向任何对象
		{
			if (!ff1[i].equals("0"))                                                        //为什么这个时候又不用equals呢
			{                                 // 所以没有初始化的数组引用在自动化初始化后其值是null
				int fff_num;
				fff_num = Integer.parseInt(ff1[i]) + mm;
				if(fff_num%2==0)
				{
					ff1[i+1]="1";
					ff1[i]="0";
				}
				else
				    ff1[i] = "" + fff_num;
			}
		}
		return ff1;
	}
    public int[] input()
    {
    	String str;
    	System.out.print("请输入序列a的值：");    //打印函数只能写在方法里
		Scanner in =new Scanner(System.in);
		str=in.next(); 
		up=str.length();
		int[] a =new int[up];
		//BufferedReader br2 =new BufferedReader(new InputStreamReader(System.in));
		//Scanner in2 =new Scanner(System.in);   //应该重新定义个，否则前面的输入可能会对后面的输入产生错误的影响
		for(int i=0;i<up;i++)
		{
			a[i]= Integer.parseInt(str.substring(i, i+1));
		}
		System.out.print("您输入的序列a为：");
		for(int i=0;i<up;i++)
		{
			System.out.print(a[i]);
		}
	    System.out.println();
	    return a;
    }
	public static void main(String[] args) throws IOException
	{
		bm bm1 = new bm();
		bm1.bmsuanfa();
		// String[] a=new String[4]; //数组定义输入数字多少，即数组长度为多少
		// System.out.println(a[3]); //默认为null
		// System.out.println(Integer.parseInt(a[3]));//null值的强制转换为int就会出错
	}
   
	                
}
