package com.zuxia.Frame;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JPanel;

public class TestNullLayout {
	private JFrame jfMain = new JFrame("ø’≤ºæ÷≤‚ ‘");
	private JPanel jpMain = new JPanel();
	private JButton jbTest =new JButton("≤‚ ‘");
	private JButton jbExit = new JButton("ÕÀ≥ˆ");
	
	public TestNullLayout(){
		jfMain.setSize(400, 300);
		jfMain.setLocationRelativeTo(null);
		jfMain.add(jpMain);
		jpMain.add(jbTest);
		
	}
}
