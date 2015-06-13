import java.util.Date;
import org.apache.log4j.Logger;

public class Log4j {
	  public static void main(String[] args) {
		  Logger logger = Logger.getLogger(Log4j.class.getName());//获取日志记录器，这个记录器将负责控制日志信息
		  try {
		  logger.error("error");//使用Logger对象的debug、info方法输出日志信息
		  logger.debug("debug");
		  logger.info("info");
		  } catch (IllegalArgumentException ex) {
			  logger.info(ex.getMessage());//使用Logger对象的debug、info方法输出日志信息
		  }
	  }
}