import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
//  使用方法，新建的工程（不要包），在建名为app2的类，然后可以直接运行
public class Syso {
	public static void main(String[] args) throws IOException {
	System.out.println("请输入一行整数，并以一个或者多个空格（又或者英文的逗号）分隔开:");
	BufferedReader br=new BufferedReader(new InputStreamReader(System.in) )	;
	String line =  br.readLine();
		String str[] = line.split("\\s+|,");
		int ary[] = new int[str.length];
		int count = 0, sum = 0;
		double avg;

		for (int i = 0; i < str.length; i++) {
			ary[i] = Integer.parseInt(str[i]);
			sum += ary[i];
		}
		avg = sum / (str.length);
		System.out.println("总共输入" + str.length + "个整数");
		System.out.println("总和sum=" + sum);
		System.out.print("逆序输出所以整数");
		for (int i = str.length - 1; i >= 0; i--) {
			System.out.print(ary[i] + "  ,");
		}
		System.out.println();
		System.out.println("平均数avg=" + avg);

}
}