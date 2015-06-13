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
	private JFrame jFrame=new JFrame("��ӭע��ZZChat");
	private JPanel regMainPanel=new ImagePanel("image/backreg.png");
	private JTextField nameReg=new JTextField();
	private JComboBox birthYearCom=new JComboBox();
	private JComboBox birthMonthCom=new JComboBox();
	private JComboBox birthDayCom=new JComboBox();
	private JLabel welcLabel=new JLabel("��ӭע��ZZChat");
	private JLabel nikeNameLabel=new JLabel("�ǳ�:");
	private JLabel passLabel=new JLabel("����:");
	private JLabel passCueLabel=new JLabel ("<html><font color='red'>6-16���ַ�</font></html>");
	private JLabel passSureLabel=new JLabel("ȷ������:");
	private JLabel passSureCueLabel=new JLabel ("<html><font color='red'>���벻һ��</font></html>");
	private JLabel sexLabel=new JLabel("�Ա�:");
	private JLabel birthLabel=new JLabel("����:");
	private JRadioButton famaleRadio=new JRadioButton("Ů");
	private JRadioButton maleRadio=new JRadioButton("��");
	private ButtonGroup sexGrp=new ButtonGroup();
	private JLabel nameWarnLabel=new JLabel("<html><font color='red'>�ǳƲ���Ϊ�ջ������λ��</font></html>");
	private JPasswordField passwordReg=new JPasswordField();
	private JPasswordField passSureReg=new JPasswordField();
	private JCheckBox sureBox=new JCheckBox("�������New World.ZZChat����");
	private JButton sureRegBtn=new JButton("����ע��");
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
		
		//m����label��nikeNameLabel
		nikeNameLabel.setBounds(120, 100, 50, 30);
		regMainPanel.add(nikeNameLabel);
		//�����ı���nameReg
		nameReg.setBounds(150, 100, 200, 30);
		nameReg.setBackground(new Color(251,243,233));
		//nameReg.setBorder(new LineBorder(Color.gray));
		regMainPanel.add(nameReg);
		//�ǳ���ʾ
		nameWarnLabel.setBounds(370,100,120,30);
		regMainPanel.add(nameWarnLabel);
		//����label��passLabel
		passLabel.setBounds(120, 140, 50, 30);
		regMainPanel.add(passLabel);
		//�����ı��� ��passwordReg
		passwordReg.setBounds(150, 140, 200, 30);
		passwordReg.setBackground(new Color(251,243,233));
		regMainPanel.add(passwordReg);
		//������ʾ
		passCueLabel.setBounds(370, 140, 80, 30);
		regMainPanel.add(passCueLabel);
		//ȷ������label,
		passSureLabel.setBounds(90, 180, 200,30);
		regMainPanel.add(passSureLabel);
		//ȷ�������passSureReg
		passSureReg.setBounds(150, 180, 200, 30);
		passSureReg.setBackground(new Color(251,243,233));
		regMainPanel.add(passSureReg);
		//ȷ��������ʾ
		passSureCueLabel.setBounds(370, 180, 200, 30);
		regMainPanel.add(passSureCueLabel);
		//�Ա�Label��sexLabel
		sexLabel.setBounds(120, 215, 50, 30);
		regMainPanel.add(sexLabel);
		//�Ա�radioButton��famaleRadio
		maleRadio.setBounds(150, 220, 40, 20);
		famaleRadio.setBounds(220, 220, 40, 20);
		maleRadio.setOpaque(false);
		famaleRadio.setOpaque(false);
		regMainPanel.add(famaleRadio);
		regMainPanel.add(maleRadio); 
		//����
		birthLabel.setBounds(120, 240, 50, 30);
		regMainPanel.add(birthLabel);
		//����com���
		birthYearCom.addItem("��");
		birthYearCom.addItem(" 1980��");
		birthYearCom.addItem(" 1981��");
		birthYearCom.addItem(" 1982��");
		birthYearCom.addItem(" 1983��");
		birthYearCom.addItem(" 1984��");
		birthYearCom.addItem(" 1985��");
		birthYearCom.addItem(" 1986��");
		birthYearCom.addItem(" 1987��");
		birthYearCom.addItem(" 1988��");
		birthYearCom.addItem(" 1989��");
		birthYearCom.addItem(" 1990��");
		birthYearCom.addItem(" 1991��");
		birthYearCom.addItem(" 1992��");
		birthYearCom.addItem(" 1993��");
		birthYearCom.addItem(" 1994��");
		birthYearCom.addItem(" 1995��");
		birthYearCom.addItem(" 1996��");
		birthYearCom.addItem(" 1997��");
		birthYearCom.addItem(" 1998��");
		birthYearCom.addItem(" 1999��");
		birthYearCom.addItem(" 2001��");
		birthYearCom.addItem(" 2002��");
		birthYearCom.addItem(" 2003��");
		birthYearCom.addItem(" 2004��");
		birthYearCom.addItem(" 2005��");
		birthYearCom.setBounds(150, 240, 80, 30);
		birthYearCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthYearCom);
		//�����·�
		birthMonthCom.addItem("��");
		birthMonthCom.addItem(" 1�� ");
		birthMonthCom.addItem(" 2�� ");
		birthMonthCom.addItem(" 3�� ");
		birthMonthCom.addItem(" 4�� ");
		birthMonthCom.addItem(" 5�� ");
		birthMonthCom.addItem(" 6�� ");
		birthMonthCom.addItem(" 7�� ");
		birthMonthCom.addItem(" 8�� ");
		birthMonthCom.addItem(" 9�� ");
		birthMonthCom.addItem(" 10�� ");
		birthMonthCom.addItem(" 11�� ");
		birthMonthCom.addItem(" 12�� ");
		birthMonthCom.setBounds(235, 240, 70, 30);

		birthMonthCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthMonthCom);
		//���� ����
		birthDayCom.addItem("��");
		birthDayCom.addItem("1��");
		birthDayCom.addItem("2��");
		birthDayCom.addItem("3��");
		birthDayCom.addItem("4��");
		birthDayCom.addItem("5��");
		birthDayCom.addItem("6��");
		birthDayCom.addItem("7��");
		birthDayCom.addItem("8��");
		birthDayCom.addItem("9��");
		birthDayCom.addItem("10��");
		birthDayCom.addItem("11��");
		birthDayCom.addItem("12��");
		birthDayCom.addItem("13��");
		birthDayCom.addItem("14��");
		birthDayCom.addItem("15��");
		birthDayCom.addItem("16��");
		birthDayCom.addItem("17��");
		birthDayCom.addItem("18��");
		birthDayCom.addItem("19��");
		birthDayCom.addItem("20��");
		birthDayCom.addItem("21��");
		birthDayCom.addItem("22��");
		birthDayCom.addItem("23��");
		birthDayCom.addItem("24��");
		birthDayCom.addItem("25��");
		birthDayCom.addItem("26��");
		birthDayCom.addItem("27��");
		birthDayCom.addItem("28��");
		birthDayCom.addItem("29��");
		birthDayCom.addItem("30��");
		birthDayCom.addItem("31��");
		birthDayCom.setBounds(310, 240, 60, 30);
		birthDayCom.setBackground(new Color(209,235,246));
		regMainPanel.add(birthDayCom);
		 //�汾ȷ��ѡ���
		sureBox.setBounds(140, 270, 310,50);
		sureBox.setOpaque(false);
		regMainPanel.add(sureBox);
		//����ע�ᰴť
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
