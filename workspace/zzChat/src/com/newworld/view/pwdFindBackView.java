package com.newworld.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JTextField;
import javax.swing.UIManager;
//Design by littlePP @20120720
public class pwdFindBackView extends JFrame {

	private JPanel pwdFindBackViewPanel;
	private JLabel userAccountLabel = new JLabel("�ʺţ�");
	private JTextField userAccountTF = new JTextField();
	private JButton nextProcessBtn = new JButton("��һ��"); 
	private JComboBox firstQuesCom = new JComboBox();
	private JComboBox secondQuesCom = new JComboBox();
	private JComboBox thirdQuesCom = new JComboBox();
	private JTextField firstQuesTF = new JTextField();
	private JTextField secondQuesTF = new JTextField();
	private JTextField thirdQuesTF = new JTextField();
	private JButton reSetTextBtn = new JButton("����");
	private JButton confirmQuesBtn = new JButton("�ύ");
	private JButton cancelBtn = new JButton("ȡ��");
	
	
	
	
	public pwdFindBackView() {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		this.setLocation(400, 400);
		pwdFindBackViewPanel = new ImagePanel("image/2.jpg");
		this.setSize(500, 300);
		this.setTitle("�����һ�");
		this.setResizable(false);
		this.add(pwdFindBackViewPanel);
		pwdFindBackViewPanel.setLayout(null);
		
		
		//��һ�������ʺ�
		userAccountLabel.setBounds(60, 30, 60, 25);
		pwdFindBackViewPanel.add(userAccountLabel);
		userAccountTF.setBounds(110, 30, 200, 25);
		userAccountTF.setOpaque(false);
		pwdFindBackViewPanel.add(userAccountTF);
		nextProcessBtn.setBounds(320, 30, 100, 25);
		pwdFindBackViewPanel.add(nextProcessBtn);
		
		
		
		
		//��һ��
		firstQuesCom.addItem("��ְֵ����֣�");
		firstQuesCom.addItem("����������֣�");
		firstQuesCom.addItem("�������ѵ����֣�");
		firstQuesCom.addItem("��Ů���ѵ����֣�");
		firstQuesCom.addItem("����а����ε����֣�");
		firstQuesCom.setBounds(30, 80, 200, 25);
		firstQuesTF.setBounds(250, 80, 200, 25);
		firstQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(firstQuesTF);
		pwdFindBackViewPanel.add(firstQuesCom);
		//�ڶ���
		secondQuesCom.addItem("����ϲ���Ĺ��ң�");
		secondQuesCom.addItem("����ϲ���ĸ��֣�");
		secondQuesCom.addItem("����ϲ�������ǣ�");
		secondQuesCom.setBounds(30, 120, 200, 25);
		secondQuesTF.setBounds(250, 120, 200, 25);
		secondQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(secondQuesTF);
		pwdFindBackViewPanel.add(secondQuesCom);
		//������
		thirdQuesCom.addItem("����ϲ������Ϸ��");
		thirdQuesCom.addItem("����ϲ���ԵĲ�");
		thirdQuesCom.setBounds(30, 160, 200, 25);
		thirdQuesTF.setBounds(250, 160, 200, 25);
		thirdQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(thirdQuesTF);
		pwdFindBackViewPanel.add(thirdQuesCom);
		
		//���ð�ť
		reSetTextBtn.setBounds(100, 200, 85, 30);
		pwdFindBackViewPanel.add(reSetTextBtn);
		
		//ȷ�ϰ�ť
		confirmQuesBtn.setBounds(300, 200, 85, 30);
		pwdFindBackViewPanel.add(confirmQuesBtn);
		
		//ȡ����ť
		cancelBtn.setBounds(200, 200, 85, 30);
		pwdFindBackViewPanel.add(cancelBtn);
		
		
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		this.setVisible(true);
		
	}

	
	public JButton getCancelBtn() {
		return cancelBtn;
	}


	public void setCancelBtn(JButton cancelBtn) {
		this.cancelBtn = cancelBtn;
	}


	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");  
			//UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
			//UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		new pwdFindBackView();
	}


	public JPanel getPwdFindBackViewPanel() {
		return pwdFindBackViewPanel;
	}


	public void setPwdFindBackViewPanel(JPanel pwdFindBackViewPanel) {
		this.pwdFindBackViewPanel = pwdFindBackViewPanel;
	}


	public JLabel getUserAccountLabel() {
		return userAccountLabel;
	}


	public void setUserAccountLabel(JLabel userAccountLabel) {
		this.userAccountLabel = userAccountLabel;
	}


	public JTextField getUserAccountTF() {
		return userAccountTF;
	}


	public void setUserAccountTF(JTextField userAccountTF) {
		this.userAccountTF = userAccountTF;
	}


	public JButton getNextProcessBtn() {
		return nextProcessBtn;
	}


	public void setNextProcessBtn(JButton nextProcessBtn) {
		this.nextProcessBtn = nextProcessBtn;
	}


	public JComboBox getFirstQuesCom() {
		return firstQuesCom;
	}


	public void setFirstQuesCom(JComboBox firstQuesCom) {
		this.firstQuesCom = firstQuesCom;
	}


	public JComboBox getSecondQuesCom() {
		return secondQuesCom;
	}


	public void setSecondQuesCom(JComboBox secondQuesCom) {
		this.secondQuesCom = secondQuesCom;
	}


	public JComboBox getThirdQuesCom() {
		return thirdQuesCom;
	}


	public void setThirdQuesCom(JComboBox thirdQuesCom) {
		this.thirdQuesCom = thirdQuesCom;
	}


	public JTextField getFirstQuesTF() {
		return firstQuesTF;
	}


	public void setFirstQuesTF(JTextField firstQuesTF) {
		this.firstQuesTF = firstQuesTF;
	}


	public JTextField getSecondQuesTF() {
		return secondQuesTF;
	}


	public void setSecondQuesTF(JTextField secondQuesTF) {
		this.secondQuesTF = secondQuesTF;
	}


	public JTextField getThirdQuesTF() {
		return thirdQuesTF;
	}


	public void setThirdQuesTF(JTextField thirdQuesTF) {
		this.thirdQuesTF = thirdQuesTF;
	}


	public JButton getReSetTextBtn() {
		return reSetTextBtn;
	}


	public void setReSetTextBtn(JButton reSetTextBtn) {
		this.reSetTextBtn = reSetTextBtn;
	}


	public JButton getConfirmQuesBtn() {
		return confirmQuesBtn;
	}


	public void setConfirmQuesBtn(JButton confirmQuesBtn) {
		this.confirmQuesBtn = confirmQuesBtn;
	}

	
	
	
}
