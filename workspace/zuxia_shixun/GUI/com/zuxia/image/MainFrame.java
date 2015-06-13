package com.zuxia.image;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class MainFrame {

	private JFrame jfMain = new JFrame();
	private JPanel jpMain = new MyImagePanel();
	private JButton jbTest = new JButton("Test");
	
	public MainFrame(){
		jfMain.setBounds(200,200,400,300);
		jfMain.add(jpMain);
		jfMain.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		
		jpMain.add(jbTest);
		jfMain.setVisible(true);
	}
	public static void main(String[] args) {
		new MainFrame();
	}

}
