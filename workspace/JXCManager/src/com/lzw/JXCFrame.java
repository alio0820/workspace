package com.lzw;

import java.awt.BorderLayout;
import java.awt.Color;
import java.util.*;
import java.util.prefs.Preferences;
import javax.swing.*;

public class JXCFrame {
	private JDesktopPane desktopPane;
	private JFrame frame;
	private JLabel backLabel;
	private Preferences preferences;
	//创建窗体的Map类型集合对象
	private Map<String,JInternalFrame> ifs= new HashMap<String,JInternalFrame>();
	public JXCFrame(){
		frame = new JFrame("企业进销存管理系统");
//		frame.addComponentListener(new FrameListener());
		frame.getContentPane().setLayout(new BorderLayout());
		frame.setBounds(100,100,800,600);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		backLabel =new JLabel();
		backLabel.setVerticalAlignment(SwingConstants.TOP);
		backLabel.setHorizontalAlignment(SwingConstants.CENTER);
		updateBackImage();
		desktopPane =new JDesktopPane();
		desktopPane.add(backLabel,new Integer(Integer.MIN_VALUE));
		frame.getContentPane().add(desktopPane);
		JTabbedPane navigationPanel= createNavigationPanel();
		frame.getContentPane().add(navigationPanel,BorderLayout.NORTH);
		frame.setVisible(true);
	}
	private void updateBackImage(){
		if(backLabel!=null){
			int backw = JXCFrame.this.frame.getWidth();
			int backh = frame.getHeight();
			backLabel.setSize(backw,backh);
			backLabel.setText("<html><body><image width="+backw+"'height'"+(backh-110)+"src="+JXCFrame.this.getClass().getResource("welcome.jpg")+"></img></body></html>");
		}
	}
	static{
		try{
			UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
		}catch(Exception e){
			e.getStackTrace();
		}
	}
	public static void main(String[] args){
		SwingUtilities.invokeLater(new Runnable(){
			public void run(){
//				new Login();
			}
		});
	}
	//创建导航面板的方法
	private JTabbedPane createNavigationPanel(){
		JTabbedPane tabbedPane = new JTabbedPane();
		tabbedPane.setFocusable(false);
		tabbedPane.setBackground(new Color(211,230,192));
		return tabbedPane;
	}
}
