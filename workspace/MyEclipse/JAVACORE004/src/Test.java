import java.util.Calendar;

import com.chinasofti.pack.Test1;//导入包里面的类

import static com.chinasofti.pack.Test1.*;
import static java.lang.System.*;//静态导入：导入类的属性和方法；
import static java.util.Calendar.*;

public class Test{
public static void main(String args[]){
	Test t = new Test();
	t.test(75);
	Test1 t1=new Test1();
	//fun();
	System.out.println();
	out.println();
	System.out.println(DAY_OF_WEEK_IN_MONTH);
}
	public void test(int age){
		if (age< 0) {
			System.out.println("@#$%!");
			age++;
			} else if (age>250) {
			System.out.println("imposible");
			age--;
			} else {
			System.out.println("此人年龄 " + age );
			age+=age;
			}
	}
}
