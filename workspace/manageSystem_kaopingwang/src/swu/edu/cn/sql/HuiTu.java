package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class HuiTu extends DBConnection {
	
	public  int  projectID;
	public  int currentMonth;	
	public  String  res;
	
	public  String  selectSQL;
	
	public HuiTu(int  projectID){
		super();
		currentMonth=(new Date()).getMonth();
		this.projectID=projectID;
		selectSQL="select * from TaskProgress where projectID="+projectID;
		System.out.println(selectSQL);
	}
	
	
	public String SelectHuituData(){
		ResultSet rs=null;
		Statement st=null;
		String res="";
		
		try {
			if(conn.isClosed()){
				return null;	
			}	
			
			st=conn.createStatement();
			rs=st.executeQuery(selectSQL);
			
			double temp=0.0;
			
			if(rs.next()){
				
				for(int i=3;i<=currentMonth+3;i++){
					if(rs.getDouble(i)>0){
						temp=rs.getDouble(i);
						res=res+":"+temp;
						System.out.println(rs.getDouble(i)+"有效数据");
					}else{
						res=res+":"+temp;
						System.out.println(rs.getDouble(i)+"无效数据");
					}
					
				}
				
			}
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	
	
	public  static void main(String [] args){
		HuiTu ht=new HuiTu(499);
		ht.OpenDB();
		String str=ht.SelectHuituData();
		ht.CloseDB();
		System.out.println(str);
		System.out.println(ht.currentMonth);
		
	}
	
	

}
