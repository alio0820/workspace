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
	private JButton createGbtn=new JButton("����Ⱥ");
	private JLabel groupLabel=new JLabel("Ⱥ����:");
	private JLabel contentLabel=new JLabel("Ⱥ���:");
	private JLabel groupWarn=new JLabel("1-4���ַ�");
	private JLabel newGroupId=new JLabel("��������Ⱥ�ţ�");
	private JLabel GId;
	public CreateGroupView(  String userId) throws Exception {
		this.userId=userId;
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		this.setTitle("����Ⱥ");
		this.setSize(300,300);
		this.setLocation(300, 300);
		
		this.add(createG);
		createG.setLayout(null);
		//Ⱥ����
		createG.add(groupLabel);
		groupLabel.setBounds(20, 50, 60, 20);
		//Ⱥ�����趨�ı���
		createG.add(newName);
		newName.setBounds(65, 50, 150, 25);
		//Ⱥ��ʾ�ַ�
		createG.add(groupWarn);
		groupWarn.setBounds(220,50, 80,30);
		
		createG.add(contentLabel);
		contentLabel.setBounds(20,80, 50, 20);
		//Ⱥ�����ı�����д
		createG.add(newContent);
		newContent.setBounds(65, 80, 200, 60);
		
		//Ⱥȷ��������ť
		createG.add(createGbtn);
		createGbtn.setBounds(100, 150, 80, 30);
		
		
		
		
	 	//��ť�ļ�����
	 	createGbtn.addActionListener(new ActionListener(){

			@Override
			public void actionPerformed(ActionEvent e) {
				//����Ⱥ����Ⱥ�Ų������ࡣ
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
						System.out.println(groupId+"�Ƿ����");
						createG.add(GId);
						GId.setBounds(175,200, 80, 30);
							}
						}
					else { JOptionPane.showMessageDialog(null, "������Ⱥ����", "����", JOptionPane.ERROR_MESSAGE);
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
