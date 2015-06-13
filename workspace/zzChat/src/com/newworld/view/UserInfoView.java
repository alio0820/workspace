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
	
	//基本资料
	private JButton confirmBtn = new JButton("确定");
	private JButton cancelBtn = new JButton("取消");
	private JButton applyBtn = new JButton("应用");
	private JButton sysSetBtn = new JButton("系统设置");
	private JTabbedPane userInfoTP = new JTabbedPane(2);
	private JPanel basicInfo;
	private JPanel userPic;
	private JPanel userInfoBackground;
	private JButton changeUserPic = new JButton("更换头像");
	private JLabel nickNameLabel = new JLabel("昵称：");
	private JTextField nickNameTF = new JTextField();;
	private JLabel userAccount = new JLabel("帐号：");
	private JLabel userAccountNum = new JLabel();;
	private JLabel userSignLabel = new JLabel("个性签名：");
	private JScrollPane signScroll;
	private JTextArea userSignTA = new JTextArea();
	private JLabel realNameLabel = new JLabel("姓    名：");
	private JTextField realNameTF = new JTextField();;
	private JLabel engNameLabel = new JLabel("英文名：");
	private JTextField engNameTF = new JTextField();;
	private JLabel sexLabel = new JLabel("性    别：");
	private JComboBox sexCom = new JComboBox();
	private JLabel ageLabel = new JLabel("年    龄：");
	private JTextField ageTF = new JTextField();
	private JLabel birthdayLabel = new JLabel("生    日：");
	private JTextField birthdayTF = new JTextField();
	private JLabel animalLabel = new JLabel("生    肖：");
	private JComboBox animalCom = new JComboBox();
	private JLabel constellationLabel = new JLabel("星    座：");
	private JComboBox constellationCom = new JComboBox();
	private JLabel bloodTypeLabel = new JLabel("血    型：");
	private JComboBox bloodTypCom = new JComboBox();
	private JLabel homeTownLabel = new JLabel("故    乡：");
	private JTextField homeTownTF = new JTextField();
	private JLabel locationLabel = new JLabel("所在地：");
	private JTextField locationTF = new JTextField();
	private JLabel addressLabel = new JLabel("地    址：");
	private JTextField addressTF = new JTextField();
	private JLabel postcodeLabel = new JLabel("邮    编：");
	private JTextField postcodeTF = new JTextField();
	//更多资料
	private JPanel moreInfo;
	private JLabel teleNumLabel = new JLabel("电    话：");
	private JTextField teleNumTF = new JTextField();
	private JLabel mobiNumLabel = new JLabel("手    机：");
	private JTextField mobiNumTF = new JTextField();
	private JLabel mailBoxLabel = new JLabel("邮    箱：");
	private JTextField mailBoxTF = new JTextField();
	private JLabel occupationLabel = new JLabel("职    业：");
	private JComboBox occupationCom = new JComboBox();
	private JLabel positionLabel = new JLabel("职    位：");
	private JTextField positionTF = new JTextField();
	private JLabel eduLabel = new JLabel("学    历：");
	private JComboBox eduCom = new JComboBox();
	private JLabel schoolLabel = new JLabel("学    校：");
	private JTextField schoolTF = new JTextField();
	private JLabel personalStateLabel = new JLabel("个人说明：");
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
		this.setTitle("我的资料");
		userInfoBackground.setLayout(null);
		this.add(userInfoBackground);
		
		//系统设置
		sysSetBtn.setBounds(10, 415, 100, 27);
		userInfoBackground.add(sysSetBtn);
		
		//确定Btn
		confirmBtn.setBounds(250, 415, 80, 27);
		userInfoBackground.add(confirmBtn);
		
		//取消Btn
		cancelBtn.setBounds(340, 415, 80, 27);
		userInfoBackground.add(cancelBtn);
		//应用Btn
		applyBtn.setBounds(430, 415, 80, 27);
		userInfoBackground.add(applyBtn);
		
		//用户头像
		userPic.setBounds(15, 15, 100, 100);
		userInfoBackground.add(userPic);
		
		//更换头像
		changeUserPic.setBounds(15, 120, 100, 27);
		userInfoBackground.add(changeUserPic);
		
		//昵称Label
		nickNameLabel.setBounds(130, 25, 40, 27);
		userInfoBackground.add(nickNameLabel);
		
		//昵称textField
		nickNameTF.setBounds(175, 25, 120, 27);
		nickNameTF.setOpaque(false);
		userInfoBackground.add(nickNameTF);
		
		//帐号label
		userAccount.setBounds(310, 25, 40, 27);
		userInfoBackground.add(userAccount);
		
		//用户帐号
		userAccountNum.setBounds(355, 25, 120, 27);
		//userAccountNum.setText("290976110");
		userInfoBackground.add(userAccountNum);
		
		//个性签名Label
		userSignLabel.setBounds(130, 60, 70, 27);
		userInfoBackground.add(userSignLabel);
		
		//个性签名
		userSignTA.setBounds(130, 85, 400, 55);
		signScroll = new JScrollPane(userSignTA);
		LineBorder userSignTABorder = new LineBorder(Color.WHITE, 1);
		userSignTA.setOpaque(false);
		userSignTA.setBorder(userSignTABorder);
		userInfoBackground.add(userSignTA);
		
		//选项卡
		userInfoTP.setBounds(40, 150, 490, 255);
		userInfoTP.add("基本资料", basicInfo);
		userInfoTP.add("更多资料", moreInfo);
		basicInfo.setLayout(null);
		moreInfo.setLayout(null);
		userInfoBackground.add(userInfoTP);
		
		
		//姓名label
		realNameLabel.setBounds(5, 5, 60, 27);
		basicInfo.add(realNameLabel);
		
		//姓名
		realNameTF.setBounds(70, 5, 80, 27);
		realNameTF.setOpaque(false);
		basicInfo.add(realNameTF);
		
		//英文名label
		engNameLabel.setBounds(200, 5, 60, 27);
		basicInfo.add(engNameLabel);
		
		//英文名
		engNameTF.setBounds(265, 5, 120, 27);
		engNameTF.setOpaque(false);
		basicInfo.add(engNameTF);
		
		//性别label
		sexLabel.setBounds(5, 35, 60, 27);
		basicInfo.add(sexLabel);
		
		//性别
		sexCom.setBounds(70, 35, 80, 27);
		sexCom.addItem("男");
		sexCom.addItem("女");
		sexCom.addItem("女博士");
		sexCom.addItem("人妖");
		sexCom.setOpaque(false);
		basicInfo.add(sexCom);
		
		//年龄label
		ageLabel.setBounds(200, 35, 60, 27);
		basicInfo.add(ageLabel);
		
		//年龄
		ageTF.setBounds(265, 35, 40, 27);
		ageTF.setOpaque(false);
		basicInfo.add(ageTF);
		
		//生日label
		birthdayLabel.setBounds(5, 65, 60, 27);
		basicInfo.add(birthdayLabel);
		
		//生日
		birthdayTF.setBounds(70, 65, 80, 27);
		birthdayTF.setOpaque(false);
		basicInfo.add(birthdayTF);
		
		//生肖label
		animalLabel.setBounds(200, 65, 60, 27);
		basicInfo.add(animalLabel);
		
		//生肖
		animalCom.setBounds(265, 65, 50, 27);
		animalCom.addItem("鼠");
		animalCom.addItem("牛");
		animalCom.addItem("虎");
		animalCom.addItem("兔");
		animalCom.addItem("龙");
		animalCom.addItem("蛇");
		animalCom.addItem("马");
		animalCom.addItem("羊");
		animalCom.addItem("猴");
		animalCom.addItem("鸡");
		animalCom.addItem("狗");
		animalCom.addItem("猪");
		basicInfo.add(animalCom);
		
		//星座label
		constellationLabel.setBounds(5, 95, 60, 27);
		basicInfo.add(constellationLabel);
		
		//星座
		constellationCom.setBounds(70, 95, 80, 27);
		constellationCom.addItem("摩羯座");
		constellationCom.addItem("水瓶座");
		constellationCom.addItem("白羊座");
		constellationCom.addItem("金牛座");
		constellationCom.addItem("射手座");
		constellationCom.addItem("天秤座");
		constellationCom.addItem("巨蟹座");
		constellationCom.addItem("双子座");
		constellationCom.addItem("狮子座");
		constellationCom.addItem("双鱼座");
		constellationCom.addItem("处女座");
		constellationCom.addItem("天蝎座");
		basicInfo.add(constellationCom);
		
		//血型label
		bloodTypeLabel.setBounds(200, 95, 60, 27);
		basicInfo.add(bloodTypeLabel);
		
		//血型
		bloodTypCom.setBounds(265, 95, 60, 27);
		bloodTypCom.addItem("A");
		bloodTypCom.addItem("B");
		bloodTypCom.addItem("AB");
		bloodTypCom.addItem("O");
		bloodTypCom.addItem("其他");
		basicInfo.add(bloodTypCom);
		
		//故乡label
		homeTownLabel.setBounds(5, 125, 60, 27);
		basicInfo.add(homeTownLabel);
		
		//故乡
		homeTownTF.setBounds(70, 125, 280, 27);
		homeTownTF.setOpaque(false);
		basicInfo.add(homeTownTF);
		
		//所在地label
		locationLabel.setBounds(5, 155, 60, 27);
		basicInfo.add(locationLabel);
		
		//所在地
		locationTF.setBounds(70, 155, 280, 27);
		locationTF.setOpaque(false);
		basicInfo.add(locationTF);
		
		//地址label
		addressLabel.setBounds(5, 185, 60, 27);
		basicInfo.add(addressLabel);
		
		//地址
		addressTF.setBounds(70, 185, 280, 27);
		addressTF.setOpaque(false);
		basicInfo.add(addressTF);
		
		//邮编label
		postcodeLabel.setBounds(5, 215, 60, 27);
		basicInfo.add(postcodeLabel);
		
		//邮编
		postcodeTF.setBounds(70, 215, 120, 27);
		postcodeTF.setOpaque(false);
		basicInfo.add(postcodeTF);
		
//更多资料
		//电话label
		teleNumLabel.setBounds(5, 5, 60, 27);
		moreInfo.add(teleNumLabel);
		
		//电话
		teleNumTF.setBounds(70, 5, 100, 27);
		teleNumTF.setOpaque(false);
		moreInfo.add(teleNumTF);
		
		//手机label
		mobiNumLabel.setBounds(200, 5, 60, 27);
		moreInfo.add(mobiNumLabel);
		
		//手机
		mobiNumTF.setBounds(265, 5, 120, 27);
		mobiNumTF.setOpaque(false);
		moreInfo.add(mobiNumTF);
		
		//邮箱label
		mailBoxLabel.setBounds(5, 35, 60, 27);
		moreInfo.add(mailBoxLabel);
		
		//邮箱
		mailBoxTF.setBounds(70, 35, 150, 27);
		mailBoxTF.setOpaque(false);
		moreInfo.add(mailBoxTF);
		
		//职业label
		occupationLabel.setBounds(5, 65, 60, 27);
		moreInfo.add(occupationLabel);
		
		//职业
		occupationCom.setBounds(70, 65, 110, 27);
		occupationCom.addItem("在校学生");
		occupationCom.addItem("固定工作者");
		occupationCom.addItem("自由职业者");
		occupationCom.addItem("待业/无业/失业");
		occupationCom.addItem("退休");
		occupationCom.addItem("其他");
		moreInfo.add(occupationCom);
		
		//职位label
		positionLabel.setBounds(200, 65, 60, 27);
		moreInfo.add(positionLabel);
		
		//职位
		positionTF.setBounds(265, 65, 120, 27);
		positionTF.setOpaque(false);
		moreInfo.add(positionTF);
		
		//学历label
		eduLabel.setBounds(5, 95, 60, 27);
		moreInfo.add(eduLabel);
		
		//学历
		eduCom.setBounds(70, 95, 110, 27);
		eduCom.addItem("小学及以下");
		eduCom.addItem("初中");
		eduCom.addItem("高中");
		eduCom.addItem("大专");
		eduCom.addItem("本科");
		eduCom.addItem("研究生");
		eduCom.addItem("博士及以上");
		moreInfo.add(eduCom);
		
		//学校label
		schoolLabel.setBounds(200, 95, 60, 27);
		moreInfo.add(schoolLabel);
		
		//学校
		schoolTF.setBounds(265, 95, 120, 27);
		schoolTF.setOpaque(false);
		moreInfo.add(schoolTF);
		
		//个人说明label
		personalStateLabel.setBounds(5, 115, 100, 27);
		moreInfo.add(personalStateLabel);
		
		//个人说明
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
