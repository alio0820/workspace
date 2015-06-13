package com.new_world.operation.setinfo;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.UIManager;

import com.newworld.common.Conn;
import com.newworld.view.SystemSetView;

public class SetSysInfo {
	
	SystemSetView ssv;
	FileInputStream readSysSet;
	FileOutputStream writeSysSet;
	BufferedReader readPath;
	PrintWriter writePath;
	
	int [] writeData = new int[4];
	int [] readData = new int [5];
	
	String[] writeFilePath = new String[2];
	String[] readFilePath = new String[2];
	
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt=null;
	
	private Conn quesConn = Conn.getConnInstance();
	private PreparedStatement ps=null;
	private int id;
	private String str = "";
	
	public SetSysInfo(int useid) {
		this.id = useid;
		ssv = new SystemSetView();
		
		str = String.valueOf(System.getProperty("user.dir"));
		File f1 = new File(str + "/" + String.valueOf(id) + "SysSetFile.txt");
		if(!f1.exists()){
			try {
				f1.createNewFile();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		//设定图片的保存路径。
		File f2 = new File(str +  "/" + String.valueOf(id) + "FilePath.txt");
		if(!f2.exists()){
			try {
				f2.createNewFile();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		//用户自定义设置前不可见
		ssv.getUserDefinedTF().setEditable(false);
		ssv.getFileTransferFolder().setEditable(false);
		ssv.getUserDefinedTF().setVisible(false);
		ssv.getBrowserB().setVisible(false);
		
		//初始化系统设置信息
		try {
			int i = 0;
			readSysSet = new FileInputStream(str +  "/" + String.valueOf(id) + "SysSetFile.txt");
			
			readData[i] = readSysSet.read();
			while(readData[i] != -1){
				i++;
				readData[i] = readSysSet.read();
			}
			
			readPath = new BufferedReader(new FileReader(str +  "/" + String.valueOf(id) + "FilePath.txt"));
			
			readFilePath[0] = readPath.readLine();
			readFilePath[1] = readPath.readLine();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(readData[0] == 1){
			ssv.getDefaultFileFolderRB().setSelected(true);
			ssv.getUserDefinedRB().setSelected(false);
		}
		if(readData[0] == 2){
			ssv.getDefaultFileFolderRB().setSelected(false);
			ssv.getUserDefinedRB().setSelected(true);
		}
		if(readData[1] == 1){
			ssv.getOnLineRB().setSelected(true);
			ssv.getBusyRB().setSelected(false);
			ssv.getLeaveRB().setSelected(false);
			ssv.getInvisibleRB().setSelected(false);
		}
		if(readData[1] == 2){
			ssv.getOnLineRB().setSelected(false);
			ssv.getBusyRB().setSelected(true);
			ssv.getLeaveRB().setSelected(false);
			ssv.getInvisibleRB().setSelected(false);
		}
		if(readData[1] == 3){
			ssv.getOnLineRB().setSelected(false);
			ssv.getBusyRB().setSelected(false);
			ssv.getLeaveRB().setSelected(true);
			ssv.getInvisibleRB().setSelected(false);
		}
		if(readData[1] == 4){
			ssv.getOnLineRB().setSelected(false);
			ssv.getBusyRB().setSelected(false);
			ssv.getLeaveRB().setSelected(false);
			ssv.getInvisibleRB().setSelected(true);
		}
		if(readData[2] == 1){
			ssv.getEnterPressRB().setSelected(true);
			ssv.getEnterAndCtrlPressRB().setSelected(false);
		}
		if(readData[2] == 2){
			ssv.getEnterPressRB().setSelected(false);
			ssv.getEnterAndCtrlPressRB().setSelected(true);
			
		}
		if(readData[3] == 1){
			ssv.getDefaultFileFolderRB().setSelected(true);
			ssv.getUserDefinedRB().setSelected(false);
			ssv.getUserDefinedTF().setVisible(false);
			ssv.getBrowserB().setVisible(false);
		}
		if(readData[3] == 2){
			ssv.getDefaultFileFolderRB().setSelected(false);
			ssv.getUserDefinedRB().setSelected(true);
			ssv.getUserDefinedTF().setVisible(true);
			ssv.getBrowserB().setVisible(true);
			
		}
		
		ssv.getUserDefinedTF().setText(readFilePath[0]);
		ssv.getFileTransferFolder().setText(readFilePath[1]);
		
		Connection pwdConn = conn.getConnection(null);
		try {
			ps = pwdConn.prepareStatement("select isSetPwdQues from userInfor where userId = ?");
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()){
				if(rs.getInt("isSetPwdQues") == 1){
					ssv.getSetPwdQuesBtn().setEnabled(false);
				}
			}
			
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		
		//修改密码按钮点击前为不可见
		ssv.getFormerPwdLabel().setVisible(false);
		ssv.getFormerPwdTF().setVisible(false);
		ssv.getNewPwdFirstLabel().setVisible(false);
		ssv.getNewPwdFirstTF().setVisible(false);
		ssv.getNewPwdSecondLabel().setVisible(false);
		ssv.getNewPwdSecondTF().setVisible(false);
		
		//设置密码保护问题前为不可见
		ssv.getFirstQuesCom().setVisible(false);
		ssv.getFirstQuesTF().setVisible(false);
		ssv.getSecondQuesCom().setVisible(false);
		ssv.getSecondQuesTF().setVisible(false);
		ssv.getThirdQuesCom().setVisible(false);
		ssv.getThirdQuesTF().setVisible(false);
		ssv.getConfirmQuesBtn().setVisible(false);
		ssv.getConfirmPwdBtn().setVisible(false);
		
		//取消按钮
		ssv.getCancelBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ssv.dispose();
				
			}
		});
		
		//按钮 打开个人文件夹 
		ssv.getChatFileSaveBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getDefaultFileFolderRB().isSelected()){
					JFileChooser fDialog = new JFileChooser("D:/");
					fDialog.setDialogTitle("个人文件夹");
					int returnVal = fDialog.showOpenDialog(null);
				}
				if(ssv.getUserDefinedRB().isSelected()){
					String filePath = ssv.getUserDefinedTF().getText();
					JFileChooser fDialog = new JFileChooser(filePath);
					fDialog.setDialogTitle("个人文件夹");
					int returnVal = fDialog.showOpenDialog(null);
				}
				
				
				
			}
		});
		
		//修改密码按钮
		ssv.getChangePwdBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ssv.getFormerPwdLabel().setVisible(true);
				ssv.getFormerPwdTF().setVisible(true);
				ssv.getNewPwdFirstLabel().setVisible(true);
				ssv.getNewPwdFirstTF().setVisible(true);
				ssv.getNewPwdSecondLabel().setVisible(true);
				ssv.getNewPwdSecondTF().setVisible(true);
				ssv.getConfirmPwdBtn().setVisible(true);
			}
		});
		
		//确认密码修改按钮
		ssv.getConfirmPwdBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				String formerPwd = ssv.getFormerPwdTF().getText();
				String firstPwd = ssv.getNewPwdFirstTF().getText();
				String secondPwd = ssv.getNewPwdSecondTF().getText();
				
				if (!firstPwd.equals("") && !secondPwd.equals("")) {
					Connection connection = conn.getConnection(null);
					try {
						pstmt = connection.prepareStatement("select password "
								+ "from userInfor " + "where userId = ?");
						pstmt.setInt(1, id);
						ResultSet result1 = pstmt.executeQuery();

						while (result1.next()) {
							String oldPwd = result1.getString("password");
							if (!oldPwd.equals(formerPwd)) {
								JOptionPane.showMessageDialog(ssv,
										"原密码输入错误，请重新输入", "错误",
										JOptionPane.YES_OPTION);
								ssv.getFormerPwdTF().setText("");
								ssv.getNewPwdFirstTF().setText("");
								ssv.getNewPwdSecondTF().setText("");
							} else if (!firstPwd.equals(secondPwd)) {

								JOptionPane.showMessageDialog(ssv,
										"您输入的新密码不一致，请确认输入", "错误",
										JOptionPane.OK_OPTION);
								ssv.getNewPwdFirstTF().setText("");
								ssv.getNewPwdSecondTF().setText("");
							} else {
								int res = JOptionPane.showConfirmDialog(ssv,
										"你的新密码是：" + firstPwd + "\n"
												+ "选择是提交，选择否重新设置", "修改密码成功",
										JOptionPane.YES_NO_OPTION,
										JOptionPane.INFORMATION_MESSAGE);
								if (res == 0) {
									//	Connection connection2 = conn.getConnection(null);

									pstmt = connection
											.prepareStatement("update userinfor set "
													+ "password = ? "
													+ "where userId = ?");
									pstmt.setString(1, firstPwd);
									pstmt.setInt(2, id);
									pstmt.executeUpdate();
									ssv.getFormerPwdLabel().setVisible(false);
									ssv.getFormerPwdTF().setVisible(false);
									ssv.getNewPwdFirstLabel().setVisible(false);
									ssv.getNewPwdFirstTF().setVisible(false);
									ssv.getNewPwdSecondLabel()
											.setVisible(false);
									ssv.getNewPwdSecondTF().setVisible(false);
									ssv.getConfirmPwdBtn().setVisible(false);
								}
								if (res == 1) {
									ssv.getFormerPwdTF().setEditable(false);
									ssv.getNewPwdFirstTF().setText("");
									ssv.getNewPwdSecondTF().setText("");
									ssv.getConfirmPwdBtn().setVisible(true);
								}

							}
						}
						pstmt.close();
						connection.close();
					} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}else{
					JOptionPane.showMessageDialog(ssv, "密码不能为空，请重新填写", "警告", JOptionPane.OK_OPTION);
				}
			}
		});
		
		
		//默认文件夹RB
		ssv.getDefaultFileFolderRB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getDefaultFileFolderRB().isSelected()){
					ssv.getUserDefinedTF().setVisible(false);
					ssv.getBrowserB().setVisible(false);
				}
				
			}
		});
		
		//自定义文件夹RB
		ssv.getUserDefinedRB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getUserDefinedRB().isSelected()){
					ssv.getUserDefinedTF().setVisible(true);
					ssv.getBrowserB().setVisible(true);
				}
				
			}
		});
		
		//浏览按钮
		ssv.getBrowserB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fDialog = new JFileChooser();
				fDialog.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				fDialog.setDialogTitle("请选择个人文件夹：");
				int returnVal = fDialog.showOpenDialog(null);
				if(JFileChooser.APPROVE_OPTION == returnVal){
					String filePath = String.valueOf(fDialog.getSelectedFile());
					String s = filePath.replace("\\", "/");
					ssv.getUserDefinedTF().setText(s);
					
				}
				
			}
		});
		
		//更改传输文件夹按钮
		ssv.getChangeFileFolderBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fDialog = new JFileChooser();
				fDialog.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				fDialog.setDialogTitle("请选择个人文件夹：");
				int returnVal = fDialog.showOpenDialog(null);
				if(JFileChooser.APPROVE_OPTION == returnVal){
					String filePath = String.valueOf(fDialog.getSelectedFile());
					String s = filePath.replace("\\", "/");
					ssv.getFileTransferFolder().setText(s);
					
				}
				
			}
		});
		
		//设置密码保护问题按钮
		ssv.getSetPwdQuesBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				ssv.getFirstQuesCom().setVisible(true);
				ssv.getFirstQuesTF().setVisible(true);
				ssv.getSecondQuesCom().setVisible(true);
				ssv.getSecondQuesTF().setVisible(true);
				ssv.getThirdQuesCom().setVisible(true);
				ssv.getThirdQuesTF().setVisible(true);
				ssv.getConfirmQuesBtn().setVisible(true);
				
			}
		});
		
		//密码保护问题设置确认按钮
		ssv.getConfirmQuesBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				Connection connection = conn.getConnection(null);
				int firsrNum = ssv.getFirstQuesCom().getSelectedIndex() + 1;
				int secondNum = ssv.getSecondQuesCom().getSelectedIndex() + 6;
				int thirdNum = ssv.getThirdQuesCom().getSelectedIndex() + 9;
				String ft = ssv.getFirstQuesTF().getText();
				String st = ssv.getSecondQuesTF().getText();
				String tt = ssv.getThirdQuesTF().getText();
				if(!ft.equals("") && !st.equals("") && !tt.equals("")){
					int bl;
					
					
					int res = JOptionPane.showConfirmDialog(ssv, "密码保护问题为：" + "\n"  
							+ ssv.getFirstQuesCom().getItemAt(ssv.getFirstQuesCom().getSelectedIndex()) 
							+" : " + ssv.getFirstQuesTF().getText() + "\n"
							+ ssv.getSecondQuesCom().getItemAt(ssv.getSecondQuesCom().getSelectedIndex())
							+ " : " + ssv.getSecondQuesTF().getText() + "\n"
							+ ssv.getThirdQuesCom().getItemAt(ssv.getThirdQuesCom().getSelectedIndex())
							+ " : " + ssv.getThirdQuesTF().getText() + "\n"
							+ "点击是设置成功，设置成功后不能更改请注意...." + "\n" + "点击否重新设置..."
							, "设置成功", JOptionPane.OK_OPTION);
					if(res == 0){
						try {
							pstmt = connection.prepareStatement("insert into answer(userId,questionNum,answer) values(?,?,?)");
							pstmt.setInt(1, id);
							pstmt.setInt(2, firsrNum);
							pstmt.setString(3, ssv.getFirstQuesTF().getText());
							pstmt.executeUpdate();
							
							pstmt.setInt(1, id);
							pstmt.setInt(2, secondNum);
							pstmt.setString(3, ssv.getSecondQuesTF().getText());
							pstmt.executeUpdate();
							
							pstmt.setInt(1, id);
							pstmt.setInt(2, thirdNum);
							pstmt.setString(3, ssv.getThirdQuesTF().getText());
							pstmt.executeUpdate();
							
							pstmt = connection.prepareStatement("update userInfor set isSetPwdQues = ? where userId = ?");
							pstmt.setInt(1, 1);
							pstmt.setInt(2, id);
							pstmt.executeUpdate();
							ssv.getFirstQuesCom().setVisible(false);
							ssv.getFirstQuesTF().setVisible(false);
							ssv.getSecondQuesCom().setVisible(false);
							ssv.getSecondQuesTF().setVisible(false);
							ssv.getThirdQuesCom().setVisible(false);
							ssv.getThirdQuesTF().setVisible(false);
							ssv.getConfirmQuesBtn().setVisible(false);
							ssv.getSetPwdQuesBtn().setEnabled(false);
							
							pstmt.close();
							connection.close();
						} catch (SQLException e1) {
							e1.printStackTrace();
							
						}
					}
					if(res == 1){
						
						ssv.getFirstQuesTF().setText("");
						ssv.getSecondQuesTF().setText("");
						ssv.getThirdQuesTF().setText("");
						ssv.getFirstQuesCom().setVisible(true);
						ssv.getFirstQuesTF().setVisible(true);
						ssv.getSecondQuesCom().setVisible(true);
						ssv.getSecondQuesTF().setVisible(true);
						ssv.getThirdQuesCom().setVisible(true);
						ssv.getThirdQuesTF().setVisible(true);
						ssv.getConfirmQuesBtn().setVisible(true);
					}
				}else{
					JOptionPane.showMessageDialog(ssv, "密码保护问题不能为空", "警告", JOptionPane.OK_OPTION);
				}
				
				
				
				
			}
		});
		
		//确定按钮
		ssv.getConfirmBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					writePath = new PrintWriter(str +  "/" + String.valueOf(id) + "FilePath.txt");
					writeSysSet = new FileOutputStream(str +  "/" + String.valueOf(id) + "SysSetFile.txt");
					if(ssv.getDefaultFileFolderRB().isSelected()){
						writeData[0] = 1;
					}
					if(ssv.getUserDefinedRB().isSelected()){
						writeData[0] = 2;
					}
					if(ssv.getOnLineRB().isSelected()){
						writeData[1] = 1;
					}
					if(ssv.getBusyRB().isSelected()){
						writeData[1] = 2;
					}
					if(ssv.getLeaveRB().isSelected()){
						writeData[1] = 3;
					}
					if(ssv.getInvisibleRB().isSelected()){
						writeData[1] = 4;
					}
					if(ssv.getEnterPressRB().isSelected()){
						writeData[2] = 1;
					}
					if(ssv.getEnterAndCtrlPressRB().isSelected()){
						writeData[2] = 2;
					}
					if(ssv.getDefaultFileFolderRB().isSelected()){
						writeData[3] = 1;
					}
					if(ssv.getUserDefinedRB().isSelected()){
						writeData[3] = 2;
					}
					
					for(int i = 0;i < 4;i++){
						writeSysSet.write(writeData[i]);
						
					}
					writeSysSet.flush();
					writeSysSet.close();
					
					if(ssv.getUserDefinedRB().isSelected()){
						writePath.println(ssv.getUserDefinedTF().getText());
					}else if(ssv.getDefaultFileFolderRB().isSelected()){
						writePath.println("D:/");
					}
				
					writePath.println(ssv.getFileTransferFolder().getText());
					writePath.flush();
					writePath.close();
					
					
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					//System.out.println("找不到" + str + "SysSetFile.txt");
				}
				
				ssv.dispose();
				
			}
		});
		
		//应用按钮
		ssv.getApplyBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				try {
					writeSysSet = new FileOutputStream(str +  "/" + String.valueOf(id) + "SysSetFile.txt");
					writePath = new PrintWriter(str +  "/" + String.valueOf(id) + "FilePath.txt");
					if(ssv.getDefaultFileFolderRB().isSelected()){
						writeData[0] = 1;
					}
					if(ssv.getUserDefinedRB().isSelected()){
						writeData[0] = 2;
					}
					if(ssv.getOnLineRB().isSelected()){
						writeData[1] = 1;
					}
					if(ssv.getBusyRB().isSelected()){
						writeData[1] = 2;
					}
					if(ssv.getLeaveRB().isSelected()){
						writeData[1] = 3;
					}
					if(ssv.getInvisibleRB().isSelected()){
						writeData[1] = 4;
					}
					if(ssv.getEnterPressRB().isSelected()){
						writeData[2] = 1;
					}
					if(ssv.getEnterAndCtrlPressRB().isSelected()){
						writeData[2] = 2;
					}
					if(ssv.getDefaultFileFolderRB().isSelected()){
						writeData[3] = 1;
					}
					if(ssv.getUserDefinedRB().isSelected()){
						writeData[3] = 2;
					}
					
					for(int i = 0;i < 4;i++){
						writeSysSet.write(writeData[i]);
						
					}
					writeSysSet.flush();
					writeSysSet.close();
					
					
				
					if(ssv.getUserDefinedRB().isSelected()){
						writePath.println(ssv.getUserDefinedTF().getText());
					}else if(ssv.getDefaultFileFolderRB().isSelected()){
						writePath.println("D:/");
					}
					writePath.println(ssv.getFileTransferFolder().getText());
					writePath.flush();
					writePath.close();
					
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
					//System.out.println("找不到" + str + "SysSetFile.txt");
				}
				
			}
		});
		
	}
	public static void main(String[] args) {
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		new SetSysInfo(11111);

	}

}
