package com.newworld.view;

import java.awt.Color;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.LineBorder;
 

public class RegisterView extends JFrame{
	private JFrame jFrame=new JFrame("欢迎注册ZZChat");
	private JPanel regMainPanel=new ImagePanel("image/backreg.png");
	private JTextField nameReg=new JTextField();
	private JComboBox birthYearCom=new JComboBox();
	private JComboBox birthMonthCom=new JComboBox();
	private JComboBox birthDayCom=new JComboBox();
	private JLabel welcLabel=new JLabel("欢迎注册ZZChat");
	private JLabel nikeNameLabel=new JLabel("昵称:");
	private JLabel passLabel=new JLabel("密码:");
	private JLabel passCueLabel=new JLabel ("<html><font color='red'>6-16个字符</font></html>");
	private JLabel passSureLabel=new JLabel("确认密码:");
	private JLabel passSureCueLabel=new JLabel ("<html><font color='red'>密码不一致</font></html>");
	private JLabel sexLabel=new JLabel("性别:");
	private JLabel birthLabel=new JLabel("生日:");
	private JRadioButton famaleRadio=new JRadioButton("女");
	private JRadioButton maleRadio=new JRadioButton("男");
	private ButtonGroup sexGrp=new ButtonGroup();
	private JLabel nameWarnLabel=new JLabel("<html><font color='red'>昵称不能为空或多余六位！</font></html>");
	private JPasswordField passwordReg=new JPasswordField();
	private JPasswordField passSureReg=new JPasswordField();
	private JCheckBox sureBox=new JCheckBox("本软件由New World.ZZChat制作");
	private JButton sureRegBtn=new JButton("立即注册");
//	private JTabbedPane regPane=new JTabbedPane(2);
	public RegisterView(){
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		jFrame.setIconImage(image.getImage());
		jFrame.setBounds(350, 300, 531, 443);
		regMainPanel.setLayout(null);
		//regMainPanel.add(regPane);
		jFrame.add(regMainPanel);
		//
		sexGrp.add(famaleRadio);
		sexGrp.add(maleRadio);
		
		//m名字label，nikeNameLabel
		nikeNameLabel.setBounds(120, 100, 50, 30);
		regMainPanel.add(nikeNameLabel);
		//名字文本框nameReg
		nameReg.setBounds(150, 100, 200, 30);
		nameReg.setBackground(new Color(251,243,233));
		//nameReg.setBorder(new LineBorder(Color.gray));
		regMainPanel.add(nameReg);
		//昵称提示
		nameWarnLabel.setBounds(370,100,120,30);
		regMainPanel.add(nameWarnLabel);
		//密码label，passLabel
		passLabel.setBounds(120, 140, 50, 30);
		regMainPanel.add(passLabel);
		//密码文本框 ，passwordReg
		passwordReg.setBounds(150, 140, 200, 30);
		passwordReg.setBackground(new Color(251,243,233));
		regMainPanel.add(passwordReg);
		//密码提示
		passCueLabel.setBounds(370, 140, 80, 30);
		regMainPanel.add(passCueLabel);
		//确认密码label,
		passSureLabel.setBounds(90, 180, 200,30);
		regMainPanel.add(passSureLabel);
		//确认密码框。passSureReg
		passSureReg.setBounds(150, 180, 200, 30);
		passSureReg.setBackground(new Color(251,243,233));
		regMainPanel.add(passSureReg);
		//确认密码提示
		passSureCueLabel.setBounds(370, 180, 200, 30);
		regMainPanel.add(passSureCueLabel);
		//性别Label，sexLabel
		sexLabel.setBounds(120, 215, 50, 30);
		regMainPanel.add(sexLabel);
		//性别radioButton，famaleRadio
		maleRadio.setBounds(150, 220, 40, 20);
		famaleRadio.setBounds(220, 220, 40, 20);
		maleRadio.setOpaque(false);
		famaleRadio.setOpaque(false);
		regMainPanel.add(famaleRadio);
		regMainPanel.add(maleRadio); 
		//生日
		birthLabel.setBounds(120, 240, 50, 30);
		regMainPanel.add(birthLabel);
		//生日com组件
		birthYearCom.addItem("年");
		birthYearCom.addItem(" 1980年");
		birthYearCom.addItem(" 1981年");
		birthYearCom.addItem(" 1982年");
		birthYearCom.addItem(" 1983年");
		birthYearCom.addItem(" 1984年");
		birthYearCom.addItem(" 1985年");
		birthYearCom.addItem(" 1986年");
		birthYearCom.addItem(" 1987年");
		birthYearCom.addItem(" 1988年");
		birthYearCom.addItem(" 1989年");
		birthYearCom.addItem(" 1990年");
		birthYearCom.addItem(" 1991年");
		birthYearCom.addItem(" 1992年");
		birthYearCom.addItem(" 1993年");
		birthYearCom.addItem(" 1994年");
		birthYearCom.addItem(" 1995年");
		birthYearCom.addItem(" 1996年");
		birthYearCom.addItem(" 1997年");
		birthYearCom.addItem(" 1998年");
		birthYearCom.addItem(" 1999年");
		birthYearCom.addItem(" 2001年");
		birthYearCom.addItem(" 2002年");
		birthYearCom.addItem(" 2003年");
		birthYearCom.addItem(" 2004年");
		birthYearCom.addItem(" 2005年");
		birthYearCom.setBounds(150, 240, 80, 30);
		birthYearCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthYearCom);
		//生日月份
		birthMonthCom.addItem("月");
		birthMonthCom.addItem(" 1月 ");
		birthMonthCom.addItem(" 2月 ");
		birthMonthCom.addItem(" 3月 ");
		birthMonthCom.addItem(" 4月 ");
		birthMonthCom.addItem(" 5月 ");
		birthMonthCom.addItem(" 6月 ");
		birthMonthCom.addItem(" 7月 ");
		birthMonthCom.addItem(" 8月 ");
		birthMonthCom.addItem(" 9月 ");
		birthMonthCom.addItem(" 10月 ");
		birthMonthCom.addItem(" 11月 ");
		birthMonthCom.addItem(" 12月 ");
		birthMonthCom.setBounds(235, 240, 70, 30);

		birthMonthCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthMonthCom);
		//生日 日期
		birthDayCom.addItem("日");
		birthDayCom.addItem("1日");
		birthDayCom.addItem("2日");
		birthDayCom.addItem("3日");
		birthDayCom.addItem("4日");
		birthDayCom.addItem("5日");
		birthDayCom.addItem("6日");
		birthDayCom.addItem("7日");
		birthDayCom.addItem("8日");
		birthDayCom.addItem("9日");
		birthDayCom.addItem("10日");
		birthDayCom.addItem("11日");
		birthDayCom.addItem("12日");
		birthDayCom.addItem("13日");
		birthDayCom.addItem("14日");
		birthDayCom.addItem("15日");
		birthDayCom.addItem("16日");
		birthDayCom.addItem("17日");
		birthDayCom.addItem("18日");
		birthDayCom.addItem("19日");
		birthDayCom.addItem("20日");
		birthDayCom.addItem("21日");
		birthDayCom.addItem("22日");
		birthDayCom.addItem("23日");
		birthDayCom.addItem("24日");
		birthDayCom.addItem("25日");
		birthDayCom.addItem("26日");
		birthDayCom.addItem("27日");
		birthDayCom.addItem("28日");
		birthDayCom.addItem("29日");
		birthDayCom.addItem("30日");
		birthDayCom.addItem("31日");
		birthDayCom.setBounds(310, 240, 60, 30);
		birthDayCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthDayCom);
		 //版本确认选择框
		sureBox.setBounds(140, 270, 310,50);
		sureBox.setOpaque(false);
		regMainPanel.add(sureBox);
		//立即注册按钮
		sureRegBtn.setBounds(200, 320, 100, 50);
		sureRegBtn.setBackground(new Color(181,220,229));
		regMainPanel.add(sureRegBtn);
		jFrame.setVisible(true);
		jFrame.setResizable(false);
		jFrame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	}
	public static void main(String[] args) throws Exception {
		UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel"); 
		// UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
		//UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
	}
	public JFrame getjFrame() {
		return jFrame;
	}
	public void setjFrame(JFrame jFrame) {
		this.jFrame = jFrame;
	}
	public JPanel getRegMainPanel() {
		return regMainPanel;
	}
	public void setRegMainPanel(JPanel regMainPanel) {
		this.regMainPanel = regMainPanel;
	}
	public JTextField getNameReg() {
		return nameReg;
	}
	public void setNameReg(JTextField nameReg) {
		this.nameReg = nameReg;
	}
	public JComboBox getBirthYearCom() {
		return birthYearCom;
	}
	public void setBirthYearCom(JComboBox birthYearCom) {
		this.birthYearCom = birthYearCom;
	}
	public JComboBox getBirthMonthCom() {
		return birthMonthCom;
	}
	public void setBirthMonthCom(JComboBox birthMonthCom) {
		this.birthMonthCom = birthMonthCom;
	}
	public JComboBox getBirthDayCom() {
		return birthDayCom;
	}
	public void setBirthDayCom(JComboBox birthDayCom) {
		this.birthDayCom = birthDayCom;
	}
	public JLabel getWelcLabel() {
		return welcLabel;
	}
	public void setWelcLabel(JLabel welcLabel) {
		this.welcLabel = welcLabel;
	}
	public JLabel getNikeNameLabel() {
		return nikeNameLabel;
	}
	public void setNikeNameLabel(JLabel nikeNameLabel) {
		this.nikeNameLabel = nikeNameLabel;
	}
	public JLabel getPassLabel() {
		return passLabel;
	}
	public void setPassLabel(JLabel passLabel) {
		this.passLabel = passLabel;
	}
	public JLabel getPassCueLabel() {
		return passCueLabel;
	}
	public void setPassCueLabel(JLabel passCueLabel) {
		this.passCueLabel = passCueLabel;
	}
	public JLabel getPassSureLabel() {
		return passSureLabel;
	}
	public void setPassSureLabel(JLabel passSureLabel) {
		this.passSureLabel = passSureLabel;
	}
	public JLabel getPassSureCueLabel() {
		return passSureCueLabel;
	}
	public void setPassSureCueLabel(JLabel passSureCueLabel) {
		this.passSureCueLabel = passSureCueLabel;
	}
	public JLabel getSexLabel() {
		return sexLabel;
	}
	public void setSexLabel(JLabel sexLabel) {
		this.sexLabel = sexLabel;
	}
	public JLabel getBirthLabel() {
		return birthLabel;
	}
	public void setBirthLabel(JLabel birthLabel) {
		this.birthLabel = birthLabel;
	}
	public JRadioButton getFamaleRadio() {
		return famaleRadio;
	}
	public void setFamaleRadio(JRadioButton famaleRadio) {
		this.famaleRadio = famaleRadio;
	}
	public JRadioButton getMaleRadio() {
		return maleRadio;
	}
	public void setMaleRadio(JRadioButton maleRadio) {
		this.maleRadio = maleRadio;
	}
	public ButtonGroup getSexGrp() {
		return sexGrp;
	}
	public void setSexGrp(ButtonGroup sexGrp) {
		this.sexGrp = sexGrp;
	}
	public JLabel getNameWarnLabel() {
		return nameWarnLabel;
	}
	public void setNameWarnLabel(JLabel nameWarnLabel) {
		this.nameWarnLabel = nameWarnLabel;
	}
	public JPasswordField getPasswordReg() {
		return passwordReg;
	}
	public void setPasswordReg(JPasswordField passwordReg) {
		this.passwordReg = passwordReg;
	}
	public JPasswordField getPassSureReg() {
		return passSureReg;
	}
	public void setPassSureReg(JPasswordField passSureReg) {
		this.passSureReg = passSureReg;
	}
	public JCheckBox getSureBox() {
		return sureBox;
	}
	public void setSureBox(JCheckBox sureBox) {
		this.sureBox = sureBox;
	}
	public JButton getSureRegBtn() {
		return sureRegBtn;
	}
	public void setSureRegBtn(JButton sureRegBtn) {
		this.sureRegBtn = sureRegBtn;
	}

	
	
	
}
