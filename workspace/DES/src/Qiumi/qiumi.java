package Qiumi;

import java.util.Scanner;

public class qiumi
{
	public void YunSuan()
	{
		int[] a=input();
		int x= a[0];
		String e=Integer.toBinaryString(a[1]);  //十进制转换为二进制
		int n= a[2];
		int z=1;
		for(int i=0;i<=e.length()-1;i++)
		{
			z=(z*z)%n;
			char ei = e.charAt(i);
			String str =String.valueOf(ei);     //String类提供的其他类型数据转换为String的方法
			if(str.equals("1")) z=(z*x)%n;
		}
		System.out.println(x+"的"+a[1]+"次幂mod"+n+"="+z);
		System.out.println("直接计算"+x+"的"+a[1]+"次幂mod"+n+"="+(int)(Math.pow(x, a[1])%n));
	}
	public int[] input()
	{
		int[] a =new int[3];
		Scanner scanner =new Scanner(System.in);
		System.out.print("请输入一个整数x：");
		int x=scanner.nextInt();
		System.out.print("请输入求幂指数e:");
		int e=scanner.nextInt();
		System.out.print("请输入求模整数n:");
		int n=scanner.nextInt();
		a[0]=x;
		a[1]=e;
		a[2]=n;
		return a;
	}
	public static void main(String[] args)
	{
		qiumi qiumi =new qiumi();
		qiumi.YunSuan();
		
	}
}
