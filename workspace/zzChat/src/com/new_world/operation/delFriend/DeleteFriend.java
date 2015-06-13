package com.new_world.operation.delFriend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JLabel;
import javax.swing.JOptionPane;

import com.newworld.common.Conn;

public class DeleteFriend {
	PreparedStatement pstmt = null; 
	Conn conn = new Conn();
	public DeleteFriend(String userId,String friendId) throws Exception {
		// TODO Auto-generated constructor stub
		int res = JOptionPane.showConfirmDialog(null, "真的删除这个好友吗?", "删除好友", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		if(res==0){
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("delete from friend where userId=? and friendId = ?");
		pstmt.setString(1, userId);
		pstmt.setString(2, friendId);
		pstmt.executeUpdate();
		pstmt.close();
		connection.close();
		}
		
	}
	}

