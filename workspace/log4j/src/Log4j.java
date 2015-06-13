import java.util.Date;
import org.apache.log4j.Logger;

public class Log4j {
	  public static void main(String[] args) {
		  Logger logger = Logger.getLogger(Log4j.class.getName());//��ȡ��־��¼���������¼�������������־��Ϣ
		  try {
		  logger.error("error");//ʹ��Logger�����debug��info���������־��Ϣ
		  logger.debug("debug");
		  logger.info("info");
		  } catch (IllegalArgumentException ex) {
			  logger.info(ex.getMessage());//ʹ��Logger�����debug��info���������־��Ϣ
		  }
	  }
}