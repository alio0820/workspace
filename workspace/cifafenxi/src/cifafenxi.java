import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class cifafenxi {
    boolean kongge=false;
	String tmp="",input="",result="";
	public cifafenxi()	//构造函数     ~Analyzer();	//析构函数	  
	{
	}
	int  IsLetter(char ch) //判断是否是字母，是则返回 1，否则返回 0。
	{
		if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z'))
			return 1;
		return 0;
	}
	int  IsDigit(char ch) //判断是否为数字，是则返回 1，否则返回 0。
	{
		if(ch>='0'&&ch<='9')
			return 1;
		return 0;
	}
	int  IsOperator(char ch) //判断是否为算符,是则返回 1，否则返回 0。
	{
		if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='='||ch=='<'||ch=='>')
			return 1;
		return 0;
	}
	int IsDelimiter(char ch)//判断是否为界符，是则返回1，否则返回0.
	{
		if(ch=='('||ch==')'||ch=='['||ch==']'||ch=='{'||ch=='}'||ch=='"'||ch=="'".charAt(0)||ch==','||ch==';')
			return 1;
		return 0;
	}
	int IsKeywords(String  str) //判断是否为关键字，是则返回1，否则返回0.
	{
		if(str.equals("break")||str.equals("case")||str.equals("char")||str.equals("continue")||str.equals("do")||
				str.equals("default")||str.equals("if")||str.equals("else")||str.equals("float")||str.equals("long")||
				str.equals("int")||str.equals("return")||str.equals("short")||str.equals("switch")||str.equals("void")||
				str.equals("while")||str.equals("for"))
			return 1;
		return 0;
	}
	int IsIdentifiers(String str) //判断是否为标示符，是则返回1，否则返回0.
	{
		Pattern pattern = Pattern.compile("^[a-zA-Z|_]+[0-9|a-zA-Z|_]*$");
		Matcher matcher = pattern.matcher(str);
		if(matcher.find())
			return 1;
		return 0;
	}
	void input() throws IOException
	{
		System.out.println("请输入语句：");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		input=br.readLine();
		System.out.println("|-------------------------------|");
		System.out.println("|\t单词符号\t类型\t值\t|");
	}
	void  display()//输出一些程序结束字符显示样式
	{
		System.out.println("|-------------------------------|");
		System.out.println("词法分析结束");
	}
	int  analyzerSubFun()//词法分析器子程序，为了实现词法分析的主要功能。
	{
		for(int i=0;i<input.length();i++)
		{
			char inputI=input.charAt(i);
			if(IsLetter(inputI)==1||IsDigit(inputI)==1||inputI=='_')//如果是字母、数字或下划线，则添加到result中
			{
				result+=inputI;
				kongge=true;
			}
			if(i!=0&&((inputI==' '&&kongge)||IsOperator(inputI)==1||IsDelimiter(inputI)==1||IsOperator(input.charAt(i-1))==1||IsDelimiter(input.charAt(i-1))==1))
			//遇到空格且kongge为true或当前字符为算符界符，或前一个字符为算符界符，则按以下格式输出
			{
				if(IsOperator(input.charAt(i-1))!=1&&IsDelimiter(input.charAt(i-1))!=1)
				//如果前一个字符不为算符界符，有两种情况进入：1.当前字符为算符界符 或 2.当前字符为空格且kongge=true
				{
					if(input.charAt(i-1)==' ') //当前为算符，前一个为空格
					{
						result+=inputI;
						continue;
					}
					tmp=result.substring(result.lastIndexOf(" ")+1);	//根据空格截取子串(由于前一个已经加入result，故可从result中取出)
					int k=0;
					for(int j=0;j<tmp.length();j++)		//如果子串中包含算符界符，则去掉算符界符，取其后面的部分
					{
						char tmpI=tmp.charAt(j);
						if(IsOperator(tmpI)==1||IsDelimiter(tmpI)==1) k=j+1;
					}
					tmp=tmp.substring(k);
					//总共五种子串，关键字、标示符、算符、常数、界符，此处排除界符算符，只剩下 1.关键字 2.标示符 3.常数
					if(IsKeywords(tmp)==1)							//判断子串是否为关键字，是则输出
						System.out.println("|\t"+tmp+"\t关键字\t"+tmp+"\t|");
					else if(IsIdentifiers(tmp)==1)					//判断子串是否为标示符，是则输出
						System.out.println("|\t"+tmp+"\t标示符\t"+tmp+"\t|");
					else											//子串为常数，直接输出
						System.out.println("|\t"+tmp+"\t常数\t"+tmp+"\t|");
					kongge=false;
				}
				else			//前一个字符为算符界符，有两种情况进入 1.当前字符为算符界符  或   2.当前字符为空格
				{
					if(IsOperator(input.charAt(i-1))==1)
						System.out.println("|\t"+input.charAt(i-1)+"\t算符\t"+input.charAt(i-1)+"\t|");
					else 
						System.out.println("|\t"+input.charAt(i-1)+"\t界符\t"+input.charAt(i-1)+"\t|");
					if(IsOperator(inputI)!=1&&IsDelimiter(inputI)!=1||inputI==' ') continue;//如果当前字符不为算符界符或空格，则防止重复添加
				}
				result+=inputI;
			}
		}
		char res =result.charAt(result.length()-1);
		System.out.println("|\t"+res+"\t界符\t"+res+"\t|");//输出最后一个字符
		return 1;
	}
	String DecStrToBinStr(String decNum)//十进制转换成二进制
	{
		int shuzi = Integer.parseInt(decNum);
		String str = Integer.toBinaryString(shuzi);
		return str;
	}
	public static void main(String []args) throws IOException
	{
		cifafenxi cf =new cifafenxi();
		cf.input();
		cf.analyzerSubFun();
		cf.display();
	}
	//测试数据 for(int i=0;i<=b;i++) { if(_5a_3b++=100) c-=1;}
} 
