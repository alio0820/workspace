package com.new_world.operation.addFriend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;

import com.new_world.operation.mainframe.MainDisplay;
import com.newworld.common.Conn;
///////////////////////by Akira 2012-7-23加入到群
public class AddGroup {
	private String userId;
	private String groupId;
	public AddGroup() {
	// TODO Auto-generated constructor stub
	}
	public AddGroup(String groupId,String userId) throws Exception{
		this.groupId=groupId;
		this.userId=userId;
		boolean flag=true;
		for(int i=0;i<groupId.length();i++){
				 if(!Character.isDigit(groupId.charAt(i))){
					 flag=false;
				 	 break;
				 }
			}
		//先查看是否已经是改组成员
		if(!isHasGroup()){
		int res = JOptionPane.showConfirmDialog(null, "真的要加入到这个群吗?", "加入群", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		if(res==0){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement  pstmt = null;
		//mysql语句在组中插入该成员
		pstmt=connection.prepareStatement("insert into groupuser values (?,?)");
		//从查找结果中添加到群里写入信息
		pstmt.setString(1,groupId);
		pstmt.setString(2,userId);
		  pstmt.executeUpdate();   
		  pstmt.close();
		  MainDisplay.groupAndFriendInfo();
		  //connection.close();
			}
		}
		//是则给出提示框
		else
		{JOptionPane.showConfirmDialog(null, "您已经是该组成员！", "提示", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);}
	//对方好友列表页添加次好友

 
}
	///先判断是否已在该群
	public boolean isHasGroup()throws Exception{
		boolean bl=false;
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;  
		pstmt = connection.prepareStatement("select groupId from groupuser where userId=?");
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			if(groupId.equals(rs.getString("groupId"))){
				bl = true;
				break;
			}
		}
		return bl;
	}
	
	
	
}
 