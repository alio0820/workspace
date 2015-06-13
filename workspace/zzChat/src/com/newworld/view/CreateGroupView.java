package com.newworld.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import com.new_world.operation.addFriend.CreateGroup;

public class CreateGroupView extends JFrame{
	private int groupId;
	private String newgroupName;
	private String groupContent;
	private static String userId;
	private JPanel createG=new ImagePanel("image/qun.jpg");
	private JTextField newName=new JTextField(20);
	private JTextArea newContent=new JTextArea();
	private JButton createGbtn=new JButton("创建群");
	private JLabel groupLabel=new JLabel("群名称:");
	private JLabel contentLabel=new JLabel("群简介:");
	private JLabel groupWarn=new JLabel("1-4个字符");
	private JLabel newGroupId=new JLabel("您创建了群号：");
	private JLabel GId;
	public CreateGroupView(  String userId) throws Exception {
		this.userId=userId;
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		this.setTitle("创建群");
		this.setSize(300,300);
		this.setLocation(300, 300);
		
		this.add(createG);
		createG.setLayout(null);
		//群名称
		createG.add(groupLabel);
		groupLabel.setBounds(20, 50, 60, 20);
		//群名称设定文本框
		createG.add(newName);
		newName.setBounds(65, 50, 150, 25);
		//群提示字符
		createG.add(groupWarn);
		groupWarn.setBounds(220,50, 80,30);
		
		createG.add(contentLabel);
		contentLabel.setBounds(20,80, 50, 20);
		//群介绍文本框填写
		createG.add(newContent);
		newContent.setBounds(65, 80, 200, 60);
		
		//群确定建立按钮
		createG.add(createGbtn);
		createGbtn.setBounds(100, 150, 80, 30);
		
		
		
		
	 	//按钮的监听器
	 	createGbtn.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				//创建群给出群号并调用类。
			 	try {
			 		if(newContent.getText()!=null){
				 		groupContent=newContent.getText();
				 		newgroupName=newName.getText();
						
				 		groupId=new CreateGroup(CreateGroupView.userId).getGroupId(newgroupName,groupContent );
						if(groupId!=0)
						{
						createG.add(newGroupId);
						newGroupId.setBounds(70, 200, 100, 30);
						
						GId=new JLabel(""+groupId);
						System.out.println(groupId+"是否存在");
						createG.add(GId);
						GId.setBounds(175,200, 80, 30);
							}
						}
					else { JOptionPane.showMessageDialog(null, "请输入群名！", "错误", JOptionPane.ERROR_MESSAGE);
					}
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
	 		
	 	});
	 	
		this.setVisible(true);
		this.setResizable(false);
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	}
}
