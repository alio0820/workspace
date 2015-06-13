package com.new_world.operation.pwdfind;

import java.awt.event.ActionEvent;

import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import com.newworld.common.Conn;
import javax.swing.JOptionPane;
import javax.swing.UIManager;

import com.newworld.view.pwdFindBackView;
import com.new_world.operation.login.LoginOperate;

/**author:张四琼
* Time:2012-07-23  18:41
* Last change:
* function: 找回密码
*/

public class PwdFindBackOperation {

	pwdFindBackView pfbv;
	private String pwd;
	private String id ;
	private int i;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;

	private String f,s,t;
	public PwdFindBackOperation() {
		pfbv = new pwdFindBackView();

		// pfbv.getUserAccountTF().getText();

		// 初始化状态
		pfbv.getFirstQuesCom().setVisible(false);
		pfbv.getFirstQuesTF().setVisible(false);
		pfbv.getSecondQuesCom().setVisible(false);
		pfbv.getSecondQuesTF().setVisible(false);
		pfbv.getThirdQuesCom().setVisible(false);
		pfbv.getThirdQuesTF().setVisible(false);
		pfbv.getReSetTextBtn().setVisible(false);
		pfbv.getConfirmQuesBtn().setVisible(false);
		pfbv.getCancelBtn().setVisible(false);

		// 下一步操作按钮
		pfbv.getNextProcessBtn().addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {

				Connection connection = conn.getConnection(null);
				String account = pfbv.getUserAccountTF().getText();
				boolean flag = true;
				if(!account.equals("")){
					for(int i = 0;i < account.length();i++){
						if(!Character.isDigit(account.charAt(i)) ){
							flag = false;
							break;
						}
					}
				}
				else{
					flag = false;
				}
				
				if (flag) {
					try {
						pstmt = connection.prepareStatement("select userId from userInfor where userId =?");
						pstmt.setInt(1, Integer.parseInt(account));
						ResultSet rs1 = pstmt.executeQuery();
						if (rs1.next()) {
							pfbv.getFirstQuesCom().setVisible(true);
							pfbv.getFirstQuesTF().setVisible(true);
							pfbv.getSecondQuesCom().setVisible(true);
							pfbv.getSecondQuesTF().setVisible(true);
							pfbv.getThirdQuesCom().setVisible(true);
							pfbv.getThirdQuesTF().setVisible(true);
							pfbv.getReSetTextBtn().setVisible(true);
							pfbv.getConfirmQuesBtn().setVisible(true);
							pfbv.getCancelBtn().setVisible(true);
							pfbv.getUserAccountTF().setEditable(false);
						}else{
							JOptionPane.showMessageDialog(pfbv, "你的用户ID不不存在", "警告", JOptionPane.OK_OPTION);
						}
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}else{
					JOptionPane.showMessageDialog(pfbv, "你的用户ID不能为空也不能包含字母", "警告", JOptionPane.OK_OPTION);
				}
				
				
				
			}
		});

		// 重置按钮
		pfbv.getReSetTextBtn().addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				pfbv.getFirstQuesTF().setText("");
				pfbv.getSecondQuesTF().setText("");
				pfbv.getThirdQuesTF().setText("");

			}
		});

		// 取消按钮
		pfbv.getCancelBtn().addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				pfbv.dispose();

			}
		});

		// 提交按钮
		pfbv.getConfirmQuesBtn().addActionListener(new ActionListener() {

			@Override
			public void actionPerformed(ActionEvent e) {
				boolean flag = false;
				String ft = pfbv.getFirstQuesTF().getText();
				String st = pfbv.getSecondQuesTF().getText();
				String tt = pfbv.getThirdQuesTF().getText();
				try {
					pwd = getPwd();
				} catch (Exception e1) {
					e1.printStackTrace();
				}
				try {
					id = pfbv.getUserAccountTF().getText();
					i = Integer.parseInt(id);
					String fq = String.valueOf(pfbv.getFirstQuesCom().getItemAt(
							pfbv.getFirstQuesCom().getSelectedIndex()));
					String sq = String.valueOf(pfbv.getSecondQuesCom().getItemAt(
							pfbv.getSecondQuesCom().getSelectedIndex()));
					String tq = String.valueOf(pfbv.getThirdQuesCom().getItemAt(
							pfbv.getThirdQuesCom().getSelectedIndex()));

					Connection connection = conn.getConnection(null);
					
					pstmt = connection.prepareStatement("select answer from answer where questionNum=(select questionid from question where question=? ) and userid=?   ");
			    	//第一个问题
					pstmt.setString(1, fq);
					pstmt.setInt(2, i);
					ResultSet rs1 = pstmt.executeQuery();

					while (rs1.next()) {
						f = rs1.getString("answer");
					}
					//第二个问题		
					pstmt.setString(1, sq);
					pstmt.setInt(2, i);
					ResultSet rs2 = pstmt.executeQuery();
					while (rs2.next()) {
						s = rs2.getString("answer");
					}
					//第三个问题
					pstmt.setString(1, tq);
					pstmt.setInt(2, i);
					ResultSet rs3 = pstmt.executeQuery();
					while (rs3.next()) {
						t = rs3.getString("answer");
					}
				
					
					//判断密报问题是否正确
					if (ft.equals(f) && st.equals(s) && tt.equals(t) ) {
						JOptionPane.showConfirmDialog(pfbv, "你的密码是："
								+ pwd + "\n请记录......\n记录完毕后请按确定键。", "密码已经找回",
								JOptionPane.CLOSED_OPTION,
								JOptionPane.INFORMATION_MESSAGE);
						pfbv.dispose();
						new LoginOperate(pfbv.getUserAccountTF().getText());
					}else{
						int res = JOptionPane.showConfirmDialog(pfbv,
								"密码保护问题回答错误，请重新回答或者退出。\n选择”是“重新作答，选择”否“退出", "错误",
								JOptionPane.YES_NO_OPTION,
								JOptionPane.WARNING_MESSAGE);
						// yes
						if (res == 0) {
							pfbv.getFirstQuesTF().setText("");
							pfbv.getSecondQuesTF().setText("");
							pfbv.getThirdQuesTF().setText("");
						}
						// no
						if (res == 1) {
							pfbv.dispose();
						}
					}
				} catch (Exception e1) {

					e1.printStackTrace();
				}

			}
		});
	}

	// 从数据库中取出账号对应的密码
	public String getPwd() throws Exception {
		String id = pfbv.getUserAccountTF().getText();
		Connection connection = conn.getConnection(null);
		pstmt = connection
				.prepareStatement("select passWord from userinfor where userId=? ");
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			pwd = rs.getString("passWord");
		}
		rs.close();
		pstmt.close();
		connection.close();
		return pwd;
	}

	
	public static void main(String[] args) {
		try {
			UIManager
					.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		new PwdFindBackOperation();
	}
}
