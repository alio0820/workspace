import java.sql.SQLException;
import java.util.Properties;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


public class Client {

	/**
	 * @param args
	 * @throws NamingException 
	 * @throws SQLException 
	 */
	public static void main(String[] args) throws NamingException, SQLException {
		
		Properties p = new Properties();
		p.put(Context.INITIAL_CONTEXT_FACTORY,"org.apache.naming.java.javaURLContextFactory");
		p.put(Context.PROVIDER_URL,"localhost:8088");	
		InitialContext   context = new InitialContext(p);
		Context envCtx = (Context) context.lookup("java:comp/env");

    	DataSource ds = (DataSource)envCtx.lookup("oraclejndi");
    	System.out.println(ds.getConnection());

	}

}
