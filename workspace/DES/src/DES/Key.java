package DES;
import java.util.ArrayList;
import java.util.List;

public class Key {

	public List<String> Key() {

		List<String> list=new ArrayList<String>();
		
		int k[] = { 1, 3, 3, 4, 5, 7, 7, 9, 9, 11, 11, 12, 13, 15, 15, 1 };

		int LS[] = { 1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1 };

		int PC_1[][] = { { 57, 49, 41, 33, 25, 17, 9 },
				{ 1, 58, 50, 42, 34, 26, 18 }, { 10, 2, 59, 51, 43, 35, 27 },
				{ 19, 11, 3, 60, 52, 44, 36 }, { 63, 55, 47, 39, 31, 23, 15 },
				{ 7, 62, 54, 46, 38, 30, 22 }, { 14, 6, 61, 53, 45, 37, 29 },
				{ 21, 13, 5, 28, 20, 12, 4 } };
		
		int PC_2[][] = { { 14, 17, 11, 24, 1, 5 }, { 3, 28, 15, 6, 21, 10 },
				{ 23, 19, 12, 4, 26, 8 }, { 16, 7, 27, 20, 13, 2 },
				{ 41, 52, 31, 37, 47, 55 }, { 30, 40, 51, 45, 33, 48 },
				{ 44, 49, 39, 56, 34, 53 }, { 46, 42, 50, 36, 29, 32 } };
		
		String sy1 = new String();
		String sy2 = new String();
		String sx1 =  new String();
		String sx2 =  new String();
		String c[] =new String[32];
		String d[] = new String[32];
		for (int i = 0; i < k.length; i++) {
			
			// 不足4位的前边补0
			String s = Integer.toBinaryString(k[i]);
			if (s.length() == 1) {
				s = "000" + s;
			} else if (s.length() == 2) {
				s = "00" + s;
			} else if (s.length() == 3) {
				s = "0" + s;
			}
			sy1 += s;
		}
		//输出密钥的二进制为：
		System.out.print("密钥的二进制为：");
		for(int i=0;i<64;i++)
		{
			System.out.print(sy1.charAt(i));
			if((i+1)%4==0&&i<63) System.out.print(" ");
			if(i==63) System.out.println();
		}
		/*
		 * 与pc-1置换
		 */
		for (int i = 0; i < 8; i++) {
			for (int j = 0; j <7; j++) {
				
				if(PC_1[i][j]<64){
					sx1+= sy1.substring(PC_1[i][j]-1, PC_1[i][j] );
					}
					else 
					sx1+=sy1.substring(PC_1[i][j]-1);
			}
		}
		c[0] = sx1.substring(0, 28); 
		d[0] = sx1.substring(28);
	
		for (int n = 1; n <=16; n++) 
		{	
			String ss1 = new String();
			String ss2 = new String();
			String s1 =  new String();
			String s2 =  new String();
			
			int m = LS[n-1]; // 循环移位数
			
			c[n] = c[n-1].substring(m)+c[n-1].substring(0,m);        //循环移位
			d[n] = d[n-1].substring(m)+d[n-1].substring(0,m);
			
			//System.out.println(c[n]);
		   // System.out.println(c[n].length());
			
			ss2=c[n]+d[n];
			
			/*
			 * 与PC_2置换
			 */
			for (int i = 0; i < 8; i++) {
				for (int j = 0; j < 6; j++) {
					if(PC_2[i][j]<56){
					s2 += ss2.substring(PC_2[i][j]-1, PC_2[i][j]);
					}
					else 
					s2+=ss2.substring(PC_2[i][j]-1);
				}
			}
			list.add(s2);
          // System.out.println(s2);
		}
		return list;
		
	}

	public static void main(String[] args) {
		List<String> list=new ArrayList<String>();
		Key m = new Key();
		list=m.Key();
		for(int i=0;i<list.size();i++)
		{
			int num=i+1;
			System.out.print("K"+num+"=");
			for(int j=0;j<48;j++)
			{
				 
			     System.out.print(list.get(i).charAt(j));
			     if((j+1)%4==0&&j<48) System.out.print(" ");
			     if(j==47) System.out.println();
			}
		}
	}
}