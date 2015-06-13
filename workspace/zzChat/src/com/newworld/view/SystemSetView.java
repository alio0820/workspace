package com.newworld.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JRadioButton;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
//Design by littlePP @20120719
public class SystemSetView extends JFrame {
	//panel
	private JTabbedPane sysSetTP = new JTabbedPane(2);
	private JPanel systemSetViewPanel;
	private JPanel commonPanel;
	private JPanel hotKeyPanel;
	private JPanel fileManagerPanel;
	private JPanel securityPanel;
	//��������
	private JLabel closeOperationLabel = new JLabel("�ر������ʱ��");
	private ButtonGroup closeOperationBG = new ButtonGroup();
	private JRadioButton closeAndHideRB = new JRadioButton("���ص�������֪ͨ���򣬲��˳�����");
	private JRadioButton closeAndExitRB = new JRadioButton("�˳�����");
	private JLabel loginStatusLabel = new JLabel("��¼״̬��");
	private ButtonGroup loginStatusBG = new ButtonGroup();
	private JRadioButton onLineRB = new JRadioButton("����");
	private JRadioButton leaveRB = new JRadioButton("�뿪");
	private JRadioButton invisibleRB = new JRadioButton("����");
	private JRadioButton busyRB = new JRadioButton("æµ");
	//�ȼ�����
	private JLabel accelerateKeyLabel = new JLabel("������Ϣ���ټ���");
	private ButtonGroup accelerateKeyBG = new ButtonGroup();
	private JRadioButton enterPressRB = new JRadioButton("��ENTER��");
	private JRadioButton enterAndCtrlPressRB = new JRadioButton("��ENTER+CTRL��");
	//�ļ�����
	private JLabel chatFileSaveLabel = new JLabel("�����ļ������ڱ���������Ϣ��¼��ͼƬ������");
	private JButton chatFileSaveBtn = new JButton("�򿪸����ļ���");
	private ButtonGroup fileSaveBG = new ButtonGroup();
	private JRadioButton defaultFileFolderRB = new JRadioButton("���浽�ҵ��ĵ���Ĭ�ϣ�");
	private JRadioButton userDefinedRB = new JRadioButton("�Զ���");
	private JTextField userDefinedTF = new JTextField();
	private JButton browserB = new JButton("���");
	private JLabel fileTransferLabel = new JLabel("Ĭ�ϰѽ��ܵ����ļ����浽���ļ����У�");
	private JTextField fileTransferFolder = new JTextField();
	private JButton changeFileFolderBtn = new JButton("����Ŀ¼");
	//��ȫ����
	private JLabel pwdSecurityLabel = new JLabel("���밲ȫ");
	private JLabel changePwdLabel = new JLabel("Ϊ�������ʺŰ�ȫ���붨���޸����롣");
	private JButton changePwdBtn = new JButton("�޸�����");
	private JButton confirmPwdBtn = new JButton("ȷ���޸�");
	private JLabel formerPwdLabel = new JLabel("ԭ���룺");
	private JPasswordField formerPwdTF = new JPasswordField();
	private JLabel newPwdFirstLabel = new JLabel("�����룺");
	private JPasswordField newPwdFirstTF = new JPasswordField();
	private JLabel newPwdSecondLabel = new JLabel("ȷ�������룺");
	private JPasswordField newPwdSecondTF = new JPasswordField();
	private JLabel pwdProtectedLabel = new JLabel("�������뱣������");
	private JButton setPwdQuesBtn = new JButton("����");
	private JComboBox firstQuesCom = new JComboBox();
	private JComboBox secondQuesCom = new JComboBox();
	private JComboBox thirdQuesCom = new JComboBox();
	private JTextField firstQuesTF = new JTextField();
	private JTextField secondQuesTF = new JTextField();
	private JTextField thirdQuesTF = new JTextField();
	private JButton confirmQuesBtn = new JButton("ȷ�����뱣������");
	private JButton confirmBtn = new JButton("ȷ��");
	private JButton cancelBtn = new JButton("ȡ��");
	private JButton applyBtn = new JButton("Ӧ��");
	
	
	public SystemSetView() {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		systemSetViewPanel = new ImagePanel("image/2.jpg");
		commonPanel = new ImagePanel("image/qun.jpg");
		hotKeyPanel = new ImagePanel("image/qun.jpg");
		fileManagerPanel = new ImagePanel("image/qun.jpg");
		securityPanel = new ImagePanel("image/qun.jpg");
		this.setSize(585, 460);
		this.setLocation(400, 300);
		this.setResizable(false);
		this.setTitle("ϵͳ����");
		systemSetViewPanel.setLayout(null);
		this.add(systemSetViewPanel);
		//ѡ�
		sysSetTP.add("��������", commonPanel);
		sysSetTP.add("�ȼ�����", hotKeyPanel);
		sysSetTP.add("�ļ�����", fileManagerPanel);
		sysSetTP.add("��ȫ����", securityPanel);
		commonPanel.setLayout(null);
		hotKeyPanel.setLayout(null);
		fileManagerPanel.setLayout(null);
		securityPanel.setLayout(null);
		sysSetTP.setBounds(5, 10, 550, 370);
		systemSetViewPanel.add(sysSetTP);
		
	//����panel
		//�ر����ѡ��
		closeOperationLabel.setBounds(5, 5, 120, 20);
		commonPanel.add(closeOperationLabel);
		closeOperationBG.add(closeAndHideRB);
		closeOperationBG.add(closeAndExitRB);
		closeAndHideRB.setBounds(5, 30, 300, 20);
		closeAndHideRB.setSelected(true);
		closeAndHideRB.setOpaque(false);
		commonPanel.add(closeAndHideRB);
		closeAndExitRB.setBounds(5, 55, 300, 20);
		closeAndExitRB.setOpaque(false);
		commonPanel.add(closeAndExitRB);
		
		//��¼״̬
		loginStatusLabel.setBounds(5, 80, 100, 20);
		commonPanel.add(loginStatusLabel);
		loginStatusBG.add(busyRB);
		loginStatusBG.add(invisibleRB);
		loginStatusBG.add(onLineRB);
		loginStatusBG.add(leaveRB);
		onLineRB.setBounds(5, 105, 60, 20);
		onLineRB.setSelected(true);
		onLineRB.setOpaque(false);
		busyRB.setBounds(100, 105, 60, 20);
		busyRB.setOpaque(false);
		leaveRB.setBounds(195, 105, 60, 20);
		leaveRB.setOpaque(false);
		invisibleRB.setBounds(290, 105, 60, 20);
		invisibleRB.setOpaque(false);
		commonPanel.add(onLineRB);
		commonPanel.add(busyRB);
		commonPanel.add(leaveRB);
		commonPanel.add(invisibleRB);
		
	//�ȼ�panel
		accelerateKeyLabel.setBounds(10, 10, 120, 20);
		hotKeyPanel.add(accelerateKeyLabel);
		accelerateKeyBG.add(enterPressRB);
		accelerateKeyBG.add(enterAndCtrlPressRB);
		enterPressRB.setBounds(10, 35, 120, 20);
		enterPressRB.setSelected(true);
		enterPressRB.setOpaque(false);
		enterAndCtrlPressRB.setBounds(10, 60, 150, 20);
		enterAndCtrlPressRB.setOpaque(false);
		hotKeyPanel.add(enterPressRB);
		hotKeyPanel.add(enterAndCtrlPressRB);
		
	//�ļ�����panel
		//�����ļ������ڱ���������Ϣ��¼��ͼƬ������
		chatFileSaveLabel.setBounds(10, 10, 300, 27);
		fileManagerPanel.add(chatFileSaveLabel);
		chatFileSaveBtn.setBounds(315, 10, 130, 27);
		fileManagerPanel.add(chatFileSaveBtn);
		fileSaveBG.add(defaultFileFolderRB);
		fileSaveBG.add(userDefinedRB);
		defaultFileFolderRB.setBounds(10, 40, 200, 27);
		defaultFileFolderRB.setSelected(true);
		defaultFileFolderRB.setOpaque(false);
		userDefinedRB.setBounds(10, 70, 200, 27);
		userDefinedRB.setOpaque(false);
		fileManagerPanel.add(defaultFileFolderRB);
		fileManagerPanel.add(userDefinedRB);
		
		//�����ļ���
		userDefinedTF.setBounds(10, 100, 300, 27);
		userDefinedTF.setOpaque(false);
		fileManagerPanel.add(userDefinedTF);
		browserB.setBounds(315, 100, 100, 27);
		fileManagerPanel.add(browserB);
		
		//Ĭ�ϰѽ��ܵ����ļ����浽���ļ�����
		fileTransferLabel.setBounds(10, 130, 300, 27);
		fileManagerPanel.add(fileTransferLabel);
		fileTransferFolder.setBounds(10, 160, 300, 27);
		fileTransferFolder.setOpaque(false);
		fileManagerPanel.add(fileTransferFolder);
		changeFileFolderBtn.setBounds(315, 160, 100, 27);
		fileManagerPanel.add(changeFileFolderBtn);
		
	//��ȫ����panel
		//�޸�����
		pwdSecurityLabel.setBounds(10, 10, 300, 27);
		securityPanel.add(pwdSecurityLabel);
		changePwdLabel.setBounds(10, 40, 300, 27);
		securityPanel.add(changePwdLabel);
		changePwdBtn.setBounds(315, 40, 100, 27);
		securityPanel.add(changePwdBtn);
		
		
		//ԭ����
		formerPwdLabel.setBounds(10, 70, 100, 27);
		formerPwdTF.setBounds(115, 70, 200, 25);
		formerPwdTF.setOpaque(false);
		securityPanel.add(formerPwdLabel);
		securityPanel.add(formerPwdTF);
		//������1
		newPwdFirstLabel.setBounds(10, 100, 100, 27);
		newPwdFirstTF.setBounds(115, 100, 200, 27);
		newPwdFirstTF.setOpaque(false);
		securityPanel.add(newPwdFirstLabel);
		securityPanel.add(newPwdFirstTF);
		//������2
		newPwdSecondLabel.setBounds(10, 130, 100, 27);
		newPwdSecondTF.setBounds(115, 130, 200, 27);
		newPwdSecondTF.setOpaque(false);
		securityPanel.add(newPwdSecondLabel);
		securityPanel.add(newPwdSecondTF);
		
		confirmPwdBtn.setBounds(315, 130, 100, 27);
		securityPanel.add(confirmPwdBtn);
		
		//�����ܱ�����
		pwdProtectedLabel.setBounds(10, 160, 200, 27);
		securityPanel.add(pwdProtectedLabel);
		setPwdQuesBtn.setBounds(315, 160, 100, 27);
		securityPanel.add(setPwdQuesBtn);
		//��һ��
		firstQuesCom.addItem("��ְֵ����֣�");
		firstQuesCom.addItem("����������֣�");
		firstQuesCom.addItem("�������ѵ����֣�");
		firstQuesCom.addItem("��Ů���ѵ����֣�");
		firstQuesCom.addItem("����а����ε����֣�");
		firstQuesCom.setBounds(10, 190, 200, 27);
		firstQuesTF.setBounds(215, 190, 200, 27);
		firstQuesTF.setOpaque(false);
		securityPanel.add(firstQuesTF);
		securityPanel.add(firstQuesCom);
		//�ڶ���
		secondQuesCom.addItem("����ϲ���Ĺ��ң�");
		secondQuesCom.addItem("����ϲ���ĸ��֣�");
		secondQuesCom.addItem("����ϲ�������ǣ�");
		secondQuesCom.setBounds(10, 220, 200, 27);
		secondQuesTF.setBounds(215, 220, 200, 27);
		secondQuesTF.setOpaque(false);
		securityPanel.add(secondQuesTF);
		securityPanel.add(secondQuesCom);
		//������
		thirdQuesCom.addItem("����ϲ������Ϸ��");
		thirdQuesCom.addItem("����ϲ���ԵĲ�");
		thirdQuesCom.setBounds(10, 250, 200, 27);
		thirdQuesTF.setBounds(215, 250, 200, 27);
		thirdQuesTF.setOpaque(false);
		securityPanel.add(thirdQuesTF);
		securityPanel.add(thirdQuesCom);
		//ȷ�ϰ�ť
		confirmQuesBtn.setBounds(250, 280, 160, 27);
		securityPanel.add(confirmQuesBtn);
		
		
		//ȷ��Btn
		confirmBtn.setBounds(250, 390, 80, 27);
		systemSetViewPanel.add(confirmBtn);
		
		//ȡ��Btn
		cancelBtn.setBounds(340, 390, 80, 27);
		systemSetViewPanel.add(cancelBtn);
		
		//Ӧ��Btn
		applyBtn.setBounds(430, 390, 80, 27);
		systemSetViewPanel.add(applyBtn);
		
		
		
		
		
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		this.setVisible(true);
		
		
		
		
		
	}
	public JButton getConfirmPwdBtn() {
		return confirmPwdBtn;
	}
	public void setConfirmPwdBtn(JButton confirmPwdBtn) {
		this.confirmPwdBtn = confirmPwdBtn;
	}
	public JButton getSetPwdQuesBtn() {
		return setPwdQuesBtn;
	}
	public void setSetPwdQuesBtn(JButton setPwdQuesBtn) {
		this.setPwdQuesBtn = setPwdQuesBtn;
	}
	public static void main(String[] args) throws  Exception {
		UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");  
		//UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
		new SystemSetView();
	}
	public JTabbedPane getSysSetTP() {
		return sysSetTP;
	}
	public void setSysSetTP(JTabbedPane sysSetTP) {
		this.sysSetTP = sysSetTP;
	}
	public JPanel getSystemSetViewPanel() {
		return systemSetViewPanel;
	}
	public void setSystemSetViewPanel(JPanel systemSetViewPanel) {
		this.systemSetViewPanel = systemSetViewPanel;
	}
	public JPanel getCommonPanel() {
		return commonPanel;
	}
	public void setCommonPanel(JPanel commonPanel) {
		this.commonPanel = commonPanel;
	}
	public JPanel getHotKeyPanel() {
		return hotKeyPanel;
	}
	public void setHotKeyPanel(JPanel hotKeyPanel) {
		this.hotKeyPanel = hotKeyPanel;
	}
	public JPanel getFileManagerPanel() {
		return fileManagerPanel;
	}
	public void setFileManagerPanel(JPanel fileManagerPanel) {
		this.fileManagerPanel = fileManagerPanel;
	}
	public JPanel getSecurityPanel() {
		return securityPanel;
	}
	public void setSecurityPanel(JPanel securityPanel) {
		this.securityPanel = securityPanel;
	}
	public JLabel getCloseOperationLabel() {
		return closeOperationLabel;
	}
	public void setCloseOperationLabel(JLabel closeOperationLabel) {
		this.closeOperationLabel = closeOperationLabel;
	}
	public ButtonGroup getCloseOperationBG() {
		return closeOperationBG;
	}
	public void setCloseOperationBG(ButtonGroup closeOperationBG) {
		this.closeOperationBG = closeOperationBG;
	}
	public JRadioButton getCloseAndHideRB() {
		return closeAndHideRB;
	}
	public void setCloseAndHideRB(JRadioButton closeAndHideRB) {
		this.closeAndHideRB = closeAndHideRB;
	}
	public JRadioButton getCloseAndExitRB() {
		return closeAndExitRB;
	}
	public void setCloseAndExitRB(JRadioButton closeAndExitRB) {
		this.closeAndExitRB = closeAndExitRB;
	}
	public JLabel getLoginStatusLabel() {
		return loginStatusLabel;
	}
	public void setLoginStatusLabel(JLabel loginStatusLabel) {
		this.loginStatusLabel = loginStatusLabel;
	}
	public ButtonGroup getLoginStatusBG() {
		return loginStatusBG;
	}
	public void setLoginStatusBG(ButtonGroup loginStatusBG) {
		this.loginStatusBG = loginStatusBG;
	}
	public JRadioButton getOnLineRB() {
		return onLineRB;
	}
	public void setOnLineRB(JRadioButton onLineRB) {
		this.onLineRB = onLineRB;
	}
	public JRadioButton getLeaveRB() {
		return leaveRB;
	}
	public void setLeaveRB(JRadioButton leaveRB) {
		this.leaveRB = leaveRB;
	}
	public JRadioButton getInvisibleRB() {
		return invisibleRB;
	}
	public void setInvisibleRB(JRadioButton invisibleRB) {
		this.invisibleRB = invisibleRB;
	}
	public JRadioButton getBusyRB() {
		return busyRB;
	}
	public void setBusyRB(JRadioButton busyRB) {
		this.busyRB = busyRB;
	}
	public JLabel getAccelerateKeyLabel() {
		return accelerateKeyLabel;
	}
	public void setAccelerateKeyLabel(JLabel accelerateKeyLabel) {
		this.accelerateKeyLabel = accelerateKeyLabel;
	}
	public ButtonGroup getAccelerateKeyBG() {
		return accelerateKeyBG;
	}
	public void setAccelerateKeyBG(ButtonGroup accelerateKeyBG) {
		this.accelerateKeyBG = accelerateKeyBG;
	}
	public JRadioButton getEnterPressRB() {
		return enterPressRB;
	}
	public void setEnterPressRB(JRadioButton enterPressRB) {
		this.enterPressRB = enterPressRB;
	}
	public JRadioButton getEnterAndCtrlPressRB() {
		return enterAndCtrlPressRB;
	}
	public void setEnterAndCtrlPressRB(JRadioButton enterAndCtrlPressRB) {
		this.enterAndCtrlPressRB = enterAndCtrlPressRB;
	}
	public JLabel getChatFileSaveLabel() {
		return chatFileSaveLabel;
	}
	public void setChatFileSaveLabel(JLabel chatFileSaveLabel) {
		this.chatFileSaveLabel = chatFileSaveLabel;
	}
	public JButton getChatFileSaveBtn() {
		return chatFileSaveBtn;
	}
	public void setChatFileSaveBtn(JButton chatFileSaveBtn) {
		this.chatFileSaveBtn = chatFileSaveBtn;
	}
	public ButtonGroup getFileSaveBG() {
		return fileSaveBG;
	}
	public void setFileSaveBG(ButtonGroup fileSaveBG) {
		this.fileSaveBG = fileSaveBG;
	}
	public JRadioButton getDefaultFileFolderRB() {
		return defaultFileFolderRB;
	}
	public void setDefaultFileFolderRB(JRadioButton defaultFileFolderRB) {
		this.defaultFileFolderRB = defaultFileFolderRB;
	}
	public JRadioButton getUserDefinedRB() {
		return userDefinedRB;
	}
	public void setUserDefinedRB(JRadioButton userDefinedRB) {
		this.userDefinedRB = userDefinedRB;
	}
	public JTextField getUserDefinedTF() {
		return userDefinedTF;
	}
	public void setUserDefinedTF(JTextField userDefinedTF) {
		this.userDefinedTF = userDefinedTF;
	}
	public JButton getBrowserB() {
		return browserB;
	}
	public void setBrowserB(JButton browserB) {
		this.browserB = browserB;
	}
	public JLabel getFileTransferLabel() {
		return fileTransferLabel;
	}
	public void setFileTransferLabel(JLabel fileTransferLabel) {
		this.fileTransferLabel = fileTransferLabel;
	}
	public JTextField getFileTransferFolder() {
		return fileTransferFolder;
	}
	public void setFileTransferFolder(JTextField fileTransferFolder) {
		this.fileTransferFolder = fileTransferFolder;
	}
	public JButton getChangeFileFolderBtn() {
		return changeFileFolderBtn;
	}
	public void setChangeFileFolderBtn(JButton changeFileFolderBtn) {
		this.changeFileFolderBtn = changeFileFolderBtn;
	}
	public JLabel getPwdSecurityLabel() {
		return pwdSecurityLabel;
	}
	public void setPwdSecurityLabel(JLabel pwdSecurityLabel) {
		this.pwdSecurityLabel = pwdSecurityLabel;
	}
	public JLabel getChangePwdLabel() {
		return changePwdLabel;
	}
	public void setChangePwdLabel(JLabel changePwdLabel) {
		this.changePwdLabel = changePwdLabel;
	}
	public JButton getChangePwdBtn() {
		return changePwdBtn;
	}
	public void setChangePwdBtn(JButton changePwdBtn) {
		this.changePwdBtn = changePwdBtn;
	}
	public JLabel getFormerPwdLabel() {
		return formerPwdLabel;
	}
	public void setFormerPwdLabel(JLabel formerPwdLabel) {
		this.formerPwdLabel = formerPwdLabel;
	}
	public JPasswordField getFormerPwdTF() {
		return formerPwdTF;
	}
	public void setFormerPwdTF(JPasswordField formerPwdTF) {
		this.formerPwdTF = formerPwdTF;
	}
	public JLabel getNewPwdFirstLabel() {
		return newPwdFirstLabel;
	}
	public void setNewPwdFirstLabel(JLabel newPwdFirstLabel) {
		this.newPwdFirstLabel = newPwdFirstLabel;
	}
	public JPasswordField getNewPwdFirstTF() {
		return newPwdFirstTF;
	}
	public void setNewPwdFirstTF(JPasswordField newPwdFirstTF) {
		this.newPwdFirstTF = newPwdFirstTF;
	}
	public JLabel getNewPwdSecondLabel() {
		return newPwdSecondLabel;
	}
	public void setNewPwdSecondLabel(JLabel newPwdSecondLabel) {
		this.newPwdSecondLabel = newPwdSecondLabel;
	}
	public JPasswordField getNewPwdSecondTF() {
		return newPwdSecondTF;
	}
	public void setNewPwdSecondTF(JPasswordField newPwdSecondTF) {
		this.newPwdSecondTF = newPwdSecondTF;
	}
	public JLabel getPwdProtectedLabel() {
		return pwdProtectedLabel;
	}
	public void setPwdProtectedLabel(JLabel pwdProtectedLabel) {
		this.pwdProtectedLabel = pwdProtectedLabel;
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
	public JButton getConfirmQuesBtn() {
		return confirmQuesBtn;
	}
	public void setConfirmQuesBtn(JButton confirmQuesBtn) {
		this.confirmQuesBtn = confirmQuesBtn;
	}
	public JButton getConfirmBtn() {
		return confirmBtn;
	}
	public void setConfirmBtn(JButton confirmBtn) {
		this.confirmBtn = confirmBtn;
	}
	public JButton getCancelBtn() {
		return cancelBtn;
	}
	public void setCancelBtn(JButton cancelBtn) {
		this.cancelBtn = cancelBtn;
	}
	public JButton getApplyBtn() {
		return applyBtn;
	}
	public void setApplyBtn(JButton applyBtn) {
		this.applyBtn = applyBtn;
	}
	
	
	
	
	
}
