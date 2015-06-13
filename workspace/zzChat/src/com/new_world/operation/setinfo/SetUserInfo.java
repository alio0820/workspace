package com.new_world.operation.setinfo;
import java.awt.Font;
import java.awt.FontMetrics;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Rectangle;
import java.awt.Shape;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.image.ImageObserver;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.AttributedCharacterIterator;
import java.util.Date;

import javax.swing.ImageIcon;
import javax.swing.JFileChooser;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.UIManager;

import com.new_world.operation.mainframe.MainDisplay;
import com.newworld.common.Conn;
import com.newworld.common.PCMessage;
import com.newworld.view.UserInfoView;

//-------------------Design by littlePP @20120721-----------------------

public class SetUserInfo {

	
	UserInfoView uif;
	private JPanel userInfoPic;
	private JPanel userInfoPicAfter;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt=null;
	
	private static  int id = 11111;
	private JPanel userInfoPicBefore;
	public SetUserInfo(int useid,final ObjectOutputStream oos) throws Exception{
		
		
		this.id = useid;
		
		uif = new UserInfoView();
		
	
		
		
		//初始化已有的用户信息
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select " +
				"nickName," +
				"userID, " +
				"mailbox," +
				"constellation," +
				"position, " +               //4
				"occupation, " +             //5
				"degree, " +                 //6
				"singature, " +              //7
				"realName, " +               //8
				"englishname, " +            //9
				"age, " +                    //10
				"chineseZ, " +               //11
				"bloodType, " +              //12
				"hometown, " +               //13
				"location, " +               //14
				"address, " +                //15
				"postcode," +
				"teleNum," +
				"mobiNum," +
				"personalExp," +
				"school," +
				"birthday," +
				"headPortrait " +
				"from userinfor " + 
				"where userId = ? " );
		pstmt.setInt(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			uif.getNickNameTF().setText(rs.getString("nickName"));
			uif.getUserAccountNum().setText(rs.getString("userId"));
			uif.getMailBoxTF().setText(rs.getString("mailbox"));
			uif.getConstellationCom().setSelectedItem(rs.getString("constellation"));
			uif.getPositionTF().setText(rs.getString("position"));
			uif.getOccupationCom().setSelectedItem(rs.getString("occupation"));
			uif.getEduCom().setSelectedItem(rs.getString("degree"));
			uif.getUserSignTA().setText(rs.getString("singature"));
			uif.getRealNameTF().setText(rs.getString("realName"));
			uif.getEngNameTF().setText(rs.getString("englishName"));
			uif.getAgeTF().setText(rs.getString("age"));
			uif.getAnimalCom().setSelectedItem(rs.getString("chineseZ"));
			uif.getBloodTypCom().setSelectedItem(rs.getString("bloodType"));
			uif.getHomeTownTF().setText(rs.getString("hometown"));
			uif.getLocationTF().setText(rs.getString("location"));
			uif.getAddressTF().setText(rs.getString("address"));
			uif.getPostcodeTF().setText(String.valueOf(rs.getInt("postcode")));
			uif.getTeleNumTF().setText(rs.getString("teleNum"));
			uif.getMobiNumTF().setText(rs.getString("mobiNum"));
			uif.getPersonalStateTA().setText(rs.getString("personalExp"));
			uif.getSchoolTF().setText(rs.getString("school"));
			uif.getBirthdayTF().setText(rs.getString("birthday"));
			String a = rs.getString("headPortrait");
			System.out.println(a);
			if (a==null||a.equals("")) {
				userInfoPicAfter = new ImagePanel("image/pig.jpg");
				System.out.println(5555555);				
				
			}else{
				userInfoPicAfter = new ImagePanel(a);
				System.out.println(111111);
				
			}
			uif.getUserInfoBackground().remove(uif.getUserPic());
			userInfoPicAfter.setBounds(15, 15, 100, 100);
			uif.getUserInfoBackground().add(userInfoPicAfter);
			uif.repaint();
		}
		rs.close();
		pstmt.close();
		connection.close();
		
		
		//userInfoPic = new ImagePanel("image/turtle.jpg");
		//uif.setUserPic(userInfoPic);
		//uif.getUserPic() = new ImagePanel("image/pig.jpg");
		
		
		
		
		//确定按钮
		uif.getConfirmBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Connection connection = conn.getConnection(null);
				
				boolean flag1 = true;
				boolean flag2 = true;
				String age = uif.getAgeTF().getText();
				String post = uif.getPostcodeTF().getText();
				if(!age.equals("")){
					for(int i = 0;i < age.length();i++){
						if(!Character.isDigit(age.charAt(i)) ){
							flag1 = false;
							break;
						}
					}
				}
				else{
					flag1 = false;
				}
				if (!post.equals("")) {
					for (int i = 0; i < post.length(); i++) {
						if (!Character.isDigit(post.charAt(i))) {
							flag2 = false;
							break;
						}
					}
				}else{
					flag2 = false;
				}
				if(flag1 == false){
					uif.getAgeTF().setText("");
					JOptionPane.showMessageDialog(uif, "年龄必须为数字且不能为空", "警告", JOptionPane.YES_OPTION);
				}else if(flag2 == false){
					uif.getPostcodeTF().setText("");
					JOptionPane.showMessageDialog(uif, "邮编必须为数字且不能为空", "警告", JOptionPane.YES_OPTION);
				}else{
					int bl;
					try {
						pstmt = connection.prepareStatement("update userinfor set  " +
								"nickName = ?," +               
								"mailbox = ?," +                
								"constellation = ?," +          
								"position = ?," +               
								"occupation = ?," +             
								"degree = ?," +                 
								"singature = ?," +              
								"realName = ?," +               //8
								"englishname = ?," +            //9
								"age = ?," +                    //10
								"chineseZ = ?," +               //11
								"bloodType = ?," +              //12
								"hometown = ?," +               //13
								"location = ?," +               //14
								"address = ?," +                //15
								"postcode = ?," +                //16
								"teleNum = ?," +
								"mobiNum = ? ," +
								"personalExp = ?," +
								"school = ?," +
								"birthday = ? " +              
								"where userId = ?");             
						pstmt.setString(1, uif.getNickNameTF().getText());
						pstmt.setString(2, uif.getMailBoxTF().getText());
						pstmt.setString(3, String.valueOf(uif.getConstellationCom().getItemAt(uif.getConstellationCom().getSelectedIndex())));
						pstmt.setString(4, uif.getPositionTF().getText());
						pstmt.setString(5, String.valueOf(uif.getOccupationCom().getItemAt(uif.getOccupationCom().getSelectedIndex())));
						pstmt.setString(6, String.valueOf(uif.getEduCom().getItemAt(uif.getEduCom().getSelectedIndex())));
						pstmt.setString(7, uif.getUserSignTA().getText());
						pstmt.setString(8, uif.getRealNameTF().getText());
						pstmt.setString(9, uif.getEngNameTF().getText());
						pstmt.setInt(10, Integer.parseInt(uif.getAgeTF().getText()));
						pstmt.setString(11, String.valueOf(uif.getAnimalCom().getItemAt(uif.getAnimalCom().getSelectedIndex())));
						pstmt.setString(12, String.valueOf(uif.getBloodTypCom().getItemAt(uif.getBloodTypCom().getSelectedIndex())));
						pstmt.setString(13, uif.getHomeTownTF().getText());
						pstmt.setString(14, uif.getLocationTF().getText());
						pstmt.setString(15, uif.getAddressTF().getText());
						pstmt.setInt(16, Integer.parseInt(uif.getPostcodeTF().getText()));

						pstmt.setString(17, uif.getTeleNumTF().getText());
						pstmt.setString(18, uif.getMobiNumTF().getText());
						pstmt.setString(19, uif.getPersonalStateTA().getText());
						pstmt.setString(20, uif.getSchoolTF().getText());
						pstmt.setString(21, uif.getBirthdayTF().getText());
						pstmt.setInt(22, id);				
						bl = pstmt.executeUpdate();
						if(bl>0)
							System.out.println("提交成功");
						else
							System.out.println("提交失败...");
						pstmt.close();
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
						System.out.println("应用按钮提交后出现更新问题...");
					}	
					//发送状态改变信息给服务器
					PCMessage message = new PCMessage();
					message.setSender(id);
					message.setSendTime(new Date());
					message.setContent("");
					message.setStatus(2);
					try {
						oos.writeObject(message);
						System.out.println("hahahayingyong");
					} catch (Exception e1) {
						System.out.println("发送身份消息失败...");
					}
					uif.dispose();
				}
				
			}
		});
		
		//系统设置
		uif.getSysSetBtn().addMouseListener(new MouseAdapter() {
			@Override
			public void mousePressed(MouseEvent e) {
				new SetSysInfo(id);
				
			}
		});
		
		//取消按钮
		uif.getCancelBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				uif.dispose();
				
			}
		});
		
		//应用按钮
		uif.getApplyBtn().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e){
				Connection connection = conn.getConnection(null);
				boolean flag1 = true;
				boolean flag2 = true;
				String age = uif.getAgeTF().getText();
				String post = uif.getPostcodeTF().getText();
				if(!age.equals("")){
					for(int i = 0;i < age.length();i++){
						if(!Character.isDigit(age.charAt(i)) ){
							flag1 = false;
							break;
						}
					}
				}
				else{
					flag1 = false;
				}
				if (!post.equals("")) {
					for (int i = 0; i < post.length(); i++) {
						if (!Character.isDigit(post.charAt(i))) {
							flag2 = false;
							break;
						}
					}
				}else{
					flag2 = false;
				}
				if(flag1 == false){
					uif.getAgeTF().setText("");
					JOptionPane.showMessageDialog(uif, "年龄必须为数字且不能为空", "警告", JOptionPane.YES_OPTION);
				}else if(flag2 == false){
					uif.getPostcodeTF().setText("");
					JOptionPane.showMessageDialog(uif, "邮编必须为数字且不能为空", "警告", JOptionPane.YES_OPTION);
				}else{
					int bl;
					try {
						pstmt = connection.prepareStatement("update userinfor set  " +
								"nickName = ?," +               
								"mailbox = ?," +                
								"constellation = ?," +          
								"position = ?," +               
								"occupation = ?," +             
								"degree = ?," +                 
								"singature = ?," +              
								"realName = ?," +               //8
								"englishname = ?," +            //9
								"age = ?," +                    //10
								"chineseZ = ?," +               //11
								"bloodType = ?," +              //12
								"hometown = ?," +               //13
								"location = ?," +               //14
								"address = ?," +                //15
								"postcode = ?," +                //16
								"teleNum = ?," +
								"mobiNum = ? ," +
								"personalExp = ?," +
								"school = ?," +
								"birthday = ? " +              
								"where userId = ?");             
						pstmt.setString(1, uif.getNickNameTF().getText());
						pstmt.setString(2, uif.getMailBoxTF().getText());
						pstmt.setString(3, String.valueOf(uif.getConstellationCom().getItemAt(uif.getConstellationCom().getSelectedIndex())));
						pstmt.setString(4, uif.getPositionTF().getText());
						pstmt.setString(5, String.valueOf(uif.getOccupationCom().getItemAt(uif.getOccupationCom().getSelectedIndex())));
						pstmt.setString(6, String.valueOf(uif.getEduCom().getItemAt(uif.getEduCom().getSelectedIndex())));
						pstmt.setString(7, uif.getUserSignTA().getText());
						pstmt.setString(8, uif.getRealNameTF().getText());
						pstmt.setString(9, uif.getEngNameTF().getText());
						pstmt.setInt(10, Integer.parseInt(uif.getAgeTF().getText()));
						pstmt.setString(11, String.valueOf(uif.getAnimalCom().getItemAt(uif.getAnimalCom().getSelectedIndex())));
						pstmt.setString(12, String.valueOf(uif.getBloodTypCom().getItemAt(uif.getBloodTypCom().getSelectedIndex())));
						pstmt.setString(13, uif.getHomeTownTF().getText());
						pstmt.setString(14, uif.getLocationTF().getText());
						pstmt.setString(15, uif.getAddressTF().getText());
						pstmt.setInt(16, Integer.parseInt(uif.getPostcodeTF().getText()));

						pstmt.setString(17, uif.getTeleNumTF().getText());
						pstmt.setString(18, uif.getMobiNumTF().getText());
						pstmt.setString(19, uif.getPersonalStateTA().getText());
						pstmt.setString(20, uif.getSchoolTF().getText());
						pstmt.setString(21, uif.getBirthdayTF().getText());
						pstmt.setInt(22, id);				
						bl = pstmt.executeUpdate();
						if(bl>0)
							System.out.println("提交成功");
						else
							System.out.println("提交失败...");
						pstmt.close();
						connection.close();
					} catch (SQLException e1) {
						e1.printStackTrace();
						System.out.println("应用按钮提交后出现更新问题...");
					}	
					//发送状态改变信息给服务器
					PCMessage message = new PCMessage();
					message.setSender(id);
					message.setSendTime(new Date());
					message.setContent("");
					message.setStatus(2);
					try {
						oos.writeObject(message);
						System.out.println("hahahayingyong");
					} catch (Exception e1) {
						System.out.println("发送身份消息失败...");
					}
				}
								
				try {
					MainDisplay.user= MainDisplay.getUserInfo(MainDisplay.id);
				} catch (Exception e1) {					
				}
				MainDisplay.userInfoMessage();
			}
			
		});
		
	
		userInfoPicBefore = userInfoPicAfter;
		//更改头像按钮
		uif.getChangeUserPic().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				JFileChooser fDialog = new JFileChooser("image_headPortrait/");
				fDialog.setDialogTitle("请选择头像文件：");
				int isChoose = fDialog.showOpenDialog(null);
				if(isChoose == 0){
					String fileName = fDialog.getSelectedFile().getName();
					String filePath = "image/" + fileName;
					userInfoPic = new ImagePanel(filePath);
					userInfoPic.setBounds(15, 15, 100, 100);
					uif.getUserInfoBackground().remove(userInfoPicBefore);
					uif.getUserInfoBackground().add(userInfoPic);
					userInfoPicBefore = userInfoPic;
					uif.repaint();
					
					Connection connection = conn.getConnection(null);
					
					try {
						pstmt = connection.prepareStatement("update userInfor set " +
								"headPortrait = ?  " +
								"where userId = ?");
						pstmt.setString(1,filePath);		
						pstmt.setInt(2, id);
						pstmt.executeUpdate();
					} catch (SQLException e1) {
							// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				
				
				
					
			}
		});
		
	}
	
	public static void main(String[] args) throws Exception{
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		//new SetUserInfo(12345,new ObjectOutputStream(new FileOutputStream(file)));

	}

}
