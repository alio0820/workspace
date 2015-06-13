package com.new_world.operation.delFriend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import com.newworld.common.Conn;
////////////////by Akira 2012-07-24
/////退出群组
public class DeleteGroup {
	PreparedStatement pstmt = null; 
	Conn conn = new Conn();
	//要求获取组的Id和用户Id  groupId,userId
	public DeleteGroup(String groupId,String userId) throws SQLException {
		int res = JOptionPane.showConfirmDialog(null, "真的要退出这个群吗?", "退出", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		if(res==0){
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("delete  from groupuser where groupId = ? and userId=?");
		pstmt.setString(1, groupId);
		pstmt.setString(2, userId);
		pstmt.executeUpdate();
  		connection.close();
  		JOptionPane.showConfirmDialog(null, "已执行推出这个群!", "退出群", 
  				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		}
		
	}
}