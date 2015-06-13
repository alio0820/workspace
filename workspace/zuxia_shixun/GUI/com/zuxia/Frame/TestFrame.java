package com.zuxia.Frame;
import javax.swing.*;
public class TestFrame {
	private JFrame jf= new JFrame();
	private JPanel jp = new JPanel();
	private JTextField jtf = new JTextField(20);
	private JButton  jb = new JButton("确定");
	private JPasswordField jpf = new JPasswordField(20);
	private JLabel jl = new JLabel("用户");
	private JRadioButton jrb =new JRadioButton();
	private JCheckBox jcb = new JCheckBox();
	private JMenuBar jmb = new JMenuBar();
	private JMenu jm = new JMenu("File");
	private JMenu jm2 = new JMenu("change");
	private JMenuItem jmi0 =new JMenuItem("1");
	private JMenuItem jmi = new JMenuItem("new");
	private JToolBar jtb =new JToolBar();
	private JTextArea jta = new JTextArea(100,200);
	public void add(){
		jf.setSize(600,350);
		jf.setVisible(true);
		jtb.add(jb);
		jf.add(jp);
		jp.add(jtf);
		jp.add(jb);
		jp.add(jpf);
		jp.add(jl);
		jm2.add(jmi0);
		jm.add(jmi);
		jm.add(jm2);
		jmb.add(jm);
		jf.add(jmb);
		jf.add(jtb);
		jp.add(jta);
	}
	public static void main(String[] args) {
		TestFrame test1  =new TestFrame();
		test1.add();
		
	}
}
