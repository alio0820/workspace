import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class cifafenxi {
    boolean kongge=false;
	String tmp="",input="",result="";
	public cifafenxi()	//���캯��     ~Analyzer();	//��������	  
	{
	}
	int  IsLetter(char ch) //�ж��Ƿ�����ĸ�����򷵻� 1�����򷵻� 0��
	{
		if((ch>='a'&&ch<='z')||(ch>='A'&&ch<='Z'))
			return 1;
		return 0;
	}
	int  IsDigit(char ch) //�ж��Ƿ�Ϊ���֣����򷵻� 1�����򷵻� 0��
	{
		if(ch>='0'&&ch<='9')
			return 1;
		return 0;
	}
	int  IsOperator(char ch) //�ж��Ƿ�Ϊ���,���򷵻� 1�����򷵻� 0��
	{
		if(ch=='+'||ch=='-'||ch=='*'||ch=='/'||ch=='='||ch=='<'||ch=='>')
			return 1;
		return 0;
	}
	int IsDelimiter(char ch)//�ж��Ƿ�Ϊ��������򷵻�1�����򷵻�0.
	{
		if(ch=='('||ch==')'||ch=='['||ch==']'||ch=='{'||ch=='}'||ch=='"'||ch=="'".charAt(0)||ch==','||ch==';')
			return 1;
		return 0;
	}
	int IsKeywords(String  str) //�ж��Ƿ�Ϊ�ؼ��֣����򷵻�1�����򷵻�0.
	{
		if(str.equals("break")||str.equals("case")||str.equals("char")||str.equals("continue")||str.equals("do")||
				str.equals("default")||str.equals("if")||str.equals("else")||str.equals("float")||str.equals("long")||
				str.equals("int")||str.equals("return")||str.equals("short")||str.equals("switch")||str.equals("void")||
				str.equals("while")||str.equals("for"))
			return 1;
		return 0;
	}
	int IsIdentifiers(String str) //�ж��Ƿ�Ϊ��ʾ�������򷵻�1�����򷵻�0.
	{
		Pattern pattern = Pattern.compile("^[a-zA-Z|_]+[0-9|a-zA-Z|_]*$");
		Matcher matcher = pattern.matcher(str);
		if(matcher.find())
			return 1;
		return 0;
	}
	void input() throws IOException
	{
		System.out.println("��������䣺");
		BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
		input=br.readLine();
		System.out.println("|-------------------------------|");
		System.out.println("|\t���ʷ���\t����\tֵ\t|");
	}
	void  display()//���һЩ��������ַ���ʾ��ʽ
	{
		System.out.println("|-------------------------------|");
		System.out.println("�ʷ���������");
	}
	int  analyzerSubFun()//�ʷ��������ӳ���Ϊ��ʵ�ִʷ���������Ҫ���ܡ�
	{
		for(int i=0;i<input.length();i++)
		{
			char inputI=input.charAt(i);
			if(IsLetter(inputI)==1||IsDigit(inputI)==1||inputI=='_')//�������ĸ�����ֻ��»��ߣ�����ӵ�result��
			{
				result+=inputI;
				kongge=true;
			}
			if(i!=0&&((inputI==' '&&kongge)||IsOperator(inputI)==1||IsDelimiter(inputI)==1||IsOperator(input.charAt(i-1))==1||IsDelimiter(input.charAt(i-1))==1))
			//�����ո���konggeΪtrue��ǰ�ַ�Ϊ����������ǰһ���ַ�Ϊ�������������¸�ʽ���
			{
				if(IsOperator(input.charAt(i-1))!=1&&IsDelimiter(input.charAt(i-1))!=1)
				//���ǰһ���ַ���Ϊ��������������������룺1.��ǰ�ַ�Ϊ������ �� 2.��ǰ�ַ�Ϊ�ո���kongge=true
				{
					if(input.charAt(i-1)==' ') //��ǰΪ�����ǰһ��Ϊ�ո�
					{
						result+=inputI;
						continue;
					}
					tmp=result.substring(result.lastIndexOf(" ")+1);	//���ݿո��ȡ�Ӵ�(����ǰһ���Ѿ�����result���ʿɴ�result��ȡ��)
					int k=0;
					for(int j=0;j<tmp.length();j++)		//����Ӵ��а�������������ȥ����������ȡ�����Ĳ���
					{
						char tmpI=tmp.charAt(j);
						if(IsOperator(tmpI)==1||IsDelimiter(tmpI)==1) k=j+1;
					}
					tmp=tmp.substring(k);
					//�ܹ������Ӵ����ؼ��֡���ʾ���������������������˴��ų���������ֻʣ�� 1.�ؼ��� 2.��ʾ�� 3.����
					if(IsKeywords(tmp)==1)							//�ж��Ӵ��Ƿ�Ϊ�ؼ��֣��������
						System.out.println("|\t"+tmp+"\t�ؼ���\t"+tmp+"\t|");
					else if(IsIdentifiers(tmp)==1)					//�ж��Ӵ��Ƿ�Ϊ��ʾ�����������
						System.out.println("|\t"+tmp+"\t��ʾ��\t"+tmp+"\t|");
					else											//�Ӵ�Ϊ������ֱ�����
						System.out.println("|\t"+tmp+"\t����\t"+tmp+"\t|");
					kongge=false;
				}
				else			//ǰһ���ַ�Ϊ��������������������� 1.��ǰ�ַ�Ϊ������  ��   2.��ǰ�ַ�Ϊ�ո�
				{
					if(IsOperator(input.charAt(i-1))==1)
						System.out.println("|\t"+input.charAt(i-1)+"\t���\t"+input.charAt(i-1)+"\t|");
					else 
						System.out.println("|\t"+input.charAt(i-1)+"\t���\t"+input.charAt(i-1)+"\t|");
					if(IsOperator(inputI)!=1&&IsDelimiter(inputI)!=1||inputI==' ') continue;//�����ǰ�ַ���Ϊ��������ո����ֹ�ظ����
				}
				result+=inputI;
			}
		}
		char res =result.charAt(result.length()-1);
		System.out.println("|\t"+res+"\t���\t"+res+"\t|");//������һ���ַ�
		return 1;
	}
	String DecStrToBinStr(String decNum)//ʮ����ת���ɶ�����
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
	//�������� for(int i=0;i<=b;i++) { if(_5a_3b++=100) c-=1;}
} 
