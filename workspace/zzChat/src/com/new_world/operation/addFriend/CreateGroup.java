package com.new_world.operation.addFriend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Random;

import javax.swing.JOptionPane;

import com.newworld.common.Conn;
/////////////by Akira 2012-07-24
////////创建组入口是 CreateGroupView的按钮监听事件，从方法入口getGroupId(,,,)
public class CreateGroup {
	private int groupId;
	private String userId;
	private Random ran=new Random();
	Conn conn = new Conn();
	private int count;
	Connection connection = conn.getConnection(null);
	private static String newGroupName ;
	public CreateGroup() {

	}
	public CreateGroup(String userId){
		this.userId=userId;
		System.out.println(this.userId);
	}
	public int getGroupId(String newGroupName,String groupContent) throws Exception{
			this.newGroupName =newGroupName;
			boolean flag=true;
			PreparedStatement pstmt = null; 
			PreparedStatement pstmt2 = null; 
			PreparedStatement pstmt5 = null; 
			if(!isSameName()){
				JOptionPane.showMessageDialog(null, "您要创建的群名已经存在了，再创建一个个性的群吧~", "重名提示", JOptionPane.ERROR_MESSAGE);
				
			}
			else  if(ishasPower()&&isSameName()){
				// System.out.println("dgakldgjaktgje");
				 count++;
				// System.out.println(flag+"11111111111111");
				 while(flag){
					 groupId=100+ran.nextInt(9900);
					// System.out.println(groupId);
					//如果能创建，则进入
					if(!isHasGroup(groupId)){
						flag=false;
						//System.out.println("fsdkgjasdgj asiogj");
						pstmt = connection.prepareStatement("insert into groupinfo values (?,?,?)");
						pstmt.setInt(1,groupId) ;
						pstmt.setString(2, newGroupName);
						pstmt.setString(3, groupContent);//用户设置好友备注
						pstmt.executeUpdate();  
						
						pstmt2=connection.prepareStatement("insert into groupuser values (?,?)");
						pstmt2.setInt(1,groupId);
						pstmt2.setString(2, userId);
						pstmt2.executeUpdate();	
						
						break;
					}
					else{flag=true;}
				}
				 pstmt5 = connection.prepareStatement("update userinfor set creategroup=? where userId=? ");
				 pstmt5.setInt(1,count);
				 pstmt5.setString(2, userId);
				 pstmt5.executeUpdate();  
				 pstmt5.close();
				 System.out.println();
				}
			else {
					 JOptionPane.showMessageDialog(null, "您只能创建一个群，您已经创建了一个群！您不能在创建群！", "权限提示", JOptionPane.ERROR_MESSAGE);
					 System.out.println(flag+"    nihao!");
				}
			 return groupId;
	}
	public boolean isHasGroup(int groupId)throws Exception{
		boolean bl=false;
		PreparedStatement pstmt3 = null;  
		pstmt3 = connection.prepareStatement("select * from groupuser where groupId=?");
		pstmt3.setInt(1, groupId);
		ResultSet rs = pstmt3.executeQuery();
		if(rs.next()){
			bl = true;
		}
		rs.close();
		return bl;
	}
	//如果存在该群，则不能创建，并且返回true
	public boolean ishasPower()throws Exception{
		boolean bl=false;
		PreparedStatement pstmt = null;  
		pstmt = connection.prepareStatement("select creategroup from userinfor where userId=?");
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt("creategroup");
			if( count!=1){
				bl = true;
			}
		}
	
		rs.close();
	//	System.out.println("bl:"+bl);
		return bl;
	}
	public boolean isSameName() throws Exception{//判断创建群名是否有重复
		boolean flag =true;
		PreparedStatement pstmt2 = null;  
		pstmt2=connection.prepareStatement("select groupName from groupinfo");
		ResultSet rs = pstmt2.executeQuery();
		while(rs.next()){
			if(newGroupName.equals(rs.getString("groupName"))){
				 flag=false;
				 break;
			}
		}
		rs.close();
		return flag;
	}
}
