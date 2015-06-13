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
	private JButton jbLogin = new JButton("��¼");
	private JButton jbSet = new JButton("����");
	private JButton jbDuo = new JButton("���˺�");
	private JCheckBox jrbPass =new JCheckBox("��ס����");
	private JCheckBox jrbLogin = new JCheckBox("�Զ���¼");
	private JLabel jlZhuce = new JLabel("<html><div style='background:white'><a href='#' style='color:lightblue'>ע���˺�</a></div></html>");
	private JLabel jlZhaopwd = new JLabel("<html><div style='background:white'><a href='#' style='color:lightblue'>�һ�����</a></div></html>");
	private JTextField jtfUserName = new JTextField(20);
	private JPasswordField jpfPwd = new JPasswordField(20);
	private JComboBox jcb = new JComboBox();
	public TestFrame(){
		jfMain.setResizable(false);
		jpMain.setLayout(null);				//��������layoutΪnull
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
		jcb.addItem("����");
		jcb.addItem("����");
		jcb.addItem("æµ");
		jcb.addItem("����");
		
		jfMain.setVisible(true);
	}
	
	public static void main(String[] args) {
		new TestFrame();
	}
}
