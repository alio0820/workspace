package com.chinasoft;

import java.awt.FlowLayout;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;
import javax.swing.SwingConstants;

public class MyFrame extends JFrame {
	public MyFrame(String name){
		
		super(name);		
		this.setVisible(true);
		this.setSize(300, 400);
		this.setDefaultCloseOperation(MyFrame.EXIT_ON_CLOSE);
		Icon icon = new ImageIcon("d:\\jay1.jpg") ;
		this.setLayout(new FlowLayout());
		//this.getContentPane().setBackground(new Color(233,211,111));
		JButton jButton = new JButton();
		jButton.setText("1111");
		jButton.setIcon(icon);
		JLabel jLabel =  new JLabel(icon,SwingConstants.LEFT);
		JTextField jTextField = new JTextField();
		jTextField.setColumns(20);
		jLabel.setText("ccc");
		this.add(jButton);
		this.add(jLabel);
		this.add(jTextField);
	}
}
