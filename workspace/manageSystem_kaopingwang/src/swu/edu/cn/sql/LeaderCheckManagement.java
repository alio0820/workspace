package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import swu.edu.cn.bean.*;
public class LeaderCheckManagement extends DBConnection {
	

	
	public static void main(String [] args){
		 LeaderCheckManagement lcm=new LeaderCheckManagement();
		 lcm.OpenDB();
		 lcm.createCheck(1, 5, "donghai", "���У�����");
		ArrayList<LeaderCheckBean>  list=lcm.getLeadCheck(42);
		
		for(LeaderCheckBean lcb:list){
			System.out.println(lcb.getProjectID());
			System.out.println(lcb.getTaskMonth());
			System.out.println(lcb.getRealName());
			System.out.println(lcb.getLeaderView());
			System.out.println("----------------------------");
		}
	}
	
	
	/**
	 * 
	 * �ú���ʵ��ĳ�쵼��ĳ����Ŀ��¼������ʾ
	 * ��ʾ֮��flagΪtrue���û�����֮������Լ���Ϊfalse
	 */
	public  boolean 	createCheck(int projectID,int taskMonth,String userName,String leaderView){
		java.util.Date  subDate=new java.util.Date();
		SimpleDateFormat f=new SimpleDateFormat("yyyy-MM-dd");
		String submitTime=f.format(subDate);	
		String insertSQL="insert into LeaderCheck(projectID,taskMonth,userName,leaderView,checkTime,flag) values("+projectID+","+taskMonth+",'"+userName+"','"+leaderView+"','"+submitTime+"','true')";
		System.out.println(insertSQL);
		return  this.insertDB(insertSQL);
		
	}
	
	
	
	
	/**
	 * �����쵼��Ī��Ŀ����ʾ���·��޹أ�
	 */
	public ArrayList<LeaderCheckBean> getLeadCheck(int projectID){
		ArrayList<LeaderCheckBean>  list=new ArrayList<LeaderCheckBean>();
		String selectSQL="select checkID,projectID,taskMonth,userName,leaderView,checkTime from LeaderCheck where   projectID="+projectID;
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				LeaderCheckBean  lcb=new LeaderCheckBean();
				lcb.setCheckID(rs.getInt("checkID"));
				lcb.setProjectID(rs.getInt("projectID"));
				lcb.setTaskMonth(rs.getInt("taskMonth"));
				lcb.setRealName(rs.getString("userName"));
				lcb.setLeaderView(rs.getString("leaderView"));
				lcb.setSubmitTime(rs.getString("checkTime"));
				
				list.add(lcb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return  list;
	}

	/**
	 * �����쵼����Ŀ��¼����ʾ�����·��й�
	 * if taskMonth=-1,��ֻ����Ŀ������ʾ
	 */
	public ArrayList<LeaderCheckBean> getLeadCheck(int projectID,int taskMonth){
		ArrayList<LeaderCheckBean>  list=new ArrayList<LeaderCheckBean>();
		//String selectSQL="select checkID,projectID,taskMonth,realName,leaderView,checkTime from LeaderCheck,separateLeader where LeaderCheck.userName=separateLeader.userName  and   projectID="+projectID+"  and taskMonth="+taskMonth;
		String selectSQL="select checkID,projectID,taskMonth,userName,leaderView,checkTime from LeaderCheck where   projectID="+projectID+" and taskMonth="+taskMonth;

		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				LeaderCheckBean  lcb=new LeaderCheckBean();
				lcb.setCheckID(rs.getInt("checkID"));
				lcb.setProjectID(rs.getInt("projectID"));
				lcb.setTaskMonth(rs.getInt("taskMonth"));
				lcb.setRealName(rs.getString("userName"));
				lcb.setLeaderView(rs.getString("leaderView"));
				lcb.setSubmitTime(rs.getString("checkTime"));
				
				list.add(lcb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return  list;
	}
	

	
	
	
	
	

}
