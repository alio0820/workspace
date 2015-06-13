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
	private JLabel userAccountLabel = new JLabel("帐号：");
	private JTextField userAccountTF = new JTextField();
	private JButton nextProcessBtn = new JButton("下一步"); 
	private JComboBox firstQuesCom = new JComboBox();
	private JComboBox secondQuesCom = new JComboBox();
	private JComboBox thirdQuesCom = new JComboBox();
	private JTextField firstQuesTF = new JTextField();
	private JTextField secondQuesTF = new JTextField();
	private JTextField thirdQuesTF = new JTextField();
	private JButton reSetTextBtn = new JButton("重置");
	private JButton confirmQuesBtn = new JButton("提交");
	private JButton cancelBtn = new JButton("取消");
	
	
	
	
	public pwdFindBackView() {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		this.setLocation(400, 400);
		pwdFindBackViewPanel = new ImagePanel("image/2.jpg");
		this.setSize(500, 300);
		this.setTitle("密码找回");
		this.setResizable(false);
		this.add(pwdFindBackViewPanel);
		pwdFindBackViewPanel.setLayout(null);
		
		
		//第一步输入帐号
		userAccountLabel.setBounds(60, 30, 60, 25);
		pwdFindBackViewPanel.add(userAccountLabel);
		userAccountTF.setBounds(110, 30, 200, 25);
		userAccountTF.setOpaque(false);
		pwdFindBackViewPanel.add(userAccountTF);
		nextProcessBtn.setBounds(320, 30, 100, 25);
		pwdFindBackViewPanel.add(nextProcessBtn);
		
		
		
		
		//第一问
		firstQuesCom.addItem("你爸爸的名字？");
		firstQuesCom.addItem("你妈妈的名字？");
		firstQuesCom.addItem("你男朋友的名字？");
		firstQuesCom.addItem("你女朋友的名字？");
		firstQuesCom.addItem("你高中班主任的名字？");
		firstQuesCom.setBounds(30, 80, 200, 25);
		firstQuesTF.setBounds(250, 80, 200, 25);
		firstQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(firstQuesTF);
		pwdFindBackViewPanel.add(firstQuesCom);
		//第二问
		secondQuesCom.addItem("你最喜欢的国家？");
		secondQuesCom.addItem("你最喜欢的歌手？");
		secondQuesCom.addItem("你最喜欢的明星？");
		secondQuesCom.setBounds(30, 120, 200, 25);
		secondQuesTF.setBounds(250, 120, 200, 25);
		secondQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(secondQuesTF);
		pwdFindBackViewPanel.add(secondQuesCom);
		//第三问
		thirdQuesCom.addItem("你最喜欢的游戏？");
		thirdQuesCom.addItem("你最喜欢吃的菜");
		thirdQuesCom.setBounds(30, 160, 200, 25);
		thirdQuesTF.setBounds(250, 160, 200, 25);
		thirdQuesTF.setOpaque(false);
		pwdFindBackViewPanel.add(thirdQuesTF);
		pwdFindBackViewPanel.add(thirdQuesCom);
		
		//重置按钮
		reSetTextBtn.setBounds(100, 200, 85, 30);
		pwdFindBackViewPanel.add(reSetTextBtn);
		
		//确认按钮
		confirmQuesBtn.setBounds(300, 200, 85, 30);
		pwdFindBackViewPanel.add(confirmQuesBtn);
		
		//取消按钮
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
