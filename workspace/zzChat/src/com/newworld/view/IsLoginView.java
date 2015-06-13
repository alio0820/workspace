package com.newworld.view;

import java.awt.BorderLayout;
import java.awt.FlowLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import com.new_world.operation.login.LoginOperate;
import com.new_world.operation.mainframe.MainDisplay;
import com.newworld.common.Conn;

///-------------正在登陆页面-------------by Akira 2012-07-19------
public class IsLoginView extends Thread {
	private JPanel jPanelLoging = new ImagePanel("image/loging.gif");// 背景图
	private JFrame jFrame = new JFrame("正在登陆...");
	private JButton btnCancel = new JButton("取消");// 取消按钮
	private int userId;
	private String passWord;
	private int userStatus;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	private boolean bl =true;

	public IsLoginView(String userid, String password,int userstatus) {
		this.userId = Integer.parseInt(userid);
		this.passWord = password;
		this.userStatus=userstatus;
		
		ImageIcon image = new ImageIcon("image/jjjjjjj.png");
		jFrame.setIconImage(image.getImage());
		// jPanelLoging.setLayout(null);
		jFrame.setBounds(950, 100, 298, 753);
		jPanelLoging.setLayout(null);
		// jFrame.setLocationRelativeTo(null);
		// btnCancel.setLayout(null);
		// jPanelLoging.add(btnCancel);
		// jPanelLoging.add(btnCancel,BorderLayout.CENTER);
		// jPanelLoging.setLayout(new BorderLayout());
		// jPanelLoging.add(btnCancel,BorderLayout.CENTER);
		btnCancel.setBounds(100, 300, 80, 30);
		jFrame.add(jPanelLoging);// /?????????????btn无法到定位到正中央。
		jPanelLoging.add(btnCancel);

		jFrame.setResizable(false);
		jFrame.setDefaultCloseOperation(3);
		jFrame.setVisible(true);

		btnCancel.addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				jFrame.dispose();
				new LoginOperate(userId+"");
				bl=false;
				}
		});

	}

	public JPanel getjPanelLoging() {
		return jPanelLoging;
	}

	public void setjPanelLoging(JPanel jPanelLoging) {
		this.jPanelLoging = jPanelLoging;
	}

	public JFrame getjFrame() {
		return jFrame;
	}

	public void setjFrame(JFrame jFrame) {
		this.jFrame = jFrame;
	}

	public JButton getBtnCancel() {
		return btnCancel;
	}

	public void setBtnCancel(JButton btnCancel) {
		this.btnCancel = btnCancel;
	}

	/*
	 * public static void main(String[] args) { new IsLoginView(); }
	 */
	@Override
	public void run() {
		try {
			Thread.sleep(1500);
			jFrame.dispose();
			if(this.bl){
			Connection connection = conn.getConnection(null);
			pstmt = connection
					.prepareStatement("select password,status from  userinfor where userid = ? ");

			pstmt.setInt(1, userId);
			ResultSet rst = pstmt.executeQuery();
			String pwd = "";
			int nowStatus=0;
			if (rst.next()) {
				pwd = rst.getString("password");
				nowStatus=rst.getInt("status");			
			}if(nowStatus!=0){
				JOptionPane.showMessageDialog(null, "你的账号已经登陆！", "温馨提示",
						JOptionPane.ERROR_MESSAGE);
				new LoginOperate(userId+"");				
			}else{
				if (pwd.equals(passWord)) {
					
					pstmt = connection.prepareStatement("update userInfor set status = ? where userId = ?");
					pstmt.setInt(1, userStatus);
					pstmt.setInt(2, userId);
					pstmt.executeUpdate();
					new MainDisplay(userId);
				} else {
					File file = new File("D:/" + userId+ ".txt");
					File f1 = new File("D:/自动登录.txt");
					String str = String.valueOf(System.getProperty("user.dir"));
					File f2 = new File(str + "/"
							+ String.valueOf(userId)
							+ "SysSetFile.txt");
					file.delete();
					f1.delete();
					f2.delete();
					JOptionPane.showMessageDialog(null, "你输入的账号或密码有误！", "温馨提示",
							JOptionPane.ERROR_MESSAGE);
					new LoginOperate(userId+"");
				}				
			}
	         rst.close();
	         pstmt.close();
		}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
