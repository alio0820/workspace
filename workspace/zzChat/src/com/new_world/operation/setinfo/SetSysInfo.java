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
		//�趨ͼƬ�ı���·����
		File f2 = new File(str +  "/" + String.valueOf(id) + "FilePath.txt");
		if(!f2.exists()){
			try {
				f2.createNewFile();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		//�û��Զ�������ǰ���ɼ�
		ssv.getUserDefinedTF().setEditable(false);
		ssv.getFileTransferFolder().setEditable(false);
		ssv.getUserDefinedTF().setVisible(false);
		ssv.getBrowserB().setVisible(false);
		
		//��ʼ��ϵͳ������Ϣ
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
		
		
		//�޸����밴ť���ǰΪ���ɼ�
		ssv.getFormerPwdLabel().setVisible(false);
		ssv.getFormerPwdTF().setVisible(false);
		ssv.getNewPwdFirstLabel().setVisible(false);
		ssv.getNewPwdFirstTF().setVisible(false);
		ssv.getNewPwdSecondLabel().setVisible(false);
		ssv.getNewPwdSecondTF().setVisible(false);
		
		//�������뱣������ǰΪ���ɼ�
		ssv.getFirstQuesCom().setVisible(false);
		ssv.getFirstQuesTF().setVisible(false);
		ssv.getSecondQuesCom().setVisible(false);
		ssv.getSecondQuesTF().setVisible(false);
		ssv.getThirdQuesCom().setVisible(false);
		ssv.getThirdQuesTF().setVisible(false);
		ssv.getConfirmQuesBtn().setVisible(false);
		ssv.getConfirmPwdBtn().setVisible(false);
		
		//ȡ����ť
		ssv.getCancelBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				ssv.dispose();
				
			}
		});
		
		//��ť �򿪸����ļ��� 
		ssv.getChatFileSaveBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getDefaultFileFolderRB().isSelected()){
					JFileChooser fDialog = new JFileChooser("D:/");
					fDialog.setDialogTitle("�����ļ���");
					int returnVal = fDialog.showOpenDialog(null);
				}
				if(ssv.getUserDefinedRB().isSelected()){
					String filePath = ssv.getUserDefinedTF().getText();
					JFileChooser fDialog = new JFileChooser(filePath);
					fDialog.setDialogTitle("�����ļ���");
					int returnVal = fDialog.showOpenDialog(null);
				}
				
				
				
			}
		});
		
		//�޸����밴ť
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
		
		//ȷ�������޸İ�ť
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
										"ԭ���������������������", "����",
										JOptionPane.YES_OPTION);
								ssv.getFormerPwdTF().setText("");
								ssv.getNewPwdFirstTF().setText("");
								ssv.getNewPwdSecondTF().setText("");
							} else if (!firstPwd.equals(secondPwd)) {

								JOptionPane.showMessageDialog(ssv,
										"������������벻һ�£���ȷ������", "����",
										JOptionPane.OK_OPTION);
								ssv.getNewPwdFirstTF().setText("");
								ssv.getNewPwdSecondTF().setText("");
							} else {
								int res = JOptionPane.showConfirmDialog(ssv,
										"����������ǣ�" + firstPwd + "\n"
												+ "ѡ�����ύ��ѡ�����������", "�޸�����ɹ�",
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
					JOptionPane.showMessageDialog(ssv, "���벻��Ϊ�գ���������д", "����", JOptionPane.OK_OPTION);
				}
			}
		});
		
		
		//Ĭ���ļ���RB
		ssv.getDefaultFileFolderRB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getDefaultFileFolderRB().isSelected()){
					ssv.getUserDefinedTF().setVisible(false);
					ssv.getBrowserB().setVisible(false);
				}
				
			}
		});
		
		//�Զ����ļ���RB
		ssv.getUserDefinedRB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				if(ssv.getUserDefinedRB().isSelected()){
					ssv.getUserDefinedTF().setVisible(true);
					ssv.getBrowserB().setVisible(true);
				}
				
			}
		});
		
		//�����ť
		ssv.getBrowserB().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fDialog = new JFileChooser();
				fDialog.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				fDialog.setDialogTitle("��ѡ������ļ��У�");
				int returnVal = fDialog.showOpenDialog(null);
				if(JFileChooser.APPROVE_OPTION == returnVal){
					String filePath = String.valueOf(fDialog.getSelectedFile());
					String s = filePath.replace("\\", "/");
					ssv.getUserDefinedTF().setText(s);
					
				}
				
			}
		});
		
		//���Ĵ����ļ��а�ť
		ssv.getChangeFileFolderBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fDialog = new JFileChooser();
				fDialog.setFileSelectionMode(JFileChooser.DIRECTORIES_ONLY);
				fDialog.setDialogTitle("��ѡ������ļ��У�");
				int returnVal = fDialog.showOpenDialog(null);
				if(JFileChooser.APPROVE_OPTION == returnVal){
					String filePath = String.valueOf(fDialog.getSelectedFile());
					String s = filePath.replace("\\", "/");
					ssv.getFileTransferFolder().setText(s);
					
				}
				
			}
		});
		
		//�������뱣�����ⰴť
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
		
		//���뱣����������ȷ�ϰ�ť
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
					
					
					int res = JOptionPane.showConfirmDialog(ssv, "���뱣������Ϊ��" + "\n"  
							+ ssv.getFirstQuesCom().getItemAt(ssv.getFirstQuesCom().getSelectedIndex()) 
							+" : " + ssv.getFirstQuesTF().getText() + "\n"
							+ ssv.getSecondQuesCom().getItemAt(ssv.getSecondQuesCom().getSelectedIndex())
							+ " : " + ssv.getSecondQuesTF().getText() + "\n"
							+ ssv.getThirdQuesCom().getItemAt(ssv.getThirdQuesCom().getSelectedIndex())
							+ " : " + ssv.getThirdQuesTF().getText() + "\n"
							+ "��������óɹ������óɹ����ܸ�����ע��...." + "\n" + "�������������..."
							, "���óɹ�", JOptionPane.OK_OPTION);
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
					JOptionPane.showMessageDialog(ssv, "���뱣�����ⲻ��Ϊ��", "����", JOptionPane.OK_OPTION);
				}
				
				
				
				
			}
		});
		
		//ȷ����ť
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
					//System.out.println("�Ҳ���" + str + "SysSetFile.txt");
				}
				
				ssv.dispose();
				
			}
		});
		
		//Ӧ�ð�ť
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
					//System.out.println("�Ҳ���" + str + "SysSetFile.txt");
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
