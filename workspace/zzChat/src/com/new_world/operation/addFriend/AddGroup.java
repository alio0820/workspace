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
///////////////////////by Akira 2012-7-23���뵽Ⱥ
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
		//�Ȳ鿴�Ƿ��Ѿ��Ǹ����Ա
		if(!isHasGroup()){
		int res = JOptionPane.showConfirmDialog(null, "���Ҫ���뵽���Ⱥ��?", "����Ⱥ", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		if(res==0){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement  pstmt = null;
		//mysql��������в���ó�Ա
		pstmt=connection.prepareStatement("insert into groupuser values (?,?)");
		//�Ӳ��ҽ������ӵ�Ⱥ��д����Ϣ
		pstmt.setString(1,groupId);
		pstmt.setString(2,userId);
		  pstmt.executeUpdate();   
		  pstmt.close();
		  MainDisplay.groupAndFriendInfo();
		  //connection.close();
			}
		}
		//���������ʾ��
		else
		{JOptionPane.showConfirmDialog(null, "���Ѿ��Ǹ����Ա��", "��ʾ", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);}
	//�Է������б�ҳ��Ӵκ���

 
}
	///���ж��Ƿ����ڸ�Ⱥ
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
 