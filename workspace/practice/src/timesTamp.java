
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class timesTamp {
  public static void main(String[] args){
//	Date date = new Date();
	SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");    //指定输入数据的格式
//	String dateString = df.format(date);
	String dateString = "2011/07/30 00:00:00";                            //实际输入的数据
	try{
	Date date1 = df.parse("2011/07/31 00:00:00");
	Date date2 = df.parse(dateString);                                    //将输入数据转换为Date默认格式
	System.out.println("输入数据--Date    "+(date1.getYear()+1900)+" -----new SimpleDateFormat");
	 //long l=date.getTime();
	}catch(ParseException e){
		e.printStackTrace();
	}
	timesTamp tt =new timesTamp();
	tt.timestampToDate();
	tt.dateToTimestamp();
}
public void timestampToDate(){
	  Date date =new Date(1319534374312l);                       //时间戳可以直接用来初始化，转换为Date型
	  int month =date.getMonth()+1;
	  month =month / 3;
	  String season ="";
	  if(month==1||month==4)        //求什么东西，直接写出问题的本质，是什么就写什么，然后就本质分析，这样最快
		  season ="冬季";
	  else if(month==2)
		  season ="春季";
	  else if(month==3)
		  season ="夏季";
	  else
		  season ="春季";
	  System.out.println("时间戳---->Date    "+date+" -----new date的时候就用时间戳初始化");
//	  System.out.println(season);
  }
public void dateToTimestamp(){
	  Date date = new Date();
	  SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  SimpleDateFormat df2 = new SimpleDateFormat("yyyyMMddhhmmss");
	  System.out.println("Date---->时间戳   "+date.toString()+" -------date.getTime()就是时间戳");
	  Timestamp ts = new Timestamp(date.getTime());
	  System.out.println("中国式的时间表示  "+ts+" ------- new Timestamp"); 
	  System.out.println("常规的时间表示       "+date.toLocaleString()+" ------- date.toLocaleString()");
	  System.out.println("只输出年月日            "+df.format(date)+" ------- df.format(date)");
	  System.out.println("输出年月日时分秒  "+df2.format(date)+" ------- df2.format(date)");
	  System.out.println("当前JVM占用的内存总数:"+Runtime.getRuntime().totalMemory());
	  System.out.println("最大可用内存，对应-Xmx:"+Runtime.getRuntime().maxMemory()/1024.0/1024.0);
	  System.out.println(new Date().getTime());
  }
}
//将任意String数据转换为Date型输出
