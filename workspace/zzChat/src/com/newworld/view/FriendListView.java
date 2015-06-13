package com.newworld.view;


import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.UIManager;

import com.mysql.jdbc.Connection;
//import com.new_world.operation.addFriend.CreateGroup;
import com.new_world.operation.setinfo.SetSysInfo;
import com.new_world.operation.setinfo.SetUserInfo;
import com.newworld.common.Conn;



// Design by littlePP @20120719
public class FriendListView extends JFrame{
	private JPanel friendListViewPanel; 
	private JPanel friendListPanel;
	private JPanel groupListPanel;
	private JScrollPane friendListSp = new JScrollPane();
	private JScrollPane groupListSp = new JScrollPane();
	private JTabbedPane frienfTabbedPane = new JTabbedPane();
	private JPanel userPic;
	private JLabel userName;
	private JLabel friendListLabel = new JLabel("好友列表");
	private JLabel groupListLabel = new JLabel("群列表");	
	private JLabel labeltest = new JLabel("好友");
	private JLabel userSign = new JLabel();

	//列表
//	private JLabel	friend1 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend2 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend3 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend4 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend5 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend6 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend7 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  friend8 = new JLabel(new ImageIcon("image/qq.png"));
//	private JLabel  group1 = new JLabel(new ImageIcon("image/qq.png"));
	
	/*状态列表栏
	private JPanel userStatusPanel;
	private JButton userStatusBtn = new JButton(new ImageIcon("image/qq.png"));
	private JLabel onlineStatusLabel = new JLabel(new ImageIcon("image/online.png"));
	private JLabel leaveStatusIcon = new JLabel(new ImageIcon("image/leave.png"));
	private JLabel busyStatusIcon = new JLabel(new ImageIcon("image/busy.png"));
	private JLabel invisibleStatusIcon = new JLabel(new ImageIcon("image/invisible.png"));
	*/
	
	private JTextField searchFriend = new JTextField();
	private JButton searchButton = new JButton("搜索");
	private JButton setInfoButton = new JButton("设置");
	private JButton searchFriendButton = new JButton("查找");
	private JComboBox userStatus = new JComboBox();
	
	public FriendListView() throws Exception{
		
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		
		this.setResizable(false);
		this.setLocation(900, 10);
		this.setTitle("zzChat");
		friendListViewPanel = new ImagePanel("image/list.png");
		friendListPanel = new ImagePanel("image/op.JPG");
		groupListPanel = new ImagePanel("image/op.JPG");
	//	userStatusPanel = new ImagePanel("image/brownground.jpg");
		this.setSize(300,700);
		this.add(friendListViewPanel);
		friendListViewPanel.setLayout(null);
		
		
		
		//选项卡
		
		friendListPanel.setLayout(new GridLayout(30,1));
		groupListPanel.setLayout(new GridLayout(30,1));
		friendListSp.setViewportView(friendListPanel);
		groupListSp.setViewportView(groupListPanel);
		
		friendListSp.setOpaque(false);
		friendListSp.getViewport().setOpaque(false);
		
		groupListSp.setOpaque(false);
		groupListSp.getViewport().setOpaque(false);
		
		
		frienfTabbedPane.add("好友列表",friendListSp);
	
		frienfTabbedPane.add("群组列表",groupListSp);
	
		frienfTabbedPane.setBounds(0, 100, 285, 520);
		friendListViewPanel.add(frienfTabbedPane);		
//		//用户头像
//		userPic = new ImagePanel("image/pig.jpg");
//		userPic.setBounds(5, 5, 65, 65);
//		friendListViewPanel.add(userPic);
		
		//用户状态
		
		userStatus.setBounds(75, 5, 60, 27);
		userStatus.addItem("在线");
		userStatus.addItem("忙碌");
		userStatus.addItem("离开");
		userStatus.addItem("隐身");
		friendListViewPanel.add(userStatus);
		
		//用户名字
		userName = new JLabel();
		userName.setBounds(150, 5, 70, 27);
		friendListViewPanel.add(userName);
		
		//
		userSign.setBounds(75, 35, 200, 27);
		friendListViewPanel.add(userSign);
		
		//搜索框
		searchFriend.setBounds(0, 75, 220, 27);
		searchFriend.setOpaque(false);
		friendListViewPanel.add(searchFriend);
		
		//搜索按钮

		searchButton.setBounds(230, 75, 60, 27);

		friendListViewPanel.add(searchButton);
		
		//设置信息按钮
		setInfoButton.setBounds(5,630,130,30);
		friendListViewPanel.add(setInfoButton);
		
		searchFriendButton.setBounds(155, 630, 130, 30);
		friendListViewPanel.add(searchFriendButton);
			
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);		
		this.setVisible(true);
	}
	 
	public JPanel getFriendListPanel() {		
		return friendListPanel;
	} 
    public JPanel getFriendListViewPanel() {	
			return friendListViewPanel;
		}
	public void setFriendListViewPanel(JPanel friendListViewPanel) {
		this.friendListViewPanel = friendListViewPanel;
	}
	public void setFriendListPanel(JPanel friendListPanel) {
		this.friendListPanel = friendListPanel;
	}

	public JPanel getGroupListPanel() {		
		return groupListPanel;
	}
    

	public void setGroupListPanel(JPanel groupListPanel) {
		this.groupListPanel = groupListPanel;
	}
	public JTabbedPane getFrienfTabbedPane() {
		return frienfTabbedPane;
	}
	public void setFrienfTabbedPane(JTabbedPane frienfTabbedPane) {
		this.frienfTabbedPane = frienfTabbedPane;
	}
	public JPanel getUserPic() {
		return userPic;
	}
	public void setUserPic(JPanel userPic) {
		this.userPic = userPic;
	}
	public JLabel getUserName() {
		return userName;
	}
	public void setUserName(JLabel userName) {
		this.userName = userName;
	}
	public JLabel getFriendListLabel() {
		return friendListLabel;
	}
	public void setFriendListLabel(JLabel friendListLabel) {
		this.friendListLabel = friendListLabel;
	}
	public JLabel getGroupListLabel() {
		return groupListLabel;
	}
	public void setGroupListLabel(JLabel groupListLabel) {
		this.groupListLabel = groupListLabel;
	}
	public JTextField getSearchFriend() {
		return searchFriend;
	}
	public void setSearchFriend(JTextField searchFriend) {
		this.searchFriend = searchFriend;
	}
	public JButton getSearchButton() {
		return searchButton;
	}
	public void setSearchButton(JButton searchButton) {
		this.searchButton = searchButton;
	}
	public JButton getSetInfoButton() {
		return setInfoButton;
	}
	public void setSetInfoButton(JButton setInfoButton) {
		this.setInfoButton = setInfoButton;
	}
	public JButton getSearchFriendButton() {
		return searchFriendButton;
	}
	public void setSearchFriendButton(JButton searchFriendButton) {
		this.searchFriendButton = searchFriendButton;
	}
	public JComboBox getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(JComboBox userStatus) {
		this.userStatus = userStatus;
	}	
	public JLabel getUserSign() {
		return userSign;
	}
	public void setUserSign(JLabel userSign) {
		this.userSign = userSign;
	}
	public static void main(String[] args) throws Exception {

		try {
			//UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
			 // UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
			UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");
		} 
		catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 

		

		new FriendListView();
	}
	
}
