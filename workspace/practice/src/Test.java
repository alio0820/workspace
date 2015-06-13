import java.io.PrintWriter;
import java.io.StringWriter;


//public class Test {
//    public static void main(String[] args) {  
//        try {  
//            String aa = "";  
//            System.out.println(aa.substring(3));  
//  
//        } catch (Exception e) {  
//            e.printStackTrace();  
//            StringWriter sw = new StringWriter();  
//            e.printStackTrace(new PrintWriter(sw, true));  
//            String str = sw.toString();  
//            System.out.println(e.getMessage()+"=");
//  
//            System.out.println(str+"0000");
//            
//        }  
//    }  
//}

public class Test {
	public static void main(String[] args){
		String[] arg = {"+86 1852 1032 998","86 13 8438 88 8 88"};
		for(int i=0;i<arg.length;i++){
			String item = arg[i];
			item = item.replaceAll("^[+]?86|\\s+", "");
			arg[i] = item;
		}
		for(int i=0;i<arg.length;i++){
			System.out.println(arg[i]);
		}
	}
}
