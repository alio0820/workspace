package com.newworld.view;

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
import javax.swing.ListCellRenderer;

import com.newworld.*;
//-------------------µÇÂ½Ò³Ãæ------by Akira 2012-7-18---------
public class QQLoginView extends JFrame{
	private JFrame jFrame=new JFrame("ZZChatµÇÂ½");
	//LoginPanel_window_windowBkg.jpg
	private JPanel jPanel=new ImagePanel("image/LoginPanel_window_windowBkg.jpg");//µÇÂ¼±³¾°Í¼
	private JPanel jPanel2=new ImagePanel("image/qqlogo.jpg");//Í·Ïñ
	private JButton btnLogin=new JButton("µÇÂ½");
	private JButton btnReg=new JButton("×¢²á");
	private JButton btnFindPass=new JButton("ÕÒ»ØÃÜÂë");
	private JTextField jnametext=new JTextField(10);
	private JPasswordField jPasstext=new JPasswordField(20);
	private JLabel lableName=new JLabel("ÕËºÅ:");
	private JLabel lablePass=new JLabel("ÃÜÂë:");
	private JCheckBox autoCheck=new JCheckBox("×Ô¶¯µÇÂ¼");
	private JCheckBox reme=new JCheckBox("¼Ç×¡ÃÜÂë");
	private JComboBox stateCom=new JComboBox();
	private JToolBar jBar=new JToolBar("×¢²áµÇÂ¼");
	//private JLabel stateLabel=new JLabel();
	public QQLoginView() {
		
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
		btnLogin.setBounds(270, 220, 60, 20);
		jPanel.add(btnReg);				//×¢²á°´Å¥
		btnReg.setBounds(140, 220, 60, 20);
		jPanel.add(btnFindPass);		//ÕÒ»ØÃÜÂë°´Å¥
		btnFindPass.setBounds(40, 220, 90, 20);
		
		jPanel.add(reme);				//¼Ç×¡ÃÜÂëÑ¡Ôñ°´Å¥
		reme.setBounds(180, 180, 80, 20);
		reme.setOpaque(false);
		jPanel.add(autoCheck);			//×Ô¶¯µÇÂ¼Ñ¡Ôñ°´Å¥
		autoCheck.setBounds(260, 180, 80, 20);
		autoCheck.setOpaque(false);
		
		
		//stateLabel.setIcon(new ImageIcon("online.png"));
		stateCom.addItem("ÔÚÏß");			//×´Ì¬¿ò
		stateCom.addItem("Ã¦Âµ");
		stateCom.addItem("ÒþÉí");
		stateCom.addItem("Àë¿ª");
		stateCom.setBounds(110, 180, 60, 20);
		jPanel.add(stateCom);
		
		jPanel2.setBounds(30, 110, 70, 70);
		jPanel.add(jPanel2);
		jFrame.add(jPanel);
		
		jFrame.setResizable(false);
		jFrame.setVisible(true);
		jFrame.setDefaultCloseOperation(this.DISPOSE_ON_CLOSE);
		
	}
	
}
