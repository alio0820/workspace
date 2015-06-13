import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Integer_check
{

	public static void main(String[] args)
	{
		String a = "11";
		String b = "11.1";
		if (zhengshuValidate(a) || a.equals("0"))
		{
			System.out.println("a is 自然数");
		}
		if (zhengshuValidate(b) || a.equals("0"))
		{
			System.out.println("b is 自然数");
		}
	}

	public static boolean zhengshuValidate(String number)
	{// 判断 正整数的格式
		Pattern pattern = Pattern.compile("^\\d+$");                 //正则表达式
		Matcher mc = pattern.matcher(number);
		return mc.matches();
	}
}
