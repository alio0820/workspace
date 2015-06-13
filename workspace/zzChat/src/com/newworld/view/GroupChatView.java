package com.newworld.view;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.GraphicsEnvironment;
import java.awt.List;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;

import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JList;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JSplitPane;
import javax.swing.JTextArea;
import javax.swing.JTextPane;
import javax.swing.ListModel;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.LineBorder;

import com.new_world.operation.wordchange.GroupArtFont;
/**Design by littlePP @20120719
 * 
 */
@SuppressWarnings("serial")
public class GroupChatView extends JFrame{
	private JPanel groupChatViewPanel;
	private JTextArea inputTextArea = new JTextArea();
	private JTextArea chatTextArea = new JTextArea();
	private JTextArea recordTextArea = new JTextArea();
	private JButton sendButton = new JButton("发送");
	private JButton closeButton = new JButton("关闭");
	private JMenuBar privateChatMenuBar = new JMenuBar();
	private JMenu characterFormat = new JMenu("设置字体");
	private JButton a = new JButton("font");
	private JMenu picture = new JMenu("表情");
	private JMenu messageRem = new JMenu("消息记录");
	private JMenu printScreen = new JMenu("截取屏幕");
	private JMenu fileTranser = new JMenu("传送文件");
	private JMenu item3 = new JMenu("       ");
	private JMenu item4 = new JMenu("       ");
	private JMenu item5 = new JMenu("       ");
	private JMenu item6 = new JMenu("     ");
	private JPanel groupPic;
	private JLabel groupName = new JLabel();
	private JTextPane groupUserList = new JTextPane();
	
	private JScrollPane chatScrollPane = new JScrollPane();
	private JScrollPane inputScrollPane = new JScrollPane();
	
	private JSplitPane jsp;
	private JList groupUserInfoList;

	private String [] names = new String[100];
	private ArrayList<String> groupUserNames = new ArrayList<String>();
	
	
	private JPanel fontPanel;
	private JComboBox fontType,fontSize;
	JCheckBox boldBx;//粗体按钮
	JCheckBox italicBx ;//斜体按钮
	JButton colorBtn ;//颜色按钮
	String[] fontNames;//字体名称
	String[] fontSizes;//字体尺寸

	//消息记录框
	private JPanel chatRecordPanel = new ImagePanel();
	private JTextArea chatRecordTA = new JTextArea();
	private JScrollPane chatRecordSP = new JScrollPane();
	
	//群内容
	private JLabel groupIdLabel = new JLabel("群号码：");
	private JLabel groupIdlab = new JLabel();
	private JLabel groupContentLabel = new JLabel("群公告：");
	private JTextArea groupContentLab = new JTextArea();
	private JScrollPane groupContentSP = new JScrollPane();
	private JLabel groupNameLabel = new JLabel("群名称：");
	private JLabel groupNameLab = new JLabel();
	private DefaultListModel dlm = new DefaultListModel();
	
	public DefaultListModel getDlm() {
		return dlm;
	}


	public void setDlm(DefaultListModel dlm) {
		this.dlm = dlm;
	}


	public GroupChatView(String name) {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		this.setLocationRelativeTo(null);
		
		this.setLocation(400, 275);
		groupChatViewPanel = new ImagePanel("image/back.png");
		groupPic = new ImagePanel("image/wolf.gif");
		this.setTitle("Group Chat");
		this.add(groupChatViewPanel);
		this.setSize(700,590);
		this.setResizable(false);
		groupChatViewPanel.setLayout(null);
		
		groupName.setText(name);
		

		//群头像
		groupPic.setBounds(30,10,65,65);
		groupChatViewPanel.add(groupPic);
		
		//群名字
		groupName.setBounds(110, 10, 100, 20);
		groupChatViewPanel.add(groupName);
		
		//群信息
		groupIdLabel.setBounds(435, 80, 60, 27);
		groupIdlab.setBounds(500, 80, 120, 27);
		//groupIdlab.setText("4110");
		groupNameLabel.setBounds(435, 110, 60, 27);
		groupNameLab.setBounds(500, 110, 120, 27);
		//groupNameLab.setText("NewWorld");
		groupContentLabel.setBounds(435, 140, 60, 27);
		groupContentLab.setEditable(false);
		groupContentSP.setBounds(435, 180, 200, 175);
		groupContentSP.setViewportView(groupContentLab);
		groupChatViewPanel.add(groupIdLabel);
		groupChatViewPanel.add(groupIdlab);
		groupChatViewPanel.add(groupNameLabel);
		groupChatViewPanel.add(groupNameLab);
		groupChatViewPanel.add(groupContentLabel);
		groupChatViewPanel.add(groupContentSP);
		
		
		//聊天窗口
		chatScrollPane.setBounds(30, 80, 400, 275);
		chatScrollPane.setViewportView(chatTextArea);
		chatTextArea.setEditable(false);
		LineBorder chatTextAreaLineBorder = new LineBorder(Color.BLACK, 1);
		chatTextArea.setOpaque(false);//将窗口变成透明的
		chatTextArea.setBorder(chatTextAreaLineBorder);
		groupChatViewPanel.add(chatScrollPane);
		
		//工具条
		privateChatMenuBar.setBounds(30, 400, 400, 20);
		privateChatMenuBar.setOpaque(false);
		groupChatViewPanel.add(privateChatMenuBar);
		privateChatMenuBar.add(characterFormat);
		privateChatMenuBar.add(picture);
		picture.setEnabled(false);
		fileTranser.setEnabled(false);
		item3.setEnabled(false);
		item4.setEnabled(false);
		item5.setEnabled(false);
		item6.setEnabled(false);
		privateChatMenuBar.add(printScreen);
		privateChatMenuBar.add(fileTranser);
		privateChatMenuBar.add(item3);
		privateChatMenuBar.add(item4);
		privateChatMenuBar.add(item5);
		privateChatMenuBar.add(item6);
		privateChatMenuBar.add(messageRem);
		
		
		//用户内容输入区域
		inputScrollPane.setBounds(30,425, 400, 90);
		inputScrollPane.setViewportView(inputTextArea);
		LineBorder inputTextAreaLineBorder = new LineBorder(Color.BLACK, 1);
		inputTextArea.setOpaque(false);//将窗口变成透明的
		inputTextArea.setBorder(chatTextAreaLineBorder);
		groupChatViewPanel.add(inputScrollPane);
	
		
		
		groupUserInfoList = new JList(dlm);
		jsp =new JSplitPane(JSplitPane.HORIZONTAL_SPLIT,groupUserInfoList,groupChatViewPanel);
		jsp.setLocation(410, 0);
		jsp.setOneTouchExpandable(true);
		this.add(jsp);
		
		
		
		//发送按钮
		sendButton.setBounds(310, 520, 80, 25);
		groupChatViewPanel.add(sendButton);
		
		//关闭按钮
		closeButton.setBounds(210, 520, 80, 25);
		groupChatViewPanel.add(closeButton);
		
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
        
		this.setVisible(true);
		this.setDefaultCloseOperation(HIDE_ON_CLOSE);
			
		}
	
	
	public JMenu getFileTranser() {
		return fileTranser;
	}


	public void setFileTranser(JMenu fileTranser) {
		this.fileTranser = fileTranser;
	}


	public JLabel getGroupIdLabel() {
		return groupIdLabel;
	}


	public void setGroupIdLabel(JLabel groupIdLabel) {
		this.groupIdLabel = groupIdLabel;
	}


	public JLabel getGroupIdlab() {
		return groupIdlab;
	}


	public void setGroupIdlab(JLabel groupIdlab) {
		this.groupIdlab = groupIdlab;
	}


	public JLabel getGroupContentLabel() {
		return groupContentLabel;
	}


	public void setGroupContentLabel(JLabel groupContentLabel) {
		this.groupContentLabel = groupContentLabel;
	}


	public JTextArea getGroupContentLab() {
		return groupContentLab;
	}


	public void setGroupContentLab(JTextArea groupContentLab) {
		this.groupContentLab = groupContentLab;
	}


	public JLabel getGroupNameLabel() {
		return groupNameLabel;
	}


	public void setGroupNameLabel(JLabel groupNameLabel) {
		this.groupNameLabel = groupNameLabel;
	}


	public JLabel getGroupNameLab() {
		return groupNameLab;
	}


	public void setGroupNameLab(JLabel groupNameLab) {
		this.groupNameLab = groupNameLab;
	}


	public JPanel getChatRecordPanel() {
		return chatRecordPanel;
	}
	public void setChatRecordPanel(JPanel chatRecordPanel) {
		this.chatRecordPanel = chatRecordPanel;
	}
	public JScrollPane getGroupContentSP() {
		return groupContentSP;
	}


	public void setGroupContentSP(JScrollPane groupContentSP) {
		this.groupContentSP = groupContentSP;
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
	
	
	public JTextArea getRecordTextArea() {
		return recordTextArea;
	}
	public void setRecordTextArea(JTextArea recordTextArea) {
		this.recordTextArea = recordTextArea;
	}
	public JMenu getPrintScreen() {
		return printScreen;
	}
	public void setPrintScreen(JMenu printScreen) {
		this.printScreen = printScreen;
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
	public JSplitPane getJsp() {
		return jsp;
	}
	public void setJsp(JSplitPane jsp) {
		this.jsp = jsp;
	}
	public JList getGroupUserInfoList() {
		return groupUserInfoList;
	}
	public void setGroupUserInfoList(JList groupUserInfoList) {
		this.groupUserInfoList = groupUserInfoList;
	}
	public JCheckBox getItalicBx() {
		return italicBx;
	}
	public void setItalicBx(JCheckBox italicBx) {
		this.italicBx = italicBx;
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
	public String[] getFontSizes() {
		return fontSizes;
	}
	public void setFontSizes(String[] fontSizes) {
		this.fontSizes = fontSizes;
	}
	public String[] getNames() {
		return names;
	}

	public void setNames(String[] names) {
		this.names = names;
	}
	public ArrayList<String> getGroupUserNames() {
		return groupUserNames;
	}
	public void setGroupUserNames(ArrayList<String> groupUserNames) {
		this.groupUserNames = groupUserNames;
	}

	public JPanel getGroupChatViewPanel() {
		return groupChatViewPanel;
	}
	public void setGroupChatViewPanel(JPanel groupChatViewPanel) {
		this.groupChatViewPanel = groupChatViewPanel;
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
	public JPanel getGroupPic() {
		return groupPic;
	}
	public void setGroupPic(JPanel groupPic) {
		this.groupPic = groupPic;
	}
	public JLabel getGroupName() {
		return groupName;
	}
	public void setGroupName(JLabel groupName) {
		this.groupName = groupName;
	}
	public JTextPane getGroupUserList() {
		return groupUserList;
	}
	public void setGroupUserList(JTextPane groupUserList) {
		this.groupUserList = groupUserList;
	}
	
	
	public static void main(String[] args) throws   Exception {
		  UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
		new GroupChatView("西大");
	}
}
