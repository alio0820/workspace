package com.new_world.operation.mainframe;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.newworld.common.Conn;
import com.newworld.view.FriendListView;
import com.newworld.view.PrivateChatView;

public class FriendListOperate {
	Conn conn=new Conn();
	Connection connection=conn.getConnection(null);
	PreparedStatement pstmt = null; 
	private FriendListView flv;
	private String friendSearch;
	public FriendListOperate() {
		this.friendSearch=flv.getSearchFriend().toString();
		flv.getSearchButton().addMouseListener(new MouseAdapter() {
			public void mousePressed(MouseEvent e) {
				try {
					pstmt=connection.prepareStatement("select friendNoteName from friend where userId=? or friendId=?");
					pstmt.setString(1, friendSearch);
					pstmt.setString(2, friendSearch);
					ResultSet rs=pstmt.executeQuery();
					if(rs.next()){
						new PrivateChatView(friendSearch);
					}
					else{
						flv.getSearchFriend().setText("没有"+friendSearch+"这个好友!");
					}
					pstmt.close();
					rs.close();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
	
	
	
	}
}
