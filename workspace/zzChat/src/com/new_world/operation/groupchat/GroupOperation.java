package com.new_world.operation.groupchat;

import java.awt.EventQueue;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.swing.JDialog;
import javax.swing.JFrame;

import com.new_world.operation.wordchange.GroupArtFont;
import com.newworld.common.Conn;
import com.newworld.common.Message;
import com.newworld.view.GroupChatView;
/**author:王彩垒
 * Time:2012-07-21 
 * Last change:
 * function: 群聊操作
 */
public class GroupOperation {
    private Socket socket;
    private ObjectOutputStream oos;
	private ObjectInputStream ois;
	private ObjectInputStream oisRecord;
	private String title="诺亚的蜗牛";
    GroupChatView gcv;
    private boolean flag = false;
	private FileInputStream fis;
	private int data;
	private int id;
	GroupChatThread clientThread;
   // List<String> userList = new ArrayList<String>();
   private Conn conn = Conn.getConnInstance();
    PreparedStatement pstmt = null;
	public GroupOperation(int useid) {
		this.id = useid;
    	gcv = new GroupChatView("New World");
		try {
			socket = new Socket("localhost", 9999);
			oos = new ObjectOutputStream(socket.getOutputStream());
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		 /*Connection connection = conn.getConnection(null);
			try {
				pstmt = connection.prepareStatement("select userId from groupUser where groupId =?");
				pstmt.setInt(1, 123);
				ResultSet  rs=pstmt.executeQuery();
				while(rs.next()){
				gcv.getGroupUserNames().add(rs.getString("userId"));
				}
				rs.close();
				pstmt.close();
				connection.close();
			} catch (SQLException e3) {
				// TODO Auto-generated catch block
				e3.printStackTrace();
			}*/
       
		//发送按钮监听事件
		   gcv.getSendButton().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
			String s = gcv.getInputTextArea().getText();
			gcv.getInputTextArea().setText("");
			Message message = new Message();
			message.setSender(title);
			message.setDate(new Date());
			message.setContent(s);
			try {
				oos.writeObject(message);
				//userList.add(title);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}	
				
			}
		});
		
	
		//关闭按钮监听事件
		gcv.getCloseButton().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
			gcv.dispose();
				
			}
		});
		
		gcv.getGroupUserList().setText("诺亚的蜗牛");
		
		try {
			clientThread = new GroupChatThread(new ObjectInputStream(socket.getInputStream()), gcv.getChatTextArea());
			clientThread.start();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		try {
			fis = new FileInputStream("d:/pro_zzChat/SysSetFile.txt");
			fis.read();
			fis.read();
			data = fis.read();
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//设置字体监听事件
		gcv.getCharacterFormat().addMouseListener(new MouseAdapter(){

			public void mousePressed(MouseEvent e) {
				gcv.getFontPanel().setLayout(null);
				gcv.getFontPanel().setBounds(30,340, 400, 40);
				gcv.getGroupChatViewPanel().add(gcv.getFontPanel());
			}
		});
	
		
		
		//消息记录
	    gcv.getMessageRem().addMouseListener(new MouseAdapter() {
	    	@Override
	    	public void mousePressed(MouseEvent e) {
	    		// TODO Auto-generated method stub
	    		try {
					oisRecord = new ObjectInputStream(new FileInputStream("e:/record.txt"));
				} catch (FileNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
	    		super.mousePressed(e);
	    	}
		});
		
		//熱鍵的設置
		gcv.getInputTextArea().addKeyListener(new KeyAdapter() {
			@Override
			public void keyPressed(KeyEvent e) {
				int keyCode = e.getKeyCode();
				if (data==1){
					flag = true;
				}else if (data == 2){
					flag = false;
				}
				if (flag==true && e.isAltDown() && KeyEvent.VK_ENTER==keyCode) {
					String s = gcv.getInputTextArea().getText();
					gcv.getInputTextArea().setText("");
					Message message = new Message();
					message.setSender(title);
					message.setDate(new Date());
					message.setContent(s);
					try {
						oos.writeObject(message);
						//userList.add(title);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}	
						
				}
				else if (flag==false && KeyEvent.VK_ENTER==keyCode){
				String s = gcv.getInputTextArea().getText();
				gcv.getInputTextArea().setText("");
				Message message = new Message();
				message.setSender(title);
				message.setDate(new Date());
				message.setContent(s);
				try {
					oos.writeObject(message);
					//userList.add(title);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}						
			}
			}
		});
		new GroupArtFont(gcv);
	}
	
	
	
	public static void main(String[] args) {
	new GroupOperation(12345);
	
	//new ArtFont();
}
}
