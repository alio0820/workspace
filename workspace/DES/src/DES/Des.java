package DES;
import DES.Key;
import java.util.ArrayList;
import java.util.List;

public class Des
{
	private int round=1;
	Key key = new Key(); // 获取key
	List<String> list = new ArrayList<String>();
	int[] m = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15 };
	int[][] IP_ = { 
			{ 40, 8, 48, 16, 56, 24, 64, 32 }, 
			{ 39, 7, 47, 15, 55, 23, 63, 31 }, 
			{ 38, 6, 46, 14, 54, 22, 62, 30 }, 
			{ 37, 5, 45, 13, 53, 21, 61, 29 }, 
			{ 36, 4, 44, 12, 52, 20, 60, 28 },
			{ 35, 3, 43, 11, 51, 19, 59, 27 }, 
			{ 34, 3, 43, 11, 51, 19, 59, 27 }, 
			{ 34, 2, 42, 10, 50, 18, 58, 26 }, 
			{ 33, 1, 41, 9, 49, 17, 57, 25 } 
			};
	public static void main(String[] args)
	{
		Des d = new Des();
		d.cal(d.round);
//		d.cal(d.round);
	}

	public void cal(int round)
	{
		this.round=round;

		int[][] IP = { 
				{ 58, 50, 42, 34, 26, 18, 10, 2 }, 
				{ 60, 52, 44, 36, 28, 20, 12, 4 }, 
				{ 62, 54, 46, 38, 30, 22, 14, 6 }, 
				{ 64, 56, 48, 40, 32, 24, 16, 8 }, 
				{ 57, 49, 41, 33, 25, 17, 9, 1 }, 
				{ 59, 51, 43, 35, 27, 19, 11, 3 },
				{ 61, 53, 45, 37, 29, 21, 13, 5 }, 
				{ 63, 55, 47, 39, 31, 23, 15, 7 } 
				};


		int[][] E = { 
				{ 32, 1, 2, 3, 4, 5 }, { 4, 5, 6, 7, 8, 9 }, 
				{ 8, 9, 10, 11, 12, 13 }, { 12, 13, 14, 15, 16, 17 }, 
				{ 16, 17, 18, 19, 20, 21 }, { 20, 21, 22, 23, 24, 25 }, 
				{ 24, 25, 26, 27, 28, 29 }, { 28, 29, 30, 31, 32, 1 }
				};

		int[][] P = { { 16, 7, 20, 21 }, { 29, 12, 28, 17 }, 
				{ 1, 15, 23, 26 }, { 5, 18, 31, 10 }, 
				{ 2, 8, 24, 14 }, { 32, 27, 3, 9 }, 
				{ 19, 13, 30, 6 }, { 22, 11, 4, 25 } 
				};

		int S[][][] = { 
				{ 
					{ 14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7 },
					{ 0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8 }, 
					{ 4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0 }, 
					{ 15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13 } 
				}, 
				{ 
					{ 15, 1, 8, 14, 6, 11, 3, 4, 9, 7, 2, 13, 12, 0, 5, 10 }, 
					{ 3, 13, 4, 7, 15, 2, 8, 14, 12, 0, 1, 10, 6, 9, 11, 5 }, 
					{ 0, 14, 7, 11, 10, 4, 13, 1, 5, 8, 12, 6, 9, 3, 2, 15 },
					{ 13, 8, 10, 1, 3, 15, 4, 2, 11, 6, 7, 12, 0, 5, 14, 9 } 
				}, 
				{ 
					{ 10, 0, 9, 14, 6, 3, 15, 5, 1, 13, 12, 7, 11, 4, 2, 8 },
					{ 13, 7, 0, 9, 3, 4, 6, 10, 2, 8, 5, 14, 12, 11, 15, 1 }, 
					{ 13, 6, 4, 9, 8, 15, 3, 0, 11, 1, 2, 12, 5, 10, 14, 7 }, 
					{ 1, 10, 13, 0, 6, 9, 8, 7, 4, 15, 14, 3, 11, 5, 2, 12 } 
				},
				{ 
					{ 7, 13, 14, 3, 0, 6, 9, 10, 1, 2, 8, 5, 11, 15, 4, 15 }, 
					{ 13, 8, 11, 5, 6, 15, 0, 3, 4, 7, 2, 12, 1, 10, 14, 9 }, 
					{ 10, 6, 9, 0, 12, 11, 7, 13, 15, 1, 3, 14, 5, 2, 8, 4 }, 
					{ 3, 15, 0, 6, 10, 1, 13, 8, 9, 4, 5, 11, 12, 7, 2, 14 } 
				}, 
				{ 
					{ 2, 12, 4, 1, 7, 10, 11, 6, 8, 5, 3, 15, 13, 0, 14, 9 },
					{ 14, 11, 2, 12, 4, 7, 13, 1, 5, 0, 15, 10, 3, 9, 8, 6 }, 
					{ 4, 2, 1, 11, 10, 13, 7, 8, 15, 9, 12, 5, 6, 3, 0, 14 },
					{ 11, 8, 12, 7, 1, 14, 2, 13, 6, 15, 0, 9, 10, 4, 5, 3 } 
				}, 
				{ 
					{ 12, 1, 10, 15, 9, 2, 6, 8, 0, 13, 3, 4, 14, 7, 5, 11 }, 
					{ 10, 15, 4, 2, 7, 12, 9, 5, 6, 1, 13, 14, 0, 11, 3, 8 }, 
					{ 9, 14, 15, 5, 2, 8, 12, 3, 7, 0, 4, 10, 1, 13, 11, 6 }, 
					{ 4, 3, 2, 12, 9, 5, 15, 10, 11, 14, 1, 7, 6, 0, 8, 13 }
				},
				{ 
					{ 4, 11, 2, 14, 15, 0, 8, 13, 3, 12, 9, 7, 5, 10, 6, 1 },
					{ 13, 0, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2 }, 
					{ 1, 4, 11, 13, 12, 3, 7, 14, 10, 15, 6, 8, 0, 5, 9, 2 }, 
					{ 6, 11, 13, 8, 1, 4, 10, 7, 9, 5, 0, 15, 14, 2, 3, 12 }
				}, 
				{ 
					{ 13, 2, 8, 4, 6, 15, 11, 1, 10, 9, 3, 14, 5, 0, 12, 7 },
					{ 1, 15, 13, 8, 10, 3, 7, 4, 12, 5, 6, 11, 0, 14, 9, 2 }, // 这行有数字输错，正确的为7
					{ 7, 11, 4, 1, 9, 12, 14, 2, 0, 6, 10, 13, 15, 3, 5, 8 },
					{ 2, 1, 14, 7, 4, 10, 8, 13, 15, 12, 9, 0, 3, 5, 6, 11 }
				} 
			};
		String ss = new String();
		String L[] = new String[32];
		String R[] = new String[32];

		String s1 = new String();
		String s = new String();
		String str = new String();
		String PC[] = new String[17];
		
		List<String> list1 = new ArrayList<String>();
		//if(list1==null)
		if(round==1)
		   this.list = key.Key();
		for(int i=15;i>=0;i--)
		{
			list1.add(list.get(i));
		}

		for (int i = 0; i < 16; i++)
		{
			s = Integer.toBinaryString(m[i]);// 将十进制数转换成二进制数
			if (s.length() == 1)
			{
				s = "000" + s;
			} else if (s.length() == 2)
			{
				s = "00" + s;
			} else if (s.length() == 3)
			{
				s = "0" + s;
			}
			ss += s;
		}
		if(round==1)
        {
		System.out.print("明文的二进制为：");
		for (int i = 0; i < 64; i++)
		{
			System.out.print(ss.charAt(i));
			if ((i + 1) % 4 == 0 && i < 63)
				System.out.print(" ");
			if (i == 63)
				System.out.println();
		}
        }
		for (int i = 0; i < 8; i++)
		{ // 与IP置换
			for (int j = 0; j < 8; j++)
			{
				if (IP[i][j] < 64)
				{
					s1 += ss.substring(IP[i][j] - 1, IP[i][j]); // substring(int beginIndex,int endIndex)返回一个新字符串，它是此字符串的一个子字符串。beginIndex -起始索引（包括）。从0开始endIndex - 结束索引（不包括）。
				} else
					s1 += ss.substring(IP[i][j] - 1); // 字符串截取,substring(int beginIndex) 返回一个新的字符串，它是此字符串的一个子字符串。
			}
		}
		// System.out.println(s1);
		if(round==1)
        {
		L[0] = s1.substring(0, 32); // 计算R0,L0
		R[0] = s1.substring(32);
        }
		// System.out.println(R[0]);
		// System.out.println(L[0]);

		for (int n = 1; n <= 16; n++)
		{
			R[n] = "";
			String B = new String();
			String BB[] = new String[9];
			String s2 = new String();
			String s3 = new String();
			String s4 = new String(); // p(c)
			String X1_ = new String();

			String CC = new String();

			L[n] = R[n - 1];
			// System.out.println(L[n].length());
			for (int i = 0; i < 8; i++)
			{ // 计算X1*
				for (int j = 0; j < 6; j++)
				{
					if (E[i][j] < 32)
					{
						X1_ += R[n - 1].substring(E[i][j] - 1, E[i][j]);
					} else
						X1_ += R[n - 1].substring(E[i][j] - 1);// 注意31
				}
			}
			// System.out.println(X1_);

			for (int i = 0; i < 48; i++)
			{
				if (i < 47)
				{
					// System.out.println(list.get(n-1));
					if (list.get(n - 1).substring(i, i + 1).equals(X1_.substring(i, i + 1)))
					{

						B += "0"; // 异或操作 这里注意要用equuals，如果用==，则永远都去执行else
					} else
					{
						B += "1";
					}
				} else
				{
					if (list.get(n - 1).substring(i).equals(X1_.substring(i)))
					{
						B += "0"; // 异或操作,解决最后一位的数组越界问题
					} else
					{
						B += "1";
					}
				}

			}
			// System.out.println(B);
			for (int i = 0; i < 8; i++)
			{
				// System.out.println(B.length());

				BB[i + 1] = B.substring(i * 6, 6 * (i + 1)); // 分离B生成B1---B8
				
			}

			int p = 0, q = 0;
			for (int i = 0; i < 8; i++)
			{
				String[] C = new String[8];
				s2 = BB[i + 1].substring(0, 1) + BB[i + 1].substring(5); // b1b6
				s3 = BB[i + 1].substring(1, 5); // b2b3b4b5
				// System.out.println(s2);
				// System.out.println(s3);

				int pp = Integer.parseInt(s2);
				p = pp / 10 * 2 + pp % 10; // 行
				// System.out.println(p);
				int qq = Integer.parseInt(s3);
				q = (qq / 1000) * 2 * 2 * 2 + ((qq % 1000) / 100) * (2 * 2) + ((qq % 100) / 10) * 2 + qq % 10; // 列
				// System.out.println(q);
				C[i] = Integer.toBinaryString(S[i][p][q]);

				if (C[i].length() == 1)
				{
					C[i] = "000" + C[i];
				} else if (C[i].length() == 2)
				{
					C[i] = "00" + C[i];
				} else if (C[i].length() == 3)
				{
					C[i] = "0" + C[i];
				}

				// System.out.println(C[i]);
				CC += C[i]; // CC表示的第一轮的字符串C的值
				// System.out.println(C[i]);
			}
			// System.out.println(CC);
			// 与P置换，产生第一个P(C)
			for (int x = 0; x < 8; x++)
			{
				for (int y = 0; y < 4; y++)
				{
					if (P[x][y] != 32)
					{
						s4 += CC.substring(P[x][y] - 1, P[x][y]);
					} else
						s4 += CC.substring(P[x][y] - 1); // p(c)
				}
			}
			PC[n] = s4;
			// CC与L[i-1]异或为R[i]的值
			// for(int i=0;i<32;i++)
			// {
			// System.out.print(PC[n].charAt(i));
			// if((i+1)%4==0&&i<31) System.out.print(" ");
			// if(i==31) System.out.println();
			// }

			for (int z = 0; z < 32; z++)
			{
				if (z != 31)
				{

					if (L[n - 1].substring(z, z + 1).equals(PC[n].substring(z, z + 1)))
					{
						R[n] += "0"; // 异或操作
					} else
					{
						R[n] += "1";
					}
				} else
				{
					if (L[n - 1].substring(z).equals(PC[n].substring(z)))
					{
						R[n] += "0"; // 异或操作,解决最后一位的数组越界问题
					} else
					{
						R[n] += "1";
					}
				}
			}

//			System.out.println("L"+n+":"+L[n]);
			if(round==1)
			System.out.println("R"+n+":"+R[n]);			 
		}
		
		for (int i = 0; i < 8; i++)
		{
			for (int j = 0; j < 8; j++)
			{
				if (IP_[i][j] != 64)
				{
					str += (L[16] + R[16]).substring(IP_[i][j] - 1, IP_[i][j]);
				} else
					str += (L[16] + R[16]).substring(IP_[i][j] - 1); // p(c)
			}
		}
		for(int i=0;i<8;i++)
		{
			for(int j=0;j<8;j++)
			{
			    IP_[i][j]=Integer.parseInt((R[16] + L[16]).substring(j*8, j*8+3));
			}
			//byte[] mm=(R[16]+L[16]).getBytes();直接将字符串转换为byte数组
			//String[] mm=(R[16]+L[16]).split(",");分割字符串为数组
		}
		list=list1;                                   //将密钥初始化，方便求出明文
		for(int i=0;i<64;i=i+4)                       //将密文作为初始化，方便求出明文
		{
			m[i/4]=Integer.parseInt(str.substring(i, i+4));
		}
		
		for (int i = 0; i < 64; i++)
		{
			if (i == 0&&round==1)
				System.out.print("密文的二进制为：");
			if (i == 0&&round==2)
				System.out.print("明文的二进制为：");
			System.out.print(str.charAt(i));
			if ((i + 1) % 4 == 0 && i < 63)
				System.out.print(" ");
			if (i == 63)
				System.out.println();
		}
		round++;
	}
}
