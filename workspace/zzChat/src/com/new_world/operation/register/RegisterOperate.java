package com.new_world.operation.register;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.FocusEvent;
import java.awt.event.FocusListener;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Random;

import javax.swing.JOptionPane;
import javax.swing.UIManager;

import com.new_world.operation.login.LoginOperate;
import com.new_world.operation.mainframe.FriendList;
import com.new_world.operation.pwdfind.PwdFindBackOperation;
import com.newworld.common.Conn;
import com.newworld.view.LoginView;
import com.newworld.view.RegisterView;

public class RegisterOperate {
	RegisterView rv;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		new RegisterOperate();
	}
	public RegisterOperate() {
		rv=new RegisterView();
		rv.getSureRegBtn().setEnabled(false);
		rv.getNameWarnLabel().setVisible(false);
		rv.getPassCueLabel().setVisible(false);
		rv.getPassSureCueLabel().setVisible(false);
		
		//获取昵称
		rv.getNameReg().addFocusListener(new FocusListener() {
		
			public void focusLost(FocusEvent e) {
				String name=rv.getNameReg().getText();
				if(name.length()<1 || name.length()>6){
					rv.getNameWarnLabel().setVisible(true);

				}else{
					rv.getNameWarnLabel().setVisible(false);
				}
			}
			
			public void focusGained(FocusEvent e) {
				
			}
		});
		//获取密码
		rv.getPasswordReg().addFocusListener(new FocusListener() {
			
			@Override
			public void focusLost(FocusEvent e) {
				String password=new String(rv.getPasswordReg().getPassword());
				if(password.length()<6 || password.length()>16){
					rv.getPassCueLabel().setVisible(true);
				}else{
					rv.getPassCueLabel().setVisible(false);
				}
			}
			public void focusGained(FocusEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
		//判断两次密码是否一致
		rv.getPassSureReg().addFocusListener(new FocusListener() {
			
			@Override
			public void focusLost(FocusEvent e) {
				// TODO Auto-generated method stub
				String passwordsure=new String(rv.getPassSureReg().getPassword());
				if(!new String(rv.getPasswordReg().getPassword()).equals(passwordsure)){
					rv.getPassSureCueLabel().setVisible(true);
				}else{
					rv.getPassSureCueLabel().setVisible(false);
				}
				
			}
			
			public void focusGained(FocusEvent e) {
				// TODO Auto-generated method stub
				
			}
		});
		
		
		//选择本软件由New World.FakeQQ制作后，才可选择”立即注册“按钮
		rv.getSureBox().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(rv.getSureBox().isSelected()){
					rv.getSureRegBtn().setEnabled(true);
				}else{
					rv.getSureRegBtn().setEnabled(false);
				}			
			}
		});
		rv.getSureRegBtn().addActionListener(new ActionListener() {
			                                                                           
			public void actionPerformed(ActionEvent e) {				
				// TODO Auto-generated method stub
				//获取性别
				String sex="";
				if(rv.getFamaleRadio().isSelected()){
					sex="女";
				}else if(rv.getMaleRadio().isSelected()){
					sex="男";
				}
		        //获取生日和年龄
				int age=0;
				String birthday="";
				String year;
				year=(String) rv.getBirthYearCom().getSelectedItem();
				String mouth;
				mouth= rv.getBirthMonthCom().getSelectedItem().toString();
				String day;
				day= rv.getBirthDayCom().getSelectedItem().toString();
				if(year.equals("年") || mouth.equals("月") || day.equals("日")){
					birthday="";
				}else{
					birthday=year.substring(1, 5)+"-"+mouth.substring(1, mouth.length()-2)+"-"+day.substring(0,day.length()-1);
					int nowyear=new Date().getYear()+1900;
					age = nowyear-Integer.parseInt(year.substring(1, 5));
				}
				if(rv.getNameReg().getText().length()<1 ||rv.getNameReg().getText().length()>6 || rv.getPasswordReg().getPassword().length<6 || rv.getPasswordReg().getPassword().length>16
						|| !new String(rv.getPasswordReg().getPassword()).equals(new String(rv.getPassSureReg().getPassword()))){
					rv.getjFrame().repaint();
					rv.getSureRegBtn().setEnabled(false);
					rv.getSureBox().setSelected(false);
				}else{
					int userId;
					Random ran=new Random();
					userId=1000+ran.nextInt(99998999);
					Connection connection = conn.getConnection(null);
					try {
						pstmt = connection.prepareStatement("select userId,sex,password,nickName,birthday from  userinfor");
						ResultSet  rs=pstmt.executeQuery();
						if(!rs.next()){
							while(rs.next()){
								if(userId==rs.getInt("userId")){
									userId=10000+ran.nextInt(99998999);
									break;
								}
							}
						}
						
						pstmt = connection.prepareStatement("Insert into userinfor(nickName,userId,sex,password,birthday,age) values(?,?,?,?,?,?)  " 
								);  
						pstmt.setString(1, rv.getNameReg().getText());
						pstmt.setInt(2, userId);
						pstmt.setString(3, sex);
						pstmt.setString(4, String.valueOf(rv.getPasswordReg().getPassword()));
						pstmt.setString(5, birthday);
						pstmt.setInt(6, age);
						pstmt.executeUpdate();
						Object[] options = { "复制账号到桌面", "返回登陆界面" };
						int a=JOptionPane.showOptionDialog(null, "你获得的账号为："+userId, "恭喜你！", 
						JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE,
						null, options, options[0]);
						while(a==0 ||a==1 || a==-1){
							if(a==0){
								
						          PrintWriter pw=new PrintWriter("C:/Documents and Settings/All Users/桌面/"+rv.getNameReg().getText()+"账号.txt");										
						          pw.println("账号："+userId);
						          pw.println("密码："+String.valueOf(rv.getPasswordReg().getPassword()));
						          pw.flush();
							      pw.close();	
							      a=JOptionPane.showOptionDialog(null, "你获得的账号为："+userId, "恭喜你！", 
								       JOptionPane.YES_NO_OPTION, JOptionPane.WARNING_MESSAGE,
								       null, options, options[0]);
						   }else if(a==1){
								  rv.getjFrame().dispose();
								  new LoginOperate(userId+"");
								  break;
							}else{
								rv.getjFrame().dispose();
								break;
							}
						}
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		});
	}	
}
