package com.newworld.view;

import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.Date;

import com.newworld.common.Conn;
import com.newworld.common.PCMessage;

public class MyWinAdapter extends WindowAdapter {
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	private ObjectOutputStream oos;
	private int userId;
	public void windowClosing(WindowEvent e) {//��д�رմ��ڵķ�����Ҳ���ǵ����رհ�ť��ʱ��ִ�С���
		 
		//���������Ϣ
		PCMessage message = new PCMessage();
		message.setSender(userId);
		message.setSendTo(1);
		message.setSendTime(new Date());
		message.setContent("2");
		message.setStatus(2);
		System.out.println(11111111);
		try {
			oos.writeObject(message);
			Connection connection = conn.getConnection(null);
			pstmt = connection.prepareStatement("update userinfor set status=? where userId=? ");
			pstmt.setInt(1, 0);
			pstmt.setInt(2, userId);
			int rs=pstmt.executeUpdate();
			pstmt.close();
			connection.close();
		} catch (Exception e1) {
			System.out.println("���������Ϣʧ��...");
		}		
		 System.out.println("close");
		System.exit(0);
		}
	public MyWinAdapter(ObjectOutputStream oos,int userId){
		this.oos = oos;
		this.userId = userId;
		
	}
}
