package com.zuxia.bufferedReader;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.InputStreamReader;
import java.io.PrintWriter;
public class MyBufferedReader {
	public static void main(String[] args)throws Exception{
		//键盘输入
/*		BufferedReader br1 = new BufferedReader(new InputStreamReader(System.in));		
		String s;
		try {
			System.out.println("请输入字符：");
			s = br1.readLine();
			System.out.println(s);
			br1.close();
		} catch (Exception e) {
		}*/
		//文件读取
		BufferedReader br2  = new BufferedReader(new FileReader("E:/zcd_java/0711/笔记.txt"));
		String data= br2.readLine();
		while(data!=null){
			System.out.println(data);
			data  = br2.readLine();
		}
		br2.close();
		//文件写入
/*		PrintWriter pw  =new PrintWriter("d:zhai.txt");
		pw.write("hello world");
		pw.println("nihao!");
		pw.println("很好！");
		pw.flush();
		pw.close();*/
		//边读边写入
/*		BufferedReader br2  = new BufferedReader(new FileReader("E:/zcd_java/0711/笔记.txt"));
		PrintWriter pw2  =new PrintWriter("d:zhai.txt");
		String data2 = br2.readLine();
		while(data2!=null){
			pw2.println(data2);
			data2= br2.readLine();
		}
		pw2.flush();
		pw2.close();*/
		
	}
}
