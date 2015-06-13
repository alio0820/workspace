package com.newworld.view;

import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTabbedPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;
import javax.swing.border.LineBorder;

import com.new_world.operation.setinfo.ImagePanel;
/*
 * Design by littlePP @20120719
 */
public class UserInfoView extends JFrame {
	
	//��������
	private JButton confirmBtn = new JButton("ȷ��");
	private JButton cancelBtn = new JButton("ȡ��");
	private JButton applyBtn = new JButton("Ӧ��");
	private JButton sysSetBtn = new JButton("ϵͳ����");
	private JTabbedPane userInfoTP = new JTabbedPane(2);
	private JPanel basicInfo;
	private JPanel userPic;
	private JPanel userInfoBackground;
	private JButton changeUserPic = new JButton("����ͷ��");
	private JLabel nickNameLabel = new JLabel("�ǳƣ�");
	private JTextField nickNameTF = new JTextField();;
	private JLabel userAccount = new JLabel("�ʺţ�");
	private JLabel userAccountNum = new JLabel();;
	private JLabel userSignLabel = new JLabel("����ǩ����");
	private JScrollPane signScroll;
	private JTextArea userSignTA = new JTextArea();
	private JLabel realNameLabel = new JLabel("��    ����");
	private JTextField realNameTF = new JTextField();;
	private JLabel engNameLabel = new JLabel("Ӣ������");
	private JTextField engNameTF = new JTextField();;
	private JLabel sexLabel = new JLabel("��    ��");
	private JComboBox sexCom = new JComboBox();
	private JLabel ageLabel = new JLabel("��    �䣺");
	private JTextField ageTF = new JTextField();
	private JLabel birthdayLabel = new JLabel("��    �գ�");
	private JTextField birthdayTF = new JTextField();
	private JLabel animalLabel = new JLabel("��    Ф��");
	private JComboBox animalCom = new JComboBox();
	private JLabel constellationLabel = new JLabel("��    ����");
	private JComboBox constellationCom = new JComboBox();
	private JLabel bloodTypeLabel = new JLabel("Ѫ    �ͣ�");
	private JComboBox bloodTypCom = new JComboBox();
	private JLabel homeTownLabel = new JLabel("��    �磺");
	private JTextField homeTownTF = new JTextField();
	private JLabel locationLabel = new JLabel("���ڵأ�");
	private JTextField locationTF = new JTextField();
	private JLabel addressLabel = new JLabel("��    ַ��");
	private JTextField addressTF = new JTextField();
	private JLabel postcodeLabel = new JLabel("��    �ࣺ");
	private JTextField postcodeTF = new JTextField();
	//��������
	private JPanel moreInfo;
	private JLabel teleNumLabel = new JLabel("��    ����");
	private JTextField teleNumTF = new JTextField();
	private JLabel mobiNumLabel = new JLabel("��    ����");
	private JTextField mobiNumTF = new JTextField();
	private JLabel mailBoxLabel = new JLabel("��    �䣺");
	private JTextField mailBoxTF = new JTextField();
	private JLabel occupationLabel = new JLabel("ְ    ҵ��");
	private JComboBox occupationCom = new JComboBox();
	private JLabel positionLabel = new JLabel("ְ    λ��");
	private JTextField positionTF = new JTextField();
	private JLabel eduLabel = new JLabel("ѧ    ����");
	private JComboBox eduCom = new JComboBox();
	private JLabel schoolLabel = new JLabel("ѧ    У��");
	private JTextField schoolTF = new JTextField();
	private JLabel personalStateLabel = new JLabel("����˵����");
	private JTextArea personalStateTA = new JTextArea();
	private JScrollPane personScroll;
	
	
	public UserInfoView() {
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		this.setIconImage(image.getImage());
		
		userInfoBackground = new ImagePanel("image/2.jpg");
		basicInfo = new ImagePanel("image/1.jpg");
		moreInfo = new ImagePanel("image/1.jpg");
		userPic = new ImagePanel();
		//userPic = new ImagePanel("image/wolf.gif");
		this.setSize(585, 485);
		this.setLocation(400, 150);
		this.setResizable(false);
		this.setTitle("�ҵ�����");
		userInfoBackground.setLayout(null);
		this.add(userInfoBackground);
		
		//ϵͳ����
		sysSetBtn.setBounds(10, 415, 100, 27);
		userInfoBackground.add(sysSetBtn);
		
		//ȷ��Btn
		confirmBtn.setBounds(250, 415, 80, 27);
		userInfoBackground.add(confirmBtn);
		
		//ȡ��Btn
		cancelBtn.setBounds(340, 415, 80, 27);
		userInfoBackground.add(cancelBtn);
		//Ӧ��Btn
		applyBtn.setBounds(430, 415, 80, 27);
		userInfoBackground.add(applyBtn);
		
		//�û�ͷ��
		userPic.setBounds(15, 15, 100, 100);
		userInfoBackground.add(userPic);
		
		//����ͷ��
		changeUserPic.setBounds(15, 120, 100, 27);
		userInfoBackground.add(changeUserPic);
		
		//�ǳ�Label
		nickNameLabel.setBounds(130, 25, 40, 27);
		userInfoBackground.add(nickNameLabel);
		
		//�ǳ�textField
		nickNameTF.setBounds(175, 25, 120, 27);
		nickNameTF.setOpaque(false);
		userInfoBackground.add(nickNameTF);
		
		//�ʺ�label
		userAccount.setBounds(310, 25, 40, 27);
		userInfoBackground.add(userAccount);
		
		//�û��ʺ�
		userAccountNum.setBounds(355, 25, 120, 27);
		//userAccountNum.setText("290976110");
		userInfoBackground.add(userAccountNum);
		
		//����ǩ��Label
		userSignLabel.setBounds(130, 60, 70, 27);
		userInfoBackground.add(userSignLabel);
		
		//����ǩ��
		userSignTA.setBounds(130, 85, 400, 55);
		signScroll = new JScrollPane(userSignTA);
		LineBorder userSignTABorder = new LineBorder(Color.WHITE, 1);
		userSignTA.setOpaque(false);
		userSignTA.setBorder(userSignTABorder);
		userInfoBackground.add(userSignTA);
		
		//ѡ�
		userInfoTP.setBounds(40, 150, 490, 255);
		userInfoTP.add("��������", basicInfo);
		userInfoTP.add("��������", moreInfo);
		basicInfo.setLayout(null);
		moreInfo.setLayout(null);
		userInfoBackground.add(userInfoTP);
		
		
		//����label
		realNameLabel.setBounds(5, 5, 60, 27);
		basicInfo.add(realNameLabel);
		
		//����
		realNameTF.setBounds(70, 5, 80, 27);
		realNameTF.setOpaque(false);
		basicInfo.add(realNameTF);
		
		//Ӣ����label
		engNameLabel.setBounds(200, 5, 60, 27);
		basicInfo.add(engNameLabel);
		
		//Ӣ����
		engNameTF.setBounds(265, 5, 120, 27);
		engNameTF.setOpaque(false);
		basicInfo.add(engNameTF);
		
		//�Ա�label
		sexLabel.setBounds(5, 35, 60, 27);
		basicInfo.add(sexLabel);
		
		//�Ա�
		sexCom.setBounds(70, 35, 80, 27);
		sexCom.addItem("��");
		sexCom.addItem("Ů");
		sexCom.addItem("Ů��ʿ");
		sexCom.addItem("����");
		sexCom.setOpaque(false);
		basicInfo.add(sexCom);
		
		//����label
		ageLabel.setBounds(200, 35, 60, 27);
		basicInfo.add(ageLabel);
		
		//����
		ageTF.setBounds(265, 35, 40, 27);
		ageTF.setOpaque(false);
		basicInfo.add(ageTF);
		
		//����label
		birthdayLabel.setBounds(5, 65, 60, 27);
		basicInfo.add(birthdayLabel);
		
		//����
		birthdayTF.setBounds(70, 65, 80, 27);
		birthdayTF.setOpaque(false);
		basicInfo.add(birthdayTF);
		
		//��Фlabel
		animalLabel.setBounds(200, 65, 60, 27);
		basicInfo.add(animalLabel);
		
		//��Ф
		animalCom.setBounds(265, 65, 50, 27);
		animalCom.addItem("��");
		animalCom.addItem("ţ");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		animalCom.addItem("��");
		basicInfo.add(animalCom);
		
		//����label
		constellationLabel.setBounds(5, 95, 60, 27);
		basicInfo.add(constellationLabel);
		
		//����
		constellationCom.setBounds(70, 95, 80, 27);
		constellationCom.addItem("Ħ����");
		constellationCom.addItem("ˮƿ��");
		constellationCom.addItem("������");
		constellationCom.addItem("��ţ��");
		constellationCom.addItem("������");
		constellationCom.addItem("�����");
		constellationCom.addItem("��з��");
		constellationCom.addItem("˫����");
		constellationCom.addItem("ʨ����");
		constellationCom.addItem("˫����");
		constellationCom.addItem("��Ů��");
		constellationCom.addItem("��Ы��");
		basicInfo.add(constellationCom);
		
		//Ѫ��label
		bloodTypeLabel.setBounds(200, 95, 60, 27);
		basicInfo.add(bloodTypeLabel);
		
		//Ѫ��
		bloodTypCom.setBounds(265, 95, 60, 27);
		bloodTypCom.addItem("A");
		bloodTypCom.addItem("B");
		bloodTypCom.addItem("AB");
		bloodTypCom.addItem("O");
		bloodTypCom.addItem("����");
		basicInfo.add(bloodTypCom);
		
		//����label
		homeTownLabel.setBounds(5, 125, 60, 27);
		basicInfo.add(homeTownLabel);
		
		//����
		homeTownTF.setBounds(70, 125, 280, 27);
		homeTownTF.setOpaque(false);
		basicInfo.add(homeTownTF);
		
		//���ڵ�label
		locationLabel.setBounds(5, 155, 60, 27);
		basicInfo.add(locationLabel);
		
		//���ڵ�
		locationTF.setBounds(70, 155, 280, 27);
		locationTF.setOpaque(false);
		basicInfo.add(locationTF);
		
		//��ַlabel
		addressLabel.setBounds(5, 185, 60, 27);
		basicInfo.add(addressLabel);
		
		//��ַ
		addressTF.setBounds(70, 185, 280, 27);
		addressTF.setOpaque(false);
		basicInfo.add(addressTF);
		
		//�ʱ�label
		postcodeLabel.setBounds(5, 215, 60, 27);
		basicInfo.add(postcodeLabel);
		
		//�ʱ�
		postcodeTF.setBounds(70, 215, 120, 27);
		postcodeTF.setOpaque(false);
		basicInfo.add(postcodeTF);
		
//��������
		//�绰label
		teleNumLabel.setBounds(5, 5, 60, 27);
		moreInfo.add(teleNumLabel);
		
		//�绰
		teleNumTF.setBounds(70, 5, 100, 27);
		teleNumTF.setOpaque(false);
		moreInfo.add(teleNumTF);
		
		//�ֻ�label
		mobiNumLabel.setBounds(200, 5, 60, 27);
		moreInfo.add(mobiNumLabel);
		
		//�ֻ�
		mobiNumTF.setBounds(265, 5, 120, 27);
		mobiNumTF.setOpaque(false);
		moreInfo.add(mobiNumTF);
		
		//����label
		mailBoxLabel.setBounds(5, 35, 60, 27);
		moreInfo.add(mailBoxLabel);
		
		//����
		mailBoxTF.setBounds(70, 35, 150, 27);
		mailBoxTF.setOpaque(false);
		moreInfo.add(mailBoxTF);
		
		//ְҵlabel
		occupationLabel.setBounds(5, 65, 60, 27);
		moreInfo.add(occupationLabel);
		
		//ְҵ
		occupationCom.setBounds(70, 65, 110, 27);
		occupationCom.addItem("��Уѧ��");
		occupationCom.addItem("�̶�������");
		occupationCom.addItem("����ְҵ��");
		occupationCom.addItem("��ҵ/��ҵ/ʧҵ");
		occupationCom.addItem("����");
		occupationCom.addItem("����");
		moreInfo.add(occupationCom);
		
		//ְλlabel
		positionLabel.setBounds(200, 65, 60, 27);
		moreInfo.add(positionLabel);
		
		//ְλ
		positionTF.setBounds(265, 65, 120, 27);
		positionTF.setOpaque(false);
		moreInfo.add(positionTF);
		
		//ѧ��label
		eduLabel.setBounds(5, 95, 60, 27);
		moreInfo.add(eduLabel);
		
		//ѧ��
		eduCom.setBounds(70, 95, 110, 27);
		eduCom.addItem("Сѧ������");
		eduCom.addItem("����");
		eduCom.addItem("����");
		eduCom.addItem("��ר");
		eduCom.addItem("����");
		eduCom.addItem("�о���");
		eduCom.addItem("��ʿ������");
		moreInfo.add(eduCom);
		
		//ѧУlabel
		schoolLabel.setBounds(200, 95, 60, 27);
		moreInfo.add(schoolLabel);
		
		//ѧУ
		schoolTF.setBounds(265, 95, 120, 27);
		schoolTF.setOpaque(false);
		moreInfo.add(schoolTF);
		
		//����˵��label
		personalStateLabel.setBounds(5, 115, 100, 27);
		moreInfo.add(personalStateLabel);
		
		//����˵��
		personalStateTA.setBounds(5, 145, 400, 70);
		personScroll = new JScrollPane(personalStateTA);
		LineBorder personStateTABorder = new LineBorder(Color.WHITE, 1);
		personalStateTA.setOpaque(false);
		personalStateTA.setBorder(personStateTABorder);
		moreInfo.add(personalStateTA);
		
		this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
		this.setVisible(true);
		
		
	}


	public JTextField getPositionTF() {
		return positionTF;
	}


	public void setPositionTF(JTextField positionTF) {
		this.positionTF = positionTF;
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


	public JButton getSysSetBtn() {
		return sysSetBtn;
	}


	public void setSysSetBtn(JButton sysSetBtn) {
		this.sysSetBtn = sysSetBtn;
	}


	public JTabbedPane getUserInfoTP() {
		return userInfoTP;
	}


	public void setUserInfoTP(JTabbedPane userInfoTP) {
		this.userInfoTP = userInfoTP;
	}


	public JPanel getBasicInfo() {
		return basicInfo;
	}


	public void setBasicInfo(JPanel basicInfo) {
		this.basicInfo = basicInfo;
	}





	public JPanel getUserPic() {
		return userPic;
	}


	public void setUserPic(JPanel userPic) {
		this.userPic = userPic;
	}


	public JPanel getUserInfoBackground() {
		return userInfoBackground;
	}


	public void setUserInfoBackground(JPanel userInfoBackground) {
		this.userInfoBackground = userInfoBackground;
	}


	public JButton getChangeUserPic() {
		return changeUserPic;
	}


	public void setChangeUserPic(JButton changeUserPic) {
		this.changeUserPic = changeUserPic;
	}


	public JLabel getNickNameLabel() {
		return nickNameLabel;
	}


	public void setNickNameLabel(JLabel nickNameLabel) {
		this.nickNameLabel = nickNameLabel;
	}


	public JTextField getNickNameTF() {
		return nickNameTF;
	}


	public void setNickNameTF(JTextField nickNameTF) {
		this.nickNameTF = nickNameTF;
	}


	public JLabel getUserAccount() {
		return userAccount;
	}


	public void setUserAccount(JLabel userAccount) {
		this.userAccount = userAccount;
	}


	public JLabel getUserAccountNum() {
		return userAccountNum;
	}


	public void setUserAccountNum(JLabel userAccountNum) {
		this.userAccountNum = userAccountNum;
	}


	public JLabel getUserSignLabel() {
		return userSignLabel;
	}


	public void setUserSignLabel(JLabel userSignLabel) {
		this.userSignLabel = userSignLabel;
	}


	public JScrollPane getSignScroll() {
		return signScroll;
	}


	public void setSignScroll(JScrollPane signScroll) {
		this.signScroll = signScroll;
	}


	public JTextArea getUserSignTA() {
		return userSignTA;
	}


	public void setUserSignTA(JTextArea userSignTA) {
		this.userSignTA = userSignTA;
	}


	public JLabel getRealNameLabel() {
		return realNameLabel;
	}


	public void setRealNameLabel(JLabel realNameLabel) {
		this.realNameLabel = realNameLabel;
	}


	public JTextField getRealNameTF() {
		return realNameTF;
	}


	public void setRealNameTF(JTextField realNameTF) {
		this.realNameTF = realNameTF;
	}


	public JLabel getEngNameLabel() {
		return engNameLabel;
	}


	public void setEngNameLabel(JLabel engNameLabel) {
		this.engNameLabel = engNameLabel;
	}


	public JTextField getEngNameTF() {
		return engNameTF;
	}


	public void setEngNameTF(JTextField engNameTF) {
		this.engNameTF = engNameTF;
	}


	public JLabel getSexLabel() {
		return sexLabel;
	}


	public void setSexLabel(JLabel sexLabel) {
		this.sexLabel = sexLabel;
	}


	public JComboBox getSexCom() {
		return sexCom;
	}


	public void setSexCom(JComboBox sexCom) {
		this.sexCom = sexCom;
	}


	public JLabel getAgeLabel() {
		return ageLabel;
	}


	public void setAgeLabel(JLabel ageLabel) {
		this.ageLabel = ageLabel;
	}


	public JTextField getAgeTF() {
		return ageTF;
	}


	public void setAgeTF(JTextField ageTF) {
		this.ageTF = ageTF;
	}


	public JLabel getBirthdayLabel() {
		return birthdayLabel;
	}


	public void setBirthdayLabel(JLabel birthdayLabel) {
		this.birthdayLabel = birthdayLabel;
	}


	public JTextField getBirthdayTF() {
		return birthdayTF;
	}


	public void setBirthdayTF(JTextField birthdayTF) {
		this.birthdayTF = birthdayTF;
	}


	public JLabel getAnimalLabel() {
		return animalLabel;
	}


	public void setAnimalLabel(JLabel animalLabel) {
		this.animalLabel = animalLabel;
	}


	public JComboBox getAnimalCom() {
		return animalCom;
	}


	public void setAnimalCom(JComboBox animalCom) {
		this.animalCom = animalCom;
	}


	public JLabel getConstellationLabel() {
		return constellationLabel;
	}


	public void setConstellationLabel(JLabel constellationLabel) {
		this.constellationLabel = constellationLabel;
	}


	public JComboBox getConstellationCom() {
		return constellationCom;
	}


	public void setConstellationCom(JComboBox constellationCom) {
		this.constellationCom = constellationCom;
	}


	public JLabel getBloodTypeLabel() {
		return bloodTypeLabel;
	}


	public void setBloodTypeLabel(JLabel bloodTypeLabel) {
		this.bloodTypeLabel = bloodTypeLabel;
	}


	public JComboBox getBloodTypCom() {
		return bloodTypCom;
	}


	public void setBloodTypCom(JComboBox bloodTypCom) {
		this.bloodTypCom = bloodTypCom;
	}


	public JLabel getHomeTownLabel() {
		return homeTownLabel;
	}


	public void setHomeTownLabel(JLabel homeTownLabel) {
		this.homeTownLabel = homeTownLabel;
	}


	public JTextField getHomeTownTF() {
		return homeTownTF;
	}


	public void setHomeTownTF(JTextField homeTownTF) {
		this.homeTownTF = homeTownTF;
	}


	public JLabel getLocationLabel() {
		return locationLabel;
	}


	public void setLocationLabel(JLabel locationLabel) {
		this.locationLabel = locationLabel;
	}


	public JTextField getLocationTF() {
		return locationTF;
	}


	public void setLocationTF(JTextField locationTF) {
		this.locationTF = locationTF;
	}


	public JLabel getAddressLabel() {
		return addressLabel;
	}


	public void setAddressLabel(JLabel addressLabel) {
		this.addressLabel = addressLabel;
	}


	public JTextField getAddressTF() {
		return addressTF;
	}


	public void setAddressTF(JTextField addressTF) {
		this.addressTF = addressTF;
	}


	public JLabel getPostcodeLabel() {
		return postcodeLabel;
	}


	public void setPostcodeLabel(JLabel postcodeLabel) {
		this.postcodeLabel = postcodeLabel;
	}


	public JTextField getPostcodeTF() {
		return postcodeTF;
	}


	public void setPostcodeTF(JTextField postcodeTF) {
		this.postcodeTF = postcodeTF;
	}


	public JPanel getMoreInfo() {
		return moreInfo;
	}


	public void setMoreInfo(JPanel moreInfo) {
		this.moreInfo = moreInfo;
	}


	public JLabel getTeleNumLabel() {
		return teleNumLabel;
	}


	public void setTeleNumLabel(JLabel teleNumLabel) {
		this.teleNumLabel = teleNumLabel;
	}


	public JTextField getTeleNumTF() {
		return teleNumTF;
	}


	public void setTeleNumTF(JTextField teleNumTF) {
		this.teleNumTF = teleNumTF;
	}


	public JLabel getMobiNumLabel() {
		return mobiNumLabel;
	}


	public void setMobiNumLabel(JLabel mobiNumLabel) {
		this.mobiNumLabel = mobiNumLabel;
	}


	public JTextField getMobiNumTF() {
		return mobiNumTF;
	}


	public void setMobiNumTF(JTextField mobiNumTF) {
		this.mobiNumTF = mobiNumTF;
	}


	public JLabel getMailBoxLabel() {
		return mailBoxLabel;
	}


	public void setMailBoxLabel(JLabel mailBoxLabel) {
		this.mailBoxLabel = mailBoxLabel;
	}


	public JTextField getMailBoxTF() {
		return mailBoxTF;
	}


	public void setMailBoxTF(JTextField mailBoxTF) {
		this.mailBoxTF = mailBoxTF;
	}


	public JLabel getOccupationLabel() {
		return occupationLabel;
	}


	public void setOccupationLabel(JLabel occupationLabel) {
		this.occupationLabel = occupationLabel;
	}


	public JComboBox getOccupationCom() {
		return occupationCom;
	}


	public void setOccupationCom(JComboBox occupationCom) {
		this.occupationCom = occupationCom;
	}


	public JLabel getEduLabel() {
		return eduLabel;
	}


	public void setEduLabel(JLabel eduLabel) {
		this.eduLabel = eduLabel;
	}


	public JComboBox getEduCom() {
		return eduCom;
	}


	public void setEduCom(JComboBox eduCom) {
		this.eduCom = eduCom;
	}


	public JLabel getSchoolLabel() {
		return schoolLabel;
	}


	public void setSchoolLabel(JLabel schoolLabel) {
		this.schoolLabel = schoolLabel;
	}


	public JTextField getSchoolTF() {
		return schoolTF;
	}


	public void setSchoolTF(JTextField schoolTF) {
		this.schoolTF = schoolTF;
	}


	public JLabel getPersonalStateLabel() {
		return personalStateLabel;
	}


	public void setPersonalStateLabel(JLabel personalStateLabel) {
		this.personalStateLabel = personalStateLabel;
	}


	public JTextArea getPersonalStateTA() {
		return personalStateTA;
	}


	public void setPersonalStateTA(JTextArea personalStateTA) {
		this.personalStateTA = personalStateTA;
	}


	public JScrollPane getPersonScroll() {
		return personScroll;
	}


	public void setPersonScroll(JScrollPane personScroll) {
		this.personScroll = personScroll;
	}
	
	public static void main(String[] args) throws  Exception {
		UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");  
		//UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
		new UserInfoView();
	}

	
	

}
