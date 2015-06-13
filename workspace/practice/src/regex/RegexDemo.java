package regex;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegexDemo {
	public static void main(String[] args){
		Pattern mpattern = Pattern.compile("width:\\d*px;");
		Matcher mmatcher = mpattern.matcher("style=\"height:10px;;;;width:15px;;;;\"");
		ArrayList<String> arrayList_title = new ArrayList<String>();
		//while(mmatcher.find())
		if(mmatcher.find())
		    arrayList_title.add(mmatcher.group());
		System.out.println(arrayList_title);
	}
}
