package com.newworld.view;

import java.awt.Color;
import java.awt.GraphicsEnvironment;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.io.ObjectInputStream;


import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.JTextPane;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;
import javax.swing.border.LineBorder;

import com.new_world.operation.snapshot.*;


/*
 * Design by littlePP @20120719
 */
public class PrivateChatView extends JFrame{
	
	public JMenu getPrintScreen() {
		return printScreen;
	}

	public void setPrintScreen(JMenu printScreen) {
		this.printScreen = printScreen;
	}

	private JPanel privateChatPanel;
	private JPanel friendPic;
	private JTextArea inputTextArea = new JTextArea();
	private JTextArea chatTextArea = new JTextArea();
	private JLabel friendNameLabel = new JLabel();
	private JButton sendButton = new JButton("发送");
	private JButton closeButton = new JButton("关闭");
	private JMenuBar privateChatMenuBar = new JMenuBar();
	private JMenu characterFormat = new JMenu("设置字体");
	private JMenu picture = new JMenu("表情");
	private JMenu messageRem = new JMenu("消息记录");
	private JMenu printScreen = new JMenu("截取屏幕");
	private JMenu fileTransfer = new JMenu("传送文件");
	private JMenu item3 = new JMenu("抖一下");
	private JMenu item4 = new JMenu("       ");
	private JMenu item5 = new JMenu("       ");
	private JMenu item6 = new JMenu("     ");
	private JScrollPane chatScrollPane = new JScrollPane();
	private JScrollPane inputScrollPane = new JScrollPane();
	private JLabel friendSign = new JLabel();
	private JLabel friendRealNameLabel = new JLabel("好友真实姓名：");
	private JLabel friendRearNameTF = new JLabel();
	private JLabel friendBirthdayLabel = new JLabel("好友生日：");
	private JLabel friendBirthdayTF = new JLabel();
	private JLabel friendTeleLabel = new JLabel("好友电话：");
	private JLabel friendTeleTF = new JLabel();
	private JLabel friendMailboxLabel = new JLabel("好友邮箱：");
	private JLabel friendMailboxTF = new JLabel();
	
	//消息记录框
	private JPanel chatRecordPanel = new ImagePanel();
	private JTextArea chatRecordTA = new JTextArea();
	private JScrollPane chatRecordSP = new JScrollPane();
	
	//表情panel
	private JPanel facePanel = new ImagePanel();
	
	
	private ObjectInputStream ois ;
	
	//字体设置
	private JPanel fontPanel;
	private JComboBox fontType,fontSize;
	JCheckBox boldBx;//粗体按钮
	JCheckBox italicBx ;//斜体按钮
	JButton colorBtn ;//颜色按钮
	String[] fontNames;//字体名称
	String[] fontSizes;//字体尺寸
	
	public PrivateChatView(String friendName) {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		privateChatPanel = new ImagePanel("image/umbrella.jpg");
		friendPic = new ImagePanel("image/wolf.gif");
		this.setTitle("Private Chat");
		this.add(privateChatPanel);
		this.setSize(700,590);
		this.setLocation(200, 300);
		this.setResizable(false);
		privateChatPanel.setLayout(null);
		
//		try {
//			ois = new ObjectInputStream(new FileInputStream("e:\\record.txt"));
//		} catch (Exception e1) {
//			e1.printStackTrace();
//		}
		
		//好友头像
		
		friendPic.setBounds(10,10,65,65);
		privateChatPanel.add(friendPic);
		
		//好友名字
		friendNameLabel.setText(friendName);
		friendNameLabel.setBounds(90, 10, 200, 27);
		privateChatPanel.add(friendNameLabel);
		
		
		LineBorder friendInfoBorder = new LineBorder(Color.BLACK,0);
		//好友签名
		friendSign.setBounds(90, 40, 320, 45);
		
		
		friendSign.setOpaque(false);
		friendSign.setBorder(friendInfoBorder);
		privateChatPanel.add(friendSign);
		
		//好友信息
		friendRealNameLabel.setBounds(420, 130, 150, 27);
		friendRearNameTF.setBounds(510, 130, 160, 27);
		friendRearNameTF.setBorder(friendInfoBorder);
		friendBirthdayLabel.setBounds(420, 170, 150, 27);
		friendBirthdayTF.setBounds(510, 170, 160, 27);
		friendBirthdayTF.setBorder(friendInfoBorder);
		friendTeleLabel.setBounds(420, 210, 150, 27);
		friendTeleTF.setBounds(510, 210, 160, 27);
		friendTeleTF.setBorder(friendInfoBorder);
		friendMailboxLabel.setBounds(420, 250, 150, 27);
		friendMailboxTF.setBounds(510, 250, 160, 27);
		friendMailboxTF.setBorder(friendInfoBorder);
	
		privateChatPanel.add(friendRealNameLabel);
		privateChatPanel.add(friendRearNameTF);
		privateChatPanel.add(friendBirthdayLabel);
		privateChatPanel.add(friendBirthdayTF);
		privateChatPanel.add(friendTeleLabel);
		privateChatPanel.add(friendTeleTF);
		privateChatPanel.add(friendMailboxLabel);
		privateChatPanel.add(friendMailboxTF);
		
		//字体设置
		
		
		//聊天窗口
		chatScrollPane.setBounds(10, 90, 400, 275);
		chatScrollPane.setViewportView(chatTextArea);
		//chatScrollPane.setOpaque(false);
		chatTextArea.setEditable(false);
		chatTextArea.setBackground(new Color(255, 255, 255));
		LineBorder chatTextAreaLineBorder = new LineBorder(Color.BLACK, 1);
		//chatTextArea.setOpaque(false);//将窗口变成透明的
		//chatTextArea.setBorder(chatTextAreaLineBorder);
		privateChatPanel.add(chatScrollPane);
		
		//工具条
		privateChatMenuBar.setBounds(10, 400, 400, 27);
		privateChatMenuBar.setOpaque(false);
		privateChatPanel.add(privateChatMenuBar);
		privateChatMenuBar.add(characterFormat);
		privateChatMenuBar.add(picture);
		picture.setEnabled(false);
		fileTransfer.setEnabled(false);
		//item3.setEnabled(false);
		item4.setEnabled(false);
		item5.setEnabled(false);
		item6.setEnabled(false);
		
		privateChatMenuBar.add(printScreen);
		privateChatMenuBar.add(fileTransfer);
		privateChatMenuBar.add(item3);
		privateChatMenuBar.add(item4);
		privateChatMenuBar.add(item5);
		privateChatMenuBar.add(item6);
		privateChatMenuBar.add(messageRem);
		
		//聊天记录		
		
//		
//		privateChatMenuBar.add(item1);
//		privateChatMenuBar.add(item2);
//		privateChatMenuBar.add(item3);
//		privateChatMenuBar.add(item4);
//		privateChatMenuBar.add(item5);
//		privateChatMenuBar.add(item6);
//		privateChatMenuBar.add(messageRem);
//		

		//设置字体
		//字体设置
		fontPanel = new JPanel();
		GraphicsEnvironment ge=GraphicsEnvironment.getLocalGraphicsEnvironment();
		fontNames=ge.getAvailableFontFamilyNames();//获得系统中所有字体的名字
		fontType=new JComboBox(fontNames);
		fontType.setEditable(false);
		fontType.setMaximumRowCount(10);
		boldBx = new JCheckBox("粗体");
		italicBx = new JCheckBox("斜体");
		colorBtn = new JButton("颜色");
		//设置字体大小
		fontSizes=new String[63];
		for(int i=0;i<63;i++){
		   fontSizes[i]=Integer.toString((i+10));
		}
		fontSize=new JComboBox(fontSizes);
		fontSize.setEditable(false);
		fontSize.setMaximumRowCount(10);
		fontType.setBounds(0, 20, 90, 30);
		fontSize.setBounds(100, 20, 90, 30);
		boldBx.setBounds(200, 20, 60, 30);
		italicBx.setBounds(270, 20, 60, 30);
		colorBtn.setBounds(340, 20, 60, 30);

	    fontPanel.add(fontType);
		fontPanel.add(fontSize);
		fontPanel.add(boldBx);
		fontPanel.add(italicBx);
		fontPanel.add(colorBtn);
		
		//用户内容输入区域
		inputScrollPane.setBounds(10, 430, 400, 90);
		inputScrollPane.setViewportView(inputTextArea);
		inputTextArea.setBackground(new Color(255,255,255));
		LineBorder inputTextAreaLineBorder = new LineBorder(Color.BLACK, 0);
		inputTextArea.setOpaque(false);//将窗口变成透明的
		
		inputTextArea.setBorder(chatTextAreaLineBorder);
		privateChatPanel.add(inputScrollPane);
		
		//发送按钮
		sendButton.setBounds(330, 530, 80, 30);
		privateChatPanel.add(sendButton);
		
		//关闭按钮
		closeButton.setBounds(230, 530, 80, 30);
		privateChatPanel.add(closeButton);
		
		
		this.setVisible(true);
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		

	}

	public JMenu getFileTransfer() {
		return fileTransfer;
	}

	public void setFileTransfer(JMenu fileTransfer) {
		this.fileTransfer = fileTransfer;
	}

	public JPanel getFontPanel() {
		return fontPanel;
	}

	public void setFontPanel(JPanel fontPanel) {
		this.fontPanel = fontPanel;
	}

	public JComboBox getFontType() {
		return fontType;
	}

	public void setFontType(JComboBox fontType) {
		this.fontType = fontType;
	}

	public JComboBox getFontSize() {
		return fontSize;
	}

	public void setFontSize(JComboBox fontSize) {
		this.fontSize = fontSize;
	}

	public JCheckBox getBoldBx() {
		return boldBx;
	}

	public void setBoldBx(JCheckBox boldBx) {
		this.boldBx = boldBx;
	}

	public JCheckBox getItalicBx() {
		return italicBx;
	}

	public void setItalicBx(JCheckBox italicBx) {
		this.italicBx = italicBx;
	}

	public JButton getColorBtn() {
		return colorBtn;
	}

	public void setColorBtn(JButton colorBtn) {
		this.colorBtn = colorBtn;
	}

	public String[] getFontNames() {
		return fontNames;
	}

	public void setFontNames(String[] fontNames) {
		this.fontNames = fontNames;
	}

	public JPanel getPrivateChatPanel() {
		return privateChatPanel;
	}

	public void setPrivateChatPanel(JPanel privateChatPanel) {
		this.privateChatPanel = privateChatPanel;
	}

	public JPanel getFriendPic() {
		return friendPic;
	}

	public void setFriendPic(JPanel friendPic) {
		this.friendPic = friendPic;
	}

	public JTextArea getInputTextArea() {
		return inputTextArea;
	}

	public void setInputTextArea(JTextArea inputTextArea) {
		this.inputTextArea = inputTextArea;
	}

	public JTextArea getChatTextArea() {
		return chatTextArea;
	}

	public void setChatTextArea(JTextArea chatTextArea) {
		this.chatTextArea = chatTextArea;
	}

	public JLabel getFriendNameLabel() {
		return friendNameLabel;
	}

	public void setFriendNameLabel(JLabel friendNameLabel) {
		this.friendNameLabel = friendNameLabel;
	}

	public JButton getSendButton() {
		return sendButton;
	}

	public void setSendButton(JButton sendButton) {
		this.sendButton = sendButton;
	}

	public JButton getCloseButton() {
		return closeButton;
	}

	public void setCloseButton(JButton closeButton) {
		this.closeButton = closeButton;
	}

	public JMenuBar getPrivateChatMenuBar() {
		return privateChatMenuBar;
	}

	public void setPrivateChatMenuBar(JMenuBar privateChatMenuBar) {
		this.privateChatMenuBar = privateChatMenuBar;
	}

	public JMenu getCharacterFormat() {
		return characterFormat;
	}

	public void setCharacterFormat(JMenu characterFormat) {
		this.characterFormat = characterFormat;
	}

	public JMenu getPicture() {
		return picture;
	}

	public void setPicture(JMenu picture) {
		this.picture = picture;
	}

	public JMenu getMessageRem() {
		return messageRem;
	}

	public void setMessageRem(JMenu messageRem) {
		this.messageRem = messageRem;
	}
	
	public JScrollPane getChatScrollPane() {
		return chatScrollPane;
	}

	public void setChatScrollPane(JScrollPane chatScrollPane) {
		this.chatScrollPane = chatScrollPane;
	}

	public JScrollPane getInputScrollPane() {
		return inputScrollPane;
	}

	public void setInputScrollPane(JScrollPane inputScrollPane) {
		this.inputScrollPane = inputScrollPane;
	}

	public JLabel getFriendSign() {
		return friendSign;
	}

	public void setFriendSign(JLabel friendSign) {
		this.friendSign = friendSign;
	}

	public JLabel getFriendRealNameLabel() {
		return friendRealNameLabel;
	}

	public void setFriendRealNameLabel(JLabel friendRealNameLabel) {
		this.friendRealNameLabel = friendRealNameLabel;
	}

	public JLabel getFriendRearNameTF() {
		return friendRearNameTF;
	}

	public void setFriendRearNameTF(JLabel friendRearNameTF) {
		this.friendRearNameTF = friendRearNameTF;
	}

	public JLabel getFriendBirthdayLabel() {
		return friendBirthdayLabel;
	}

	public void setFriendBirthdayLabel(JLabel friendBirthdayLabel) {
		this.friendBirthdayLabel = friendBirthdayLabel;
	}

	public JLabel getFriendBirthdayTF() {
		return friendBirthdayTF;
	}

	public void setFriendBirthdayTF(JLabel friendBirthdayTF) {
		this.friendBirthdayTF = friendBirthdayTF;
	}

	public JLabel getFriendTeleLabel() {
		return friendTeleLabel;
	}

	public void setFriendTeleLabel(JLabel friendTeleLabel) {
		this.friendTeleLabel = friendTeleLabel;
	}

	public JLabel getFriendTeleTF() {
		return friendTeleTF;
	}

	public void setFriendTeleTF(JLabel friendTeleTF) {
		this.friendTeleTF = friendTeleTF;
	}

	public JLabel getFriendMailboxLabel() {
		return friendMailboxLabel;
	}

	public void setFriendMailboxLabel(JLabel friendMailboxLabel) {
		this.friendMailboxLabel = friendMailboxLabel;
	}

	public JLabel getFriendMailboxTF() {
		return friendMailboxTF;
	}

	public void setFriendMailboxTF(JLabel friendMailboxTF) {
		this.friendMailboxTF = friendMailboxTF;
	}

	public JPanel getChatRecordPanel() {
		return chatRecordPanel;
	}

	public void setChatRecordPanel(JPanel chatRecordPanel) {
		this.chatRecordPanel = chatRecordPanel;
	}

	public JTextArea getChatRecordTA() {
		return chatRecordTA;
	}

	public void setChatRecordTA(JTextArea chatRecordTA) {
		this.chatRecordTA = chatRecordTA;
	}

	public JScrollPane getChatRecordSP() {
		return chatRecordSP;
	}

	public void setChatRecordSP(JScrollPane chatRecordSP) {
		this.chatRecordSP = chatRecordSP;
	}
	
	public JMenu getItem3() {
		return item3;
	}

	public void setItem3(JMenu item3) {
		this.item3 = item3;
	}

	public static void main(String[] args){
		try {
			UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel"); 
			// UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
			//UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
		// TODO Auto-generated catch block
			e.printStackTrace();
		}
			new PrivateChatView("wuyanjun");
	}
	
}
