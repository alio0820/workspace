package com.new_world.operation.addFriend;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JOptionPane;
import javax.swing.JTextField;

import com.new_world.operation.mainframe.MainDisplay;
import com.newworld.common.Conn;

///////////by��������ᡡ��������������������������
///��Ӻ��Ѳ���
public class AddFriend {
	private String fnickName;
	private String unickName;
	private String userId;
	private String friendId;
	public  AddFriend(){}
	public  AddFriend (String friendId,String userId)throws Exception{
		
		this.userId = userId;
		this.friendId=friendId;
		if((!isHasFriend())){
			if(!userId.equals(friendId)){
			int res = JOptionPane.showConfirmDialog(null, "���Ҫ�����λ������?", "��Ӻ���", 
					JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
		//	System.out.println(res);
			if(res==0){
				System.out.println("ȷ��");
				Conn conn = new Conn();
				Connection connection = conn.getConnection(null);
				PreparedStatement pstmt = null; 
				PreparedStatement pstmt2 = null; 
				PreparedStatement pstmt3 = null; 
				PreparedStatement pstmt4 = null; 
				pstmt3=connection.prepareStatement("select nickname from userinfor where userId=?");
				pstmt3.setString(1, friendId);
				ResultSet rs=pstmt3.executeQuery();
				while (rs.next()){//��ȡ���ѵ�nickName
					fnickName=rs.getString("nickName");
				}
				
				//�Ӳ��ҽ������Ӻ�����friend��д����Ϣ
				pstmt = connection.prepareStatement("insert into friend values (?,?,?,null)");
				pstmt.setString(1,userId);
				pstmt.setString(2, friendId);
				pstmt.setString(3, fnickName);//�û����ú��ѱ�ע
				pstmt.executeUpdate();  
			
			
				//�Է������б�ҳ��Ӵκ���
				
				//��Ӻ��Ѻ�����ӵĺ��ѵ��б���Ҳ�д���
				
				pstmt4=connection.prepareStatement("select nickname from userinfor where userId=?");
				pstmt4.setString(1, userId);
				ResultSet rs2=pstmt4.executeQuery();
				while (rs2.next()){//��ȡ�û���nickName
					unickName=rs2.getString("nickName");
				}
				pstmt2 = connection.prepareStatement("insert into friend values (?,?,?,null)");
				pstmt2.setString(1, friendId);
				pstmt2.setString(2, userId);
				//ResultSet  rs2=pstmt.executeQuery();
				pstmt2.setString(3, unickName);
				//pstmt2.setString(4, groupingName);
				  pstmt2.executeUpdate();  
				  rs.close();
				  rs2.close();
			
				connection.close();	
				MainDisplay.groupAndFriendInfo();
			}	
		}
			else{
				JOptionPane.showConfirmDialog(null, "����������Լ�Ϊ���ѣ�", "��ʾ", 
						JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);
			}
		}
		else { JOptionPane.showConfirmDialog(null, "���Ѿ������ĺ��ѣ�", "��ʾ", 
				JOptionPane.OK_CANCEL_OPTION, JOptionPane.PLAIN_MESSAGE);}
		}
 ////���ж��Ƿ��Ѿ��иú���
	public boolean isHasFriend()throws Exception{
		boolean bl=false;
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;  
		pstmt = connection.prepareStatement("select friendId from friend where userId=?");
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()){
			if(friendId.equals(rs.getString("friendId"))){
				bl = true;
				break;
			}
		}
		return bl;
	}
}
