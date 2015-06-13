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
//-------------------��½ҳ��------by Akira 2012-7-18---------
public class QQLoginView extends JFrame{
	private JFrame jFrame=new JFrame("ZZChat��½");
	//LoginPanel_window_windowBkg.jpg
	private JPanel jPanel=new ImagePanel("image/LoginPanel_window_windowBkg.jpg");//��¼����ͼ
	private JPanel jPanel2=new ImagePanel("image/qqlogo.jpg");//ͷ��
	private JButton btnLogin=new JButton("��½");
	private JButton btnReg=new JButton("ע��");
	private JButton btnFindPass=new JButton("�һ�����");
	private JTextField jnametext=new JTextField(10);
	private JPasswordField jPasstext=new JPasswordField(20);
	private JLabel lableName=new JLabel("�˺�:");
	private JLabel lablePass=new JLabel("����:");
	private JCheckBox autoCheck=new JCheckBox("�Զ���¼");
	private JCheckBox reme=new JCheckBox("��ס����");
	private JComboBox stateCom=new JComboBox();
	private JToolBar jBar=new JToolBar("ע���¼");
	//private JLabel stateLabel=new JLabel();
	public QQLoginView() {
		
		jPanel.setLayout(null);
		jFrame.setBounds(400,300,385,305);
		
		jPanel.add(lableName);			//�û��˺�
		lableName.setBounds(110, 110, 200, 20);
		jPanel.add(jnametext);			//�����˺ſ�
		jnametext.setBounds(150, 110, 180, 25);
		
		jPanel.add(lablePass);			//����
		lablePass.setBounds(110,140, 180, 20);
		jPanel.add(jPasstext);			//���������
		jPasstext.setBounds(150, 140, 180, 25);
		
		jPanel.add(btnLogin);			//��¼��ť
		btnLogin.setBounds(270, 220, 60, 20);
		jPanel.add(btnReg);				//ע�ᰴť
		btnReg.setBounds(140, 220, 60, 20);
		jPanel.add(btnFindPass);		//�һ����밴ť
		btnFindPass.setBounds(40, 220, 90, 20);
		
		jPanel.add(reme);				//��ס����ѡ��ť
		reme.setBounds(180, 180, 80, 20);
		reme.setOpaque(false);
		jPanel.add(autoCheck);			//�Զ���¼ѡ��ť
		autoCheck.setBounds(260, 180, 80, 20);
		autoCheck.setOpaque(false);
		
		
		//stateLabel.setIcon(new ImageIcon("online.png"));
		stateCom.addItem("����");			//״̬��
		stateCom.addItem("æµ");
		stateCom.addItem("����");
		stateCom.addItem("�뿪");
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
