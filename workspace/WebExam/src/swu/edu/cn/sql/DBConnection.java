package swu.edu.cn.sql;
import java.sql.*;
/*
 * author:handonghai
 * date:2012-03-27
 * ������ɶ���ݿ�Ĵ򿪣��رգ����룬���ҵȻ����
 */
public class DBConnection {
	
	public Connection conn;
	
	DBConnection(Connection conn){								
		
		this.conn=conn;
	}
	
	public DBConnection(){								//��ʼ�������캯��
		conn=null;
		
	}
	/***********************************************************************************************/
	/*
	 * ����ݿ����ӣ�������ݿ�����Connection
	 */
	public void  OpenDB(){
		String JDBCDriver = "com.mysql.jdbc.Driver";  					//�������

		String url = "jdbc:mysql://127.0.0.1:3306/examsystem";  		// URLָ��Ҫ���ʵ���ݿ���infoAgri

		String user = "root";    										// MySQL����ʱ���û���

		String password = "123456";  			 						// Java����MySQL����ʱ������
		
		try {
			Class.forName(JDBCDriver);   								// ���������
			conn= DriverManager.getConnection(url, user, password);		// ����MySQL��ݿ�
			if(conn!=null)
				System.out.println("DMMS is collected Successfull!");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	/***********************************************************************************************/
	/*
	 * �ر���ݿ�����
	 * �����ݿ�����Ϊ�رգ���ر���ݿ�����
	 */
	public void CloseDB(){	
		
		try {
			if(!conn.isClosed()){
				conn.close();
				if(conn.isClosed())
					System.out.println("DBMS is closed successfully!");
			}else{
				System.out.println("DBMS is not connected!");	
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
	}
	
	/***********************************************************************************************/
	/*
	 *���涼�Ǿ������ݿ������������Ŀ�йص���ݿ�������������ݿ�Ĳ��ҡ����롢ɾ���
	 *ǰ������ݿ������Ѿ��򿪣�����������Ӧ���е���һ�º����������OpenDB����ݿ�����
	 *������ݿ����CloseDB�ر���ݿ����ӣ�
	 */
	public ResultSet SelectDB(String sql){
		ResultSet rs=null;
		Statement st=null;
		try {
			if(conn.isClosed()){
				return null;	
			}
			
			st=conn.createStatement();
			rs=st.executeQuery(sql);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return rs;
	}
	
	/***********************************************************************************************
	 * 
	 * �ú�����ݱ�tongji��c���Լ���step������Ϊkey�ļ�¼
	 */
	public void addCount(int key,String c,int step){		
			
			String sql="update tongji set "+ c+"="+c+"+"+step +" where id= "+key;
			//System.out.println(sql);
			//System.out.println("��"+key+"����Ŀ�Ĵ𰸰�"+c);
			Statement st=null;
			
				try {
					st=conn.createStatement();
					st.executeUpdate(sql);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			
	}
	/***********************************************************************************************/
		
	public int selectOne(int key,String c){				//����ĳ����¼����ֵ
		int res=0;
		String sql="select "+c+" from tongji where id="+key;
		System.out.println(sql);
		Statement st=null;
		ResultSet rs=null;
		
			try {
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				while(rs.next()){
					res=rs.getInt(c);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return res;
		
	}
	
	/***********************************************************************************************/
	public void updateOne(int key,String c,double value){
			String sql="update tongji set "+c+"="+value +" where id= "+key;
			System.out.println(sql);
			Statement st=null;
			try {
				st=conn.createStatement();
				st.executeUpdate(sql);			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	public void updateScore(int key,String c,double value){
		String sql="update userinfo set "+c+"="+value +" where id= "+key;
		System.out.println(sql);
		Statement st=null;
		try {
			st=conn.createStatement();
			st.executeUpdate(sql);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
	
	/*
	 * �ж��û���Ϊusername���û��Ƿ����
	 * ����û����ڣ������û������룬�����ڣ�����null
	 * 0��ʾ�û������ڣ�1��ʾ�û����ڲ�����ʹ��ϵͳ��-1��ʾ�û����ڵ��ǲ���ʹ��ϵͳ
	 */
	public int	isUserExist(String id){
			int res=0;				
			ResultSet rs=null;
			Statement st=null;
			String sql="select id,username,flag from userinfo";
			try {
				if(conn.isClosed()){
					return res;	
				}
				
				st=conn.createStatement();
				rs=st.executeQuery(sql);
				
				while(rs.next()){
					if(rs.getString(1).equalsIgnoreCase(id)){			//�û�����
						
						if(rs.getString(3).equalsIgnoreCase("true")){
							res=1;
						}else{
							res=-1;							//�û��Ѿ���¼��ϵͳ��
						}								
						break;
					}
				}
				
				rs.close();
				st.close();
					
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return res;
	}
	
	
	/*************************************************************************************/
	/*
	 * ����һ����¼����������ͬ,ǰ������ݿ������Ѿ���
	 * �����������ͬ�ķ���ֵ��1��ʾ�����û���ݳɹ���-1��ʾʧ��
	 * 0��ʾ�û��Ѿ����ڣ�
	 */
	public int insertUser(String id,String username,String flag,String sex ){
		int res=-1;
		if(isUserExist(id)!=0){					//�ж��û��Ƿ���ڡ�����
			System.out.println("the id "+id+" is used! please change anthor one");
			res=0;				
		}else{
			String sql="insert into userinfo value(?,?,?,null,null,null,0,0,0,?);";
			PreparedStatement pst=null;
			try {
				pst=conn.prepareStatement(sql);
				pst.setString(1, id);
				pst.setString(2, username);
				pst.setString(3, flag);
				pst.setString(4, sex);
				
				if(pst.execute()){
					res=1;
					System.out.println("insert an new user successfully!");
				}else{
					res=-1;
					System.out.println("insert an new user faild");
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		
		}
		return res;
	}
	/*************************************************************************************/
//	public static void main(String[] args) throws SQLException{			//����������
//		DBConnection  DBConn=new DBConnection();
//		DBConn.OpenDB();
//		DBConn.updateOne(3,"rate",3.1415926);

//		ResultSet rs=DBConn.SelectDB("select id,username,flag from userinfo");
//		while(rs.next()){
//			System.out.print(rs.getString(1)+"\t\t");
//			System.out.print(rs.getString(2)+"\t\t");
//			System.out.println(rs.getString(3));
//		}
//		
//		
//		System.out.println(DBConn.isUserExist("teacher003"));
//		
//		//DBConn.insertUser("abcde","donghai", "true");
//		System.out.println("�û��Ƿ���ڣ� "+DBConn.isUserExist("TEAcher100"));
//		DBConn.insertUser("teacher888", "handonghai","true","f");
//		DBConn.CloseDB();
//	}

}
