import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;


public class sushu {

	/**
	 * @param args
	 * @throws IOException
	 */
	public static void main(String[] args) throws IOException {
		// TODO Auto-generated method stub
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		System.out.println("���������֣�");
		int num = Integer.parseInt(bf.readLine());
		int j=1;
		for(int i=2;i<Math.sqrt(num);i++)
		{
			if(num%i==0)
				j=0;
		}
		if(j==0)
			System.out.println("������Ϊ����");
		else
			System.out.println("����Ϊ����");
	}

}
