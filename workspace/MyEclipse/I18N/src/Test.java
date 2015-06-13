import java.text.MessageFormat;
import java.util.Locale;
import java.util.ResourceBundle;


public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		//Locale locale = new Locale("en","US");
		Locale locale =Locale.getDefault();
		ResourceBundle rb = ResourceBundle.getBundle("message",locale);
		String str = MessageFormat.format(rb.getString("hi"),"zhouqi","zhangsan");
		System.out.println(str);
		


	}

}
