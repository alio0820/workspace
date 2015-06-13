package com.new_world.operation.login;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JOptionPane;
import javax.swing.UIManager;
import javax.swing.UnsupportedLookAndFeelException;

import com.new_world.operation.mainframe.FriendList;
import com.new_world.operation.pwdfind.PwdFindBackOperation;
import com.new_world.operation.register.RegisterOperate;
import com.newworld.common.Conn;
import com.newworld.view.IsLoginView;
import com.newworld.view.LoginView;
import com.newworld.view.RegisterView;
import com.newworld.view.pwdFindBackView;

public class LoginOperate {

	/**
	 * @param args
	 */
	LoginView lv;
	FileInputStream fis;
	private Socket socket;
	private ObjectOutputStream oos;
	FileInputStream readSysSet;
	private PrintWriter pw;
	private String status;
    private static boolean bl=true;
	public static void main(String[] args) throws  Exception {
		// 优化界面
		try {
			 // UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");
			//UIManager.setLookAndFeel("com.jtattoo.plaf.hifi.HiFiLookAndFeel");
			//UIManager.setLookAndFeel("com.jtattoo.plaf.mint.MintLookAndFeel");  
			 UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		new LoginOperate("");
	}

	public LoginOperate(String userid) {
		File file = new File("D:/自动登录.txt");
		if(file.exists() && bl==true && userid==""){
			try {
				BufferedReader br = new BufferedReader(new FileReader(file));
				String loginid=br.readLine();
				String loginpwd=br.readLine();
				int loginstatus=Integer.parseInt(br.readLine());
				IsLoginView is = new IsLoginView(loginid, loginpwd,loginstatus);
				is.start();
				bl=false;
				br.close();
				
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else{
			lv = new LoginView();
			lv.getJnametext().setText(userid);
			
			lv.getjPasstext().addKeyListener(new KeyAdapter() {
				public void keyPressed(KeyEvent e) {
					boolean flag=true;
					if(e.getKeyCode()==10){
					
					String userid = lv.getJnametext().getText();
					String pwd = new String(lv.getjPasstext().getPassword());
					int userstatus=lv.getUserStatus().getSelectedIndex()+1;
					for(int i=0;i<userid.length();i++){
						if(!Character.isDigit(userid.charAt(i)) ){
							flag= false;
							break;
						}
					}
					if (userid.equals("")) {
						JOptionPane.showMessageDialog(null, "账号不能为空！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();
					} else if(flag==false){
						JOptionPane.showMessageDialog(null, "账号只能为数字！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();
					}else if (pwd.equals("")) {
						JOptionPane.showMessageDialog(null, "密码不能为空！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();

					} else {

						if (lv.getReme().isSelected()) {
							try {
								pw = new PrintWriter("D:/"
										+ lv.getJnametext().getText() + ".txt");
							} catch (FileNotFoundException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
							pw.println(lv.getjPasstext().getPassword());
							pw.flush();
							pw.close();
						}
						if(lv.getAutoCheck().isSelected()){
							try {
								pw = new PrintWriter("D:/自动登录.txt");
							} catch (FileNotFoundException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
							pw.println(lv.getJnametext().getText());
							pw.println(lv.getjPasstext().getPassword());
							pw.println(lv.getUserStatus().getSelectedIndex()+1);
							pw.flush();
							pw.close();							
						}else{
							File loginfile = new File("D:/自动登录.txt");
							if(loginfile.exists()){
								try {
									BufferedReader br = new BufferedReader(new FileReader(loginfile));
									String loginid=br.readLine();
									if(loginid.equals(lv.getJnametext().getText())){
										br.close();
										loginfile.delete();
									}
									
								} catch (Exception e1) {
									// TODO Auto-generated catch block
									e1.printStackTrace();
								}
							}
							File pwdfile = new File("D:/"
									+ lv.getJnametext().getText() + ".txt");
							if(pwdfile.exists()){
								pwdfile.delete();
							}
						}
						lv.getjFrame().dispose();
						IsLoginView is = new IsLoginView(userid, pwd,userstatus);
						is.start();
					}	
				}
				}
			});
			// 用户登陆处理
			lv.getBtnLogin().addActionListener(new ActionListener() {

				public void actionPerformed(ActionEvent e) {
					boolean flag=true;
					String userid = lv.getJnametext().getText();
					String pwd = new String(lv.getjPasstext().getPassword());
					int userstatus=lv.getUserStatus().getSelectedIndex()+1;
					for(int i=0;i<userid.length();i++){
						if(!Character.isDigit(userid.charAt(i)) ){
							flag= false;
							break;
						}
					}
					if (userid.equals("")) {
						JOptionPane.showMessageDialog(null, "账号不能为空！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();
					} else if(flag==false){
						JOptionPane.showMessageDialog(null, "账号只能为数字！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();
					}else if (pwd.equals("")) {
						JOptionPane.showMessageDialog(null, "密码不能为空！", "温馨提示",
								JOptionPane.ERROR_MESSAGE);
						lv.getjPanel().repaint();

					} else {

						if (lv.getReme().isSelected()) {
							try {
								pw = new PrintWriter("D:/"
										+ lv.getJnametext().getText() + ".txt");
							} catch (FileNotFoundException e1) {
								e1.printStackTrace();
							}
							pw.println(lv.getjPasstext().getPassword());
							pw.flush();
							pw.close();
						}else{
							File pwdflie = new File("D:/"
									+ lv.getJnametext().getText() + ".txt");
							if(pwdflie.exists()){
								pwdflie.delete();
							}
						}
						if(lv.getAutoCheck().isSelected()){
							lv.getReme().setSelected(true);
							try {
								pw = new PrintWriter("D:/自动登录.txt");
							} catch (FileNotFoundException e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
							pw.println(lv.getJnametext().getText());
							pw.println(lv.getjPasstext().getPassword());
							pw.println(lv.getUserStatus().getSelectedIndex()+1);
							pw.flush();
							pw.close();							
						}else{
							File loginfile = new File("D:/自动登录.txt");
							if(loginfile.exists()){
								try {
									BufferedReader br = new BufferedReader(new FileReader(loginfile));
									String loginid=br.readLine();
									if(loginid.equals(lv.getJnametext().getText())){
										br.close();
										loginfile.delete();
									}
									
								} catch (Exception e1) {
									// TODO Auto-generated catch block
									e1.printStackTrace();
								}
							}
						}
						lv.getjFrame().dispose();
						IsLoginView is = new IsLoginView(userid, pwd,userstatus);
						is.start();
					}

				}
			});

			// 在当地文件中保存密码和状态的账号可以直接生成密码和状态
			lv.getJnametext().addFocusListener(new FocusListener() {
				public void focusLost(FocusEvent e) {
					try {
						File loginfile = new File("D:/自动登录.txt");
						if(loginfile.exists()){
							try {
								BufferedReader br = new BufferedReader(new FileReader(loginfile));
								String loginid=br.readLine();
								if(loginid.equals(lv.getJnametext().getText())){
									lv.getAutoCheck().setSelected(true);
								}
								br.close();
								
							} catch (Exception e1) {
								// TODO Auto-generated catch block
								e1.printStackTrace();
							}
						}
						File file = new File("D:/" + lv.getJnametext().getText()
								+ ".txt");
						if (file.exists()) {
							BufferedReader br = new BufferedReader(new FileReader(file));
							String s = br.readLine();
							lv.getReme().doClick();
							lv.getjPasstext().setText(s);
							String str = String.valueOf(System.getProperty("user.dir"));
							File f1 = new File(str + "/"
									+ String.valueOf(lv.getJnametext().getText())
									+ "SysSetFile.txt");
							if (!f1.exists()) {
								try {
									f1.createNewFile();
									lv.getUserStatus().setSelectedItem("在线");
								} catch (IOException e1) {
									e1.printStackTrace();
								}
								}else{
									readSysSet = new FileInputStream(str + "/"
											+ String.valueOf(lv.getJnametext().getText())
											+ "SysSetFile.txt");
									int aa = readSysSet.read();
									if(aa == -1){
										lv.getUserStatus().setSelectedItem("在线");
									}else{
										int a = readSysSet.read() - 1;
										lv.getUserStatus().setSelectedItem(
												lv.getUserStatus().getItemAt(a));
									}
								}
						} else {
							lv.getjPasstext().setText("");
							String str = String.valueOf(System.getProperty("user.dir"));
							File f1 = new File(str + "/"
									+ String.valueOf(lv.getJnametext().getText())
									+ "SysSetFile.txt");
							if (!f1.exists()) {
								try {
									f1.createNewFile();
									lv.getUserStatus().setSelectedItem("在线");
								} catch (IOException e1) {
									e1.printStackTrace();
								}
								}else{
									readSysSet = new FileInputStream(str + "/"
											+ String.valueOf(lv.getJnametext().getText())
											+ "SysSetFile.txt");
									int aa = readSysSet.read();
									if(aa == -1){
										lv.getUserStatus().setSelectedItem("在线");
									}else{
										int a = readSysSet.read() - 1;
										lv.getUserStatus().setSelectedItem(
												lv.getUserStatus().getItemAt(a));
									}
							}
			
						}
					}catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

				}

				public void focusGained(FocusEvent e) {
					// TODO Auto-generated method stub

				}
			});

		}

		}

}
