package com.newworld.view;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JTextField;
import javax.swing.JToolBar;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import com.new_world.operation.pwdfind.PwdFindBackOperation;
import com.new_world.operation.register.RegisterOperate;

//-------------------µÇÂ½Ò³Ãæ------by Akira 2012-7-18---------
public class LoginView extends JFrame{

	private JFrame jFrame=new JFrame("ZZChatµÇÂ½");
	//LoginPanel_window_windowBkg.jpg
	private JPanel jPanel=new ImagePanel("image/backlog.jpg");//µÇÂ¼±³¾°Í¼
	private JPanel jPanel2=new ImagePanel("image/piglog.png");//Í·Ïñ
	private JButton btnLogin=new JButton("µÇÂ½");
	private JButton btnReg=new JButton("×¢²á");
	private JButton btnFindPass=new JButton("ÕÒ»ØÃÜÂë");
	private JTextField jnametext=new JTextField(10);
	private JPasswordField jPasstext=new JPasswordField(20);
	private JLabel lableName=new JLabel("ÕËºÅ:");
	private JLabel lablePass=new JLabel("ÃÜÂë:");
	private JCheckBox autoCheck=new JCheckBox("×Ô¶¯µÇÂ¼");
	private JCheckBox reme=new JCheckBox("¼Ç×¡ÃÜÂë"); 
	private JComboBox userStatus =new JComboBox(); 
	public JComboBox getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(JComboBox userStatus) {
		this.userStatus = userStatus;
	}
	private JToolBar jBar=new JToolBar("×¢²áµÇÂ¼");
	
	public LoginView() {
		
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		jFrame.setIconImage(image.getImage());
		
		jPanel.setLayout(null);
		jFrame.setBounds(400,300,385,305);
		
		jPanel.add(lableName);			//ÓÃ»§ÕËºÅ
		lableName.setBounds(110, 110, 200, 20);
		jPanel.add(jnametext);			//ÊäÈëÕËºÅ¿ò
		jnametext.setBounds(150, 110, 180, 25);
		
		jPanel.add(lablePass);			//ÃÜÂë
		lablePass.setBounds(110,140, 180, 20);
		jPanel.add(jPasstext);			//ÃÜÂëÊäÈë¿ò
		jPasstext.setBounds(150, 140, 180, 25);
		
		jPanel.add(btnLogin);			//µÇÂ¼°´Å¥
		btnLogin.setBounds(270, 220, 60, 25);
		jPanel.add(btnReg);				//×¢²á°´Å¥
		btnReg.setBounds(140, 220, 60, 25);
		jPanel.add(btnFindPass);		//ÕÒ»ØÃÜÂë°´Å¥
		btnFindPass.setBounds(40, 220, 90, 25);
		
		jPanel.add(reme);				//¼Ç×¡ÃÜÂëÑ¡Ôñ°´Å¥
		reme.setBounds(180, 180, 80, 25);
		jPanel.add(autoCheck);			//×Ô¶¯µÇÂ¼Ñ¡Ôñ°´Å¥
		autoCheck.setBounds(260, 180, 80, 25);
		
		userStatus.addItem("ÔÚÏß");			//×´Ì¬¿ò
		userStatus.addItem("Ã¦Âµ");
		userStatus.addItem("Àë¿ª");
		userStatus.addItem("ÒþÉí");
		userStatus.setBounds(110, 180, 60, 25);
		jPanel.add(userStatus);
		
		jPanel2.setBounds(10, 90, 100, 100);
		jPanel.add(jPanel2);
		jFrame.add(jPanel);
		
		jFrame.setResizable(false);
		jFrame.setVisible(true);
		jFrame.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);
		
		btnReg.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new RegisterOperate();
				jFrame.dispose();
				
			}
		});
		
		btnFindPass.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				new PwdFindBackOperation();
				jFrame.dispose();
				
			}
		});
	}
	public static void main(String[] args) throws  Exception {
		//UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");  
		//UIManager.setLookAndFeel("com.jtattoo.plaf.noire.NoireLookAndFeel");
		new LoginView();
	}
	public JFrame getjFrame() {
		return jFrame;
	}
	public void setjFrame(JFrame jFrame) {
		this.jFrame = jFrame;
	}
	public JPanel getjPanel() {
		return jPanel;
	}
	public void setjPanel(JPanel jPanel) {
		this.jPanel = jPanel;
	}
	public JPanel getjPanel2() {
		return jPanel2;
	}
	public void setjPanel2(JPanel jPanel2) {
		this.jPanel2 = jPanel2;
	}
	public JButton getBtnLogin() {
		return btnLogin;
	}
	public void setBtnLogin(JButton btnLogin) {
		this.btnLogin = btnLogin;
	}
	public JButton getBtnReg() {
		return btnReg;
	}
	public void setBtnReg(JButton btnReg) {
		this.btnReg = btnReg;
	}
	public JButton getBtnFindPass() {
		return btnFindPass;
	}
	public void setBtnFindPass(JButton btnFindPass) {
		this.btnFindPass = btnFindPass;
	}
	public JTextField getJnametext() {
		return jnametext;
	}
	public void setJnametext(JTextField jnametext) {
		this.jnametext = jnametext;
	}
	public JPasswordField getjPasstext() {
		return jPasstext;
	}
	public void setjPasstext(JPasswordField jPasstext) {
		this.jPasstext = jPasstext;
	}
	public JLabel getLableName() {
		return lableName;
	}
	public void setLableName(JLabel lableName) {
		this.lableName = lableName;
	}
	public JLabel getLablePass() {
		return lablePass;
	}
	public void setLablePass(JLabel lablePass) {
		this.lablePass = lablePass;
	}
	public JCheckBox getAutoCheck() {
		return autoCheck;
	}
	public void setAutoCheck(JCheckBox autoCheck) {
		this.autoCheck = autoCheck;
	}
	public JCheckBox getReme() {
		return reme;
	}
	public void setReme(JCheckBox reme) {
		this.reme = reme;
	}     
    	

	public JToolBar getjBar() {
		return jBar;
	}
	public void setjBar(JToolBar jBar) {
		this.jBar = jBar;
	}
	
}
