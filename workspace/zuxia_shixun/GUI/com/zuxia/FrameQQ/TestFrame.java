package com.zuxia.FrameQQ;

import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;

public class TestFrame{

	private JFrame jfMain = new JFrame("QQ2046");
	private JPanel jpMain = new QQFrame();
	private JButton jbLogin = new JButton("登录");
	private JButton jbSet = new JButton("设置");
	private JButton jbDuo = new JButton("多账号");
	private JCheckBox jrbPass =new JCheckBox("记住密码");
	private JCheckBox jrbLogin = new JCheckBox("自动登录");
	private JLabel jlZhuce = new JLabel("<html><div style='background:white'><a href='#' style='color:lightblue'>注册账号</a></div></html>");
	private JLabel jlZhaopwd = new JLabel("<html><div style='background:white'><a href='#' style='color:lightblue'>找回密码</a></div></html>");
	private JTextField jtfUserName = new JTextField(20);
	private JPasswordField jpfPwd = new JPasswordField(20);
	private JComboBox jcb = new JComboBox();
	public TestFrame(){
		jfMain.setResizable(false);
		jpMain.setLayout(null);				//设置面板的layout为null
		jpMain.addMouseListener(new MouseAdapter() {
			public void mouseReleased(MouseEvent e){
				System.out.println(e.getX()+","+e.getY());
			}
		});
		jfMain.addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e){
				System.exit(0);
			}
		});
		
		jfMain.setBounds(200,200,385,305);
		jfMain.add(jpMain);
		
		jfMain.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);				
		
		jpMain.add(jtfUserName);
		jtfUserName.setBounds(112, 142, 190, 25);
		
		jpMain.add(jpfPwd);
		jpfPwd.setBounds(112, 176, 190, 25);
		
		jpMain.add(jbLogin);
		jbLogin.setBounds(302, 249, 70, 25);
		
		jpMain.add(jbSet);
		jbSet.setBounds(82, 249, 70, 25);
		
		jpMain.add(jbDuo);
		jbDuo.setBounds(5, 249, 73, 25);
		
		jpMain.add(jrbPass);
		jrbPass.setBounds(156, 211, 80, 25);
		
		jpMain.add(jrbLogin);
		jrbLogin.setBounds(236, 211, 80, 25);
		
		jpMain.add(jlZhuce);
		jlZhuce.setBounds(313, 143, 80, 25);
		
		jpMain.add(jlZhaopwd);
		jlZhaopwd.setBounds(313, 175, 80, 25);
		
		jpMain.add(jcb);
		jcb.setBounds(112, 212, 40, 18);
		jcb.addItem("在线");
		jcb.addItem("隐身");
		jcb.addItem("忙碌");
		jcb.addItem("离线");
		
		jfMain.setVisible(true);
	}
	
	public static void main(String[] args) {
		new TestFrame();
	}
}
