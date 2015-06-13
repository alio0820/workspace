package swu.edu.cn.sql;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import swu.edu.cn.bean.*;
public class SuggestionManagement extends DBConnection{
	private SuggestionBean sb;
	
	SuggestionManagement(){
		super();
	}
	
	public SuggestionManagement(SuggestionBean sb){
		super();
		this.sb=sb;
	}
	
	public boolean addSuggestion(){
		boolean res = false;
	//	int suggestionId = sb.getSuggestionId();
		String userName = sb.getUserName();
		String departmentId = sb.getDepartmentId();
		String leaderSuggestion = sb.getLeaderSuggestion();
		String suggestionTime = sb.getSuggestionTime();
		boolean flag = sb.isFlag();
		
		String sql = "insert into suggestion (username,departmentid,leadersuggestion,suggestiontime,flag) values (?,?,?,?,?);";
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, departmentId);
			pst.setString(3, leaderSuggestion);
			pst.setString(4,suggestionTime);
			pst.setBoolean(5,flag);
			flag = pst.execute();
			if(flag) {
				res = true;
				System.out.println("add suggestion success !");
			}else{
				res = false;
				System.out.println("add suggestion failed!");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public boolean addSuggestionByPro(){
		boolean res = false;
		String sql = "insert into suggestion (username,departmentid,leadersuggestion,suggestiontime,flag,projectid,month) values (?,?,?,?,?,?,?);";
		PreparedStatement pst = null;
		try {
			pst = conn.prepareStatement(sql);
			pst.setString(1, sb.getUserName());
			pst.setString(2, sb.getDepartmentId());
			pst.setString(3, sb.getLeaderSuggestion());
			pst.setString(4,sb.getSuggestionTime());
			pst.setBoolean(5,sb.isFlag());
			pst.setString(6,sb.getProjectid());
			pst.setInt(7,sb.getMonth());
			res = pst.execute();
			if(res) {

				System.out.println("add suggestion success !");
			}else{

				System.out.println("add suggestion failed!");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public boolean deleteSuggestion(){
		boolean  res=false;
		
		String sql="delete from suggestion where suggestionid='"+sb.getSuggestionId()+"';";
		System.out.println(sql);
		
		try {
			Statement st=conn.createStatement();
			int  sum=st.executeUpdate(sql);
//			System.out.println(sum);
			if(sum>0)
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public boolean deleteSuggestionByPro(){
		boolean  res=false;
		
		String sql="delete from suggestion where departmentid='"+sb.getDepartmentId()+"'and projectid='"+sb.getProjectid()+"' and mont='"+sb.getMonth()+"';";
		System.out.println(sql);
		
		try {
			Statement st=conn.createStatement();
			int  sum=st.executeUpdate(sql);
//			System.out.println(sum);
			if(sum>0)
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public boolean updateSuggestion(){
		boolean res = false;
		int suggestionId = sb.getSuggestionId();
		String userName = sb.getUserName();
		String departmentId = sb.getDepartmentId();
		String leaderSuggestion = sb.getLeaderSuggestion();
		String suggestionTime = sb.getSuggestionTime();
		boolean flag = sb.isFlag();
		
		String sql="update suggestion set userName=?,departmentId=?,leaderSuggestion=?,suggestionTime=?,flag=? where suggestionId=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);
			pst.setString(1, userName);
			pst.setString(2, departmentId);
			pst.setString(3, leaderSuggestion);
			pst.setString(4, suggestionTime);
			pst.setBoolean(5, flag);
			pst.setInt(6, suggestionId);
			
			int n=pst.executeUpdate();
			if(n>0)
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
	
		return res;
	}
	
	public boolean updateSuggestionByPro(){
		boolean res = false;
		int suggestionId = sb.getSuggestionId();
		String userName = sb.getUserName();
		String departmentId = sb.getDepartmentId();
		String leaderSuggestion = sb.getLeaderSuggestion();
		String suggestionTime = sb.getSuggestionTime();
		boolean flag = sb.isFlag();
		String projectid = sb.getProjectid();
		int month = sb.getMonth();
		
		String sql="update suggestion set leaderSuggestion=?,suggestionTime=?,flag=? where departmentid=? and projectid=? and month=?;";
		PreparedStatement pst=null;
		try {
			pst=conn.prepareStatement(sql);

			pst.setString(1, leaderSuggestion);
			pst.setString(2, suggestionTime);
			pst.setBoolean(3, flag);
			pst.setString(4, departmentId);
			pst.setString(5, projectid);
			pst.setInt(6, month);
			
			int n=pst.executeUpdate();
			if(n>0)
				res=true;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		}	
		return res;
	}
	
	public ArrayList<SuggestionBean> searchAllSuggestion(){
		ArrayList<SuggestionBean> sb = new ArrayList<SuggestionBean>();
		String sql = "select * from suggestion order by cast(suggestiontime as int) desc;";
		ResultSet rs=this.SelectDB(sql);

		try {
			while(rs.next()){
				SuggestionBean  ub=new SuggestionBean();
				ub.setDepartmentId(rs.getString("departmentId"));
				ub.setFlag(rs.getBoolean("flag"));
				ub.setLeaderSuggestion(rs.getString("leaderSuggestion"));
				ub.setSuggestionId(rs.getInt("suggestionId"));	
				ub.setSuggestionTime(rs.getString("suggestionTime"));
				ub.setUserName(rs.getString("username"));
				sb.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sb;
	}
	
	public ArrayList<SuggestionBean> searchSuggestionByDeptId(){
		ArrayList<SuggestionBean> sub = new ArrayList<SuggestionBean>();
		String sql = "select Suggestion.username ,Suggestion.departmentid,suggestionTime,departmentname,leadersuggestion,flag,realname from suggestion join usertable on suggestion.username = usertable.username join department on suggestion.departmentid = department.departmentid where Suggestion.departmentid like '"+sb.getDepartmentId()+"%';";
		ResultSet rs=this.SelectDB(sql);

		try {
			while(rs.next()){
				SuggestionBean  ub=new SuggestionBean();
				ub.setDepartmentId(rs.getString("departmentId"));
				ub.setDepartmentName(rs.getString("departmentname"));
				ub.setFlag(rs.getBoolean("flag"));
				ub.setLeaderSuggestion(rs.getString("leaderSuggestion"));
//				ub.setSuggestionId(rs.getInt("suggestionId"));	
				ub.setSuggestionTime(rs.getString("suggestionTime"));
				ub.setUserName(rs.getString("username"));
				ub.setRealName(rs.getString("realname"));
				sub.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sub;
	}
	
	public ArrayList<SuggestionBean> searchSuggestionByUserName(){
		ArrayList<SuggestionBean> sub = new ArrayList<SuggestionBean>();
		String sql = "select Suggestion.username ,Suggestion.departmentid,suggestionId,suggestionTime,departmentname,leadersuggestion,flag,realname" +
				" from suggestion join usertable on suggestion.username = usertable.username " +
				"join department on suggestion.departmentid = department.departmentid where Suggestion.username like '%"+sb.getUserName()+"%';";
		ResultSet rs=this.SelectDB(sql);

		try {
			while(rs.next()){
				SuggestionBean  ub=new SuggestionBean();
				ub.setDepartmentId(rs.getString("departmentId"));
				ub.setDepartmentName(rs.getString("departmentname"));
				ub.setFlag(rs.getBoolean("flag"));
				ub.setLeaderSuggestion(rs.getString("leaderSuggestion"));
				ub.setSuggestionId(rs.getInt("suggestionId"));	
				ub.setSuggestionTime(rs.getString("suggestionTime"));
				ub.setUserName(rs.getString("username"));
				ub.setRealName(rs.getString("realname"));
				sub.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sub;
	}
	
	public ArrayList<SuggestionBean> searchSuggestionByProMonth(){
		ArrayList<SuggestionBean> sub = new ArrayList<SuggestionBean>();
		String sql = "select leadersuggestion,suggestiontime,flag,month,realname from " +
				"suggestion join usertable on suggestion.username=usertable.username " +
				"where month="+sb.getMonth()+" and projectid like '%"+sb.getProjectid()+"%';";
		ResultSet rs=this.SelectDB(sql);

		try {
			while(rs.next()){
				SuggestionBean  ub=new SuggestionBean();
				ub.setFlag(rs.getBoolean("flag"));
				ub.setSuggestionTime(rs.getString("suggestiontime"));
				ub.setMonth(rs.getInt("month"));
				ub.setRealName(rs.getString("realName"));
				ub.setLeaderSuggestion(rs.getString("leadersuggestion"));
				sub.add(ub);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return sub;
	}
	
	
	
	public static void main(String[] args){
		SuggestionBean sb1 = new SuggestionBean();
		sb1.setProjectid("evaluation002003");
		 sb1.setMonth(7);
		SuggestionManagement  dm=new SuggestionManagement(sb1);
		dm.OpenDB();
//		ArrayList<SuggestionBean>  list=dm.searchSuggestionByUserName();
		ArrayList<SuggestionBean>  list=dm.searchSuggestionByProMonth();
		for(SuggestionBean db:list){
			
			System.out.println(db.getDepartmentId());
			System.out.println(db.getDepartmentName());
			System.out.println(db.getLeaderSuggestion());
			System.out.println(db.getRealName());
			System.out.println(db.getSuggestionId());
			System.out.println(db.getSuggestionTime());
			System.out.println(db.getUserName());
		}
//		System.out.println("---------------------searchSuggestionByUserName--------------------------");
//		ArrayList<SuggestionBean>  list1=dm.searchSuggestionByDeptId();
//		ArrayList<DepartmentBean>  list=dm.searchAllDepartment();
//		for(SuggestionBean db:list1){
//			
//			System.out.println(db.getDepartmentId());
//			System.out.println(db.getDepartmentName());
//			System.out.println(db.getLeaderSuggestion());
//			System.out.println(db.getRealName());
//			System.out.println(db.getSuggestionId());
//			System.out.println(db.getSuggestionTime());
//			System.out.println(db.getUserName());
//		}
//		
//		System.out.println("--------------------searchSuggestionByDeptId---------------------------");
//		dm.deleteSuggestion();
////		ArrayList<DepartmentBean>  list=dm.searchAllDepartment();
//		for(SuggestionBean db:list1){
//			
//			System.out.println(db.getDepartmentId());
//			System.out.println(db.getDepartmentName());
//			System.out.println(db.getLeaderSuggestion());
//			System.out.println(db.getRealName());
//			System.out.println(db.getSuggestionId());
//			System.out.println(db.getSuggestionTime());
//			System.out.println(db.getUserName());
//		}
//		System.out.println("--------------------deleteSuggestion---------------------------");
//		SuggestionBean sb2 = new SuggestionBean();
//		sb2.setUserName("morgen");
//		sb2.setDepartmentId("department007");
//		sb2.setLeaderSuggestion("4976464797t639");
//		sb2.setSuggestionTime("123456789");
//		sb2.setFlag(true);
//		SuggestionManagement  dm2=new SuggestionManagement(sb2);
//		dm2.OpenDB();
//		dm2.addSuggestion();
//
//		for(SuggestionBean db:list1){
//			System.out.println(db.getDepartmentId());
//			System.out.println(db.getDepartmentName());
//			System.out.println(db.getLeaderSuggestion());
//			System.out.println(db.getRealName());
//			System.out.println(db.getSuggestionId());
//			System.out.println(db.getSuggestionTime());
//			System.out.println(db.getUserName());
//		}
//		System.out.println("--------------------addSuggestion---------------------------");
			
		dm.CloseDB();
	}
}
