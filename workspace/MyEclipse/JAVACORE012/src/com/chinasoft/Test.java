package com.chinasoft;

import java.io.IOException;
import java.text.ParseException;
import java.util.Calendar;

public class Test {

	/**
	 * @param args
	 * @throws IOException 
	 * @throws ParseException 
	 */
	public static void main(String[] args) throws IOException, ParseException {
//		List list = new ArrayList();
//		list.add("a");
//		list.add("c");
//		list.add("b");
//		Collections.sort(list);
//		System.out.println(list);
//		System.out.println(Collections.max(list));
//		System.setProperty("name", "aaa");
//		Properties p = 	new Properties(System.getProperties());
		//p.load(new FileInputStream("src\\holle.properties"));
//		System.out.println(p.getProperty("name"));
//		Runtime r = Runtime.getRuntime();
//		Process  p = r.exec("shutdown -a");
		
//		Scanner s = new Scanner(System.in);
//		String str = s.nextLine();
//		System.out.println(str);
		//p.destroy();

//			String s = "2010-8-19 17:30:00";
//			DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
//			Date d = sdf.parse(s);
//			System.out.println(d);
//			SimpleDateFormat sdf1 = new SimpleDateFormat("hh:mm:ss yyyy-MM-dd ------E");
//			System.out.println(sdf1.format(d));
		
		 	Calendar c = Calendar.getInstance();
		 	c.add(Calendar.MONTH, 15);
		 	System.out.println(c.get(Calendar.MONTH));

		}
	

}
