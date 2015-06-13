package com.new_world.operation.groupchat;

import java.awt.Color;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JSplitPane;
import javax.swing.KeyStroke;
import javax.swing.ListModel;
import javax.swing.event.ListDataEvent;
import javax.swing.event.ListDataListener;

import com.new_world.operation.mainframe.FriendList;
import com.new_world.operation.mainframe.GroupList;
import com.new_world.operation.mainframe.MainDisplay;
import com.new_world.operation.snapshot.SnapshotTest;
import com.new_world.operation.wordchange.GroupArtFont;
import com.newworld.common.Conn;
import com.newworld.common.PCMessage;
import com.newworld.view.GroupChatView;
import com.new_world.operation.privatechat.*;

public class GroupChatClient {
	public int friendId;
	private Socket socket;
	public GroupChatView gcv;
	private String messagePath;
	private String messagePathReal;
	private BufferedReader br;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt=null;
	private ArrayList<FriendList> fl = new ArrayList<FriendList>();
	private JLabel[] groupUsersLabel;
	private String[] userNickNames;
	private FriendList ff;
	private JList groupUserInfoList;
	private JSplitPane jsp;
	private DefaultListModel listModel = new DefaultListModel();
	private boolean flagEnter = true;
	private FileInputStream readSysSet;
	
	public GroupChatClient(int userId,int friendId,String friendName,final ObjectOutputStream oos){
		this.friendId = friendId;
		gcv =new GroupChatView(friendName);
		final int  user =userId;
		final int friend  = friendId;
		//加载群用户列表
		Connection connection = conn.getConnection(null);
			try {
				pstmt = connection.prepareStatement("select nickName,userInfor.userId "
						+ "from groupUser,userInfor " + "where groupId = ? and groupUser.userId =userInfor.userId");
				pstmt.setInt(1, friendId);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					ff = new FriendList();
					ff.setFriendId(rs.getInt("userId"));
					ff.setFriendNoteName(rs.getString("nickName"));
					fl.add(ff);
				}
				
				
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			userNickNames = new String[fl.size()];
			groupUsersLabel = new JLabel[fl.size()];
			for(int i = 0;i < fl.size();i++){
				userNickNames[i] = fl.get(i).getFriendNoteName() + "(" + fl.get(i).getFriendId() + ")";
				gcv.getDlm().addElement(userNickNames[i]);
				gcv.getDlm().addListDataListener(new ListDataListener() {
					
					@Override
					public void intervalRemoved(ListDataEvent e) {
						// TODO Auto-generated method stub
						System.out.println(0);
					}
					
					@Override
					public void intervalAdded(ListDataEvent e) {
						// TODO Auto-generated method stub
						System.out.println(1);
					}
					
					@Override
					public void contentsChanged(ListDataEvent e) {
						// TODO Auto-generated method stub
						System.out.println(2);
					}
				});
			}
			
		
			
		
		GroupList gll = new GroupList();
		for(int i=0;i<MainDisplay.gl.size();i++){
			if(MainDisplay.gl.get(i).getGroupId()==friendId){
			gll = MainDisplay.gl.get(i);
			gcv.getGroupIdlab().setText(""+gll.getGroupId());
			gcv.getGroupContentLab().setText(gll.getGroupContent());
			gcv.getGroupNameLab().setText(gll.getGroupName());
			break;
			}
		}

		KeyStroke   enter   =   KeyStroke.getKeyStroke( "ENTER");
		gcv.getInputTextArea().getInputMap().put(enter,"none");			//禁用回车
		
		//判断文件是否存在，如果不存在就创建该文件
		String sysSet = String.valueOf(System.getProperty("user.dir"));
		sysSet = sysSet.replace("\\", "/");
		messagePath="D:/" + user + "-" + friend + "message.txt";
		messagePathReal = messagePath;
		File f1 = new File(sysSet + "/" + userId + "FilePath.txt");	
		if(!f1.exists()){
			try {
				f1.createNewFile();
				FileWriter fw = new FileWriter(f1);
				fw.write("D:/");
				fw.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		else{
			try {
				br = new BufferedReader(new FileReader(sysSet + "/" + userId + "FilePath.txt"));
				messagePathReal = br.readLine()+ "/" + user + "-" + friend+"message.txt";
				
			} catch (Exception e1) {
				System.out.println("文件不存在");
			}
		}
		File f = new File(messagePathReal);
	    try{
			if(!f.exists()){
				f.createNewFile();
			}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    final String messagePathRealR = messagePathReal;
		
	    
	    gcv.getPrintScreen().addMouseListener(new MouseAdapter() {
	    	@Override
	    	public void mouseClicked(MouseEvent e) {
	    		// TODO Auto-generated method stub
	    		try {
		 			new SnapshotTest(user);
		 		
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    	}
		});
	    
	    gcv.getFileTranser().addMouseListener(new MouseAdapter() {
	    	public void mouseClicked(MouseEvent e) {
	    		// TODO Auto-generated method stub
	    		try {
		 			JFileChooser jfc = new JFileChooser();
		 			jfc.setDialogTitle("请选择需要传送的文件：");
					int isChoose = jfc.showOpenDialog(null);
		 		
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
	    	}
	    	
		});
	    
	    gcv.getMessageRem().addMouseListener(new MouseAdapter() {
	    	
	    	public void mousePressed(MouseEvent e) {
				File fR = new File(messagePathRealR);
			    try{
					if(!fR.exists()){
						fR.createNewFile();
					}
			    }catch(Exception e1){
			    	System.out.println("创建消息记录文件失败..");
			    }
				if(gcv.getMessageRem().isSelected()){
					
					gcv.getChatRecordSP().setViewportView(gcv.getChatRecordTA());
					gcv.getChatRecordSP().setBounds(435, 80, 240, 435);
					gcv.getChatScrollPane().setVisible(true);
					gcv.getGroupIdlab().setVisible(false);
					gcv.getGroupIdLabel().setVisible(false);
					gcv.getGroupNameLabel().setVisible(false);
					gcv.getGroupNameLab().setVisible(false);
					gcv.getGroupContentLabel().setVisible(false);
					gcv.getGroupContentSP().setVisible(false);
					gcv.getGroupChatViewPanel().add(gcv.getChatRecordSP());
					gcv.getGroupChatViewPanel().repaint();
					try {
						BufferedReader br =new BufferedReader(new FileReader(messagePathRealR));
						String text="";
						String data= br.readLine();
						while(data!=null){
							text=text+data+"\n";
							data= br.readLine();
						}
						gcv.getChatRecordTA().setText(text);
					} catch (Exception e1) {
						e1.printStackTrace();
					} 
										
				}else if(!gcv.getMessageRem().isSelected()){
					
					gcv.getGroupChatViewPanel().remove(gcv.getChatRecordSP());
					gcv.getGroupIdlab().setVisible(true);
					gcv.getGroupIdLabel().setVisible(true);
					gcv.getGroupNameLabel().setVisible(true);
					gcv.getGroupNameLab().setVisible(true);
					gcv.getGroupContentLabel().setVisible(true);
					gcv.getGroupContentSP().setVisible(true);
					gcv.getGroupChatViewPanel().repaint();
				}
			}
	    	
		});
	    
	    //flagEnter
	    String str = String.valueOf(System.getProperty("user.dir"));
		try {
			readSysSet = new FileInputStream(str + "/" + user + "SysSetFile.txt");
			int aa = readSysSet.read();
			if(aa == -1){
				flagEnter = true;
			}else{
				readSysSet.read();
				int a = readSysSet.read();
				if(a == 1){
					flagEnter = true;
				}else{
					flagEnter = false;
				}
				
			}
			//System.out.println(flagEnter);
			
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//input框回车事件
		gcv.getInputTextArea().addKeyListener(new KeyAdapter() {
			
			public void keyPressed(KeyEvent e) {
				File fR = new File(messagePathRealR);
			    try{
					if(!fR.exists()){
						fR.createNewFile();
					}
			    }catch(Exception e1){
			    	System.out.println("创建消息记录文件失败..");
			    }
				String s = gcv.getInputTextArea().getText();
				if (flagEnter == true) {
					if (e.getKeyCode() == 10 && (!s.equals("")) && s != null) {
						PCMessage message = new PCMessage();
						message.setSender(user);
						message.setSendTo(friend);
						message.setSendTime(new Date());
						message.setStatus(1);
						message.setContent(s);
						try {
							oos.writeObject(message);
							FileWriter fw = new FileWriter(messagePathRealR,
									true);
							fw.append(message.toString());
							fw.close();
							gcv.getInputTextArea().setText("");
							gcv.getChatTextArea().append(message.toString());
						} catch (Exception e1) {
							System.out.println("发送消息失败...");
						}
					}
				}else if(flagEnter == false){
					if(e.isControlDown() && e.VK_ENTER==e.getKeyCode() && (!s.equals("")) && s != null){
						PCMessage message = new PCMessage();
						message.setSender(user);
						message.setSendTo(friend);
						message.setSendTime(new Date());
						message.setStatus(1);
						message.setContent(s);
						try {
							oos.writeObject(message);
							FileWriter fw = new FileWriter(messagePathRealR,
									true);
							fw.append(message.toString());
							fw.close();
							gcv.getInputTextArea().setText("");
							gcv.getChatTextArea().append(message.toString());
						} catch (Exception e1) {
							System.out.println("发送消息失败...");
						}
					}
				}
			}
		});
		
		//发送按钮
		gcv.getSendButton().addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				String s = gcv.getInputTextArea().getText();
				if((!s.equals(""))&&s!=null){
					
					PCMessage message = new PCMessage();
					message.setSender(user);
					message.setSendTo(friend);
					message.setSendTime(new Date());
					message.setContent(s);
					message.setStatus(1);
					try {
						oos.writeObject(message);
						FileWriter fw = new FileWriter(messagePathRealR,true);
						fw.append(message.toString());
						fw.close();
						gcv.getInputTextArea().setText("");
						gcv.getChatTextArea().append(message.toString());
					} catch (Exception e1) {
						System.out.println("发送消息失败...");
					}
					
				}
			}
		});
		
		//设置字体监听事件
		gcv.getCharacterFormat().addMouseListener(new MouseAdapter(){

			public void mousePressed(MouseEvent e) {
				if (gcv.getCharacterFormat().isSelected()){
					gcv.getFontPanel().setVisible(true);
				gcv.getFontPanel().setLayout(null);
				gcv.getFontPanel().setBounds(30,345, 400, 50);
				gcv.getFontPanel().setOpaque(false);
				gcv.getGroupChatViewPanel().add(gcv.getFontPanel());
				}
				else 
					gcv.getFontPanel().setVisible(false);
			}
		});
		
		//关闭按钮
		gcv.getCloseButton().addActionListener(new ActionListener() {		
			public void actionPerformed(ActionEvent e) {
				gcv.dispose();
			}
		});
		new GroupArtFont(gcv);
	}
}
