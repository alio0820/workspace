package com.newworld.view;

import java.awt.BorderLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JCheckBox;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JTabbedPane;
import javax.swing.JTextField;
import javax.swing.UIManager;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;

import com.new_world.operation.addFriend.*; 
import com.newworld.common.Conn;
import com.newworld.view.*;;



///////////查找好友和查找群的界面by Akira
	public class SearchFriendView extends JFrame{
	private JTabbedPane searchPane=new JTabbedPane();
	 private JTabbedPane friendPane=new JTabbedPane(1);
	 private JTabbedPane groupPane=new JTabbedPane();
	 private JFrame jFrame=new JFrame("查找联系人");
	 private static int i=0 ;
	 private static int j=0 ;
	private static String userId;
	 private static String groupId;
	 private static String friendId;
	 //查看资料和添加好友图标
	private JLabel findf=new JLabel();
	private JLabel findg=new JLabel();
	private JLabel addLabel= new JLabel(new ImageIcon("image/addfriend.png"));
	private JLabel addLabelg=new JLabel(new ImageIcon("image/addfriend.png"));
	//JList 
	//各Panel的创建
	 private JPanel searchPanel=new ImagePanel("image/2.jpg");
	 private JPanel friendPanel=new ImagePanel("image/2.jpg");
	 private JPanel groupPanel=new ImagePanel("image/2.jpg");
	//button
	 private JTextField textSearchNum=new JTextField(); 
	 private JButton sfriendBtn=new JButton("查找");
	// private JButton sconFriendBtn=new JButton("查找吧");
	 private JButton sGroupBtn=new JButton("查找群");
	 private JTextField textSearchGrp=new JTextField(); 
	
	
	 private JLabel labelFind=new JLabel("你找到的好友：");
	 private JPanel infoPanel=new ImagePanel("image/info.jpg");
	 private JPanel addPanel=new ImagePanel("image/addfriend.jpg");
	//条件查找

	 private JLabel ageLabel =new JLabel("年龄:");//年龄label
	 private JLabel sexLabel =new JLabel("性别:");//性别label
	 private JLabel bloodTypeLabel = new JLabel("血 型:");//血型label
	private JLabel constellationLabel = new JLabel("星 座:");//星座label
	private JCheckBox OnStatus=new JCheckBox("在  线");
	private JComboBox ageCom=new JComboBox();
	private JComboBox constellationCom=new JComboBox();
	private JComboBox sexCom=new JComboBox();
	private JComboBox bloodTypCom=new JComboBox();
	
	PreparedStatement pstmt = null; 
	PreparedStatement pstmt2 = null; 
	PreparedStatement pstmtg = null; 
	PreparedStatement pstmtg2 = null; 
	Conn conn = new Conn();
	Connection connection=conn.getConnection(null);
	
	public SearchFriendView(int id) {
		this.userId = String.valueOf(id);
		ImageIcon image=new ImageIcon("image/jjjjjjj.png");
		jFrame.setIconImage(image.getImage());
		jFrame.setBounds(400, 400, 531, 343);
		jFrame.add(searchPanel);
			//插入标签
		searchPane.add("查找好友", friendPanel);
		searchPane.add("查找群组", groupPanel);
		jFrame.add(searchPane);
			
			/////////精确查找-----------
			//添加条件按钮和文本框
		friendPanel.setLayout(null);
		textSearchNum.setBounds(50, 40, 300, 30);
		textSearchNum.setText("请输入您要查找的账号");
		sfriendBtn.setBounds(350, 40, 90, 30);
		friendPanel.add(textSearchNum);
		friendPanel.add(sfriendBtn);
			
		groupPanel.setLayout(null);
		textSearchGrp.setBounds(50, 40, 300, 30);
		groupPanel.add(textSearchGrp);
		textSearchGrp.setText("请输入您要查找的群号");
		sGroupBtn.setBounds(350, 40, 90, 30);
		groupPanel.add(sGroupBtn);
		////////查找好友
		findf.setBounds(100, 100, 300, 50);
		friendPanel.add(findf);
		//查找群
		findg.setBounds(110, 100, 300, 50);
		groupPanel.add(findg);
		
		jFrame.setResizable(false);
			
 		//首先获得焦点	
	/*	jFrame.addWindowListener(new   WindowAdapter()   {   
	          public   void   windowActivated(WindowEvent   e)   {   
	                  textSearchNum.requestFocusInWindow();   
	          }   
	  });  */
		
		
		///查找按钮的监听器
			sfriendBtn.addActionListener(new ActionListener() {		
			
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub

				  		Connection connection = conn.getConnection(null);
				  		boolean flag=true;
				  		String searchNum = textSearchNum.getText();
				  		//获取文本框内容查找该资料
				  		 try {
				  			 jFrame.repaint();
				  			 //判断输入是数字还是字符
				  			 for(int i=0;i<searchNum.length();i++){
				  				 if(!Character.isDigit(searchNum.charAt(i))){
				  					 flag=false;
				  					 break;
				  				 }
				  				 
				  			 }
				  			if(flag){ 
							pstmt = connection.prepareStatement("select userId,nickname,birthday " +
							 		"from userinfor " +
							 		"where userId = ? "
									 );
							 pstmt.setString(1,  textSearchNum.getText());
					  		 ResultSet rs = pstmt.executeQuery();
					  		 System.out.println(textSearchNum.getText());
					  		 ///输出好友信息。
					  		 if(rs.next()){
					  			 findf.setText("账号："+rs.getString("userId")
					  					 +"	"
					  					 +"    昵称："+rs.getString("nickname")
					  					 +"	"
					  					 +"   生日:"+rs.getString("birthday"));
					  			   friendId=textSearchNum.getText();
					  			   System.out.println(friendId);
					  			
					  			 addLabel.setBounds(370, 110, 30, 30);
					  			 addLabel.setVisible(true);
					  			 friendPanel .add(addLabel);
					  			 rs.close();
					  		 }
					  		 else{
					  			 findf.setText("好可惜哦，您查找的账号不存在！");
					  			 addLabel.setVisible(false);
					  		}
					  		 
					  		 System.out.println(findf.getText());
				  			 }
				  			 if(flag == false){
				  				pstmt2 = connection.prepareStatement("select userId,nickname,birthday " +
								 		"from userinfor " +
								 		"where nickname= ? "
										 );
				  				 pstmt2.setString(1, textSearchNum.getText());
				  				 ResultSet rs2 = pstmt2.executeQuery();
				  				 if(rs2.next()){
						  			 findf.setText("账号："+rs2.getString("userId")
						  					 +"	"
						  					 +"    昵称："+rs2.getString("nickname")
						  					 +"	"
						  					 +"   生日:"+rs2.getString("birthday"));
						  			    friendId=rs2.getString("userId");
						  			  //System.out.println(friendId);
						  			
						  			 addLabel.setBounds(370, 110, 30, 30);
						  			 addLabel.setVisible(true);
						  			 friendPanel .add(addLabel);
						  			 pstmt2.close();
						  			 rs2.close();
						  			 
						  		 }
				  				 else{
				  					 findf.setText("好可惜哦，您查找的账号不存在！");
						  			 addLabel.setVisible(false);
				  				 }
				  			 }
					  		
					  			 
					  			 //查看资料的图标
						//	textSearchNum.setText("");
					      
						} catch (SQLException e2) {
							// TODO Auto-generated catch block
							e2.printStackTrace();
					}
				}
				
			});
			
			////// ------查找群按钮监听a
			sGroupBtn.addActionListener(new ActionListener() {		
				
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					//获取文本框内容查找该资料
					boolean flag=true;
					String searchGNum = textSearchGrp.getText();
					try {
						for(int i=0;i<searchGNum.length();i++){
			  				 if(!Character.isDigit(searchGNum.charAt(i))){
			  					 flag=false;
			  				 	 break;
			  				 }
			  			 }
						if(flag){
							jFrame.repaint();
							groupId=searchGNum;
							pstmtg = connection.prepareStatement("select groupId,groupName from groupinfo where groupId =?");
							pstmtg.setString(1, textSearchGrp.getText());
							ResultSet rs2 = pstmtg.executeQuery();
							if(rs2.next()){
								findg.setText("群号："+rs2.getString("groupId")
										+"	"
										+"    群名："+rs2.getString("groupName"));
								System.out.println(groupId);
								addLabelg.setBounds(370, 110, 30, 30);
								addLabelg.setVisible(true);
								groupPanel .add(addLabelg);
								pstmtg.close();
								rs2.close();
							}
						else{
							System.out.println("no group!");
							findg.setText("好可惜，您查找的账号不存在哦亲！");
							addLabelg.setVisible(false);						
							}
						}
						if(flag == false){
							jFrame.repaint();
							pstmtg2 = connection.prepareStatement("select groupId,groupName from groupinfo where groupName =?");
							pstmtg2.setString(1, textSearchGrp.getText());
							ResultSet rs2 = pstmtg2.executeQuery();
							if(rs2.next()){
								findg.setText("群号："+rs2.getString("groupId")
										+"	"
										+"    群名："+rs2.getString("groupName"));
								 groupId=rs2.getString("groupId");
								//System.out.println(groupId);
								
								addLabelg.setBounds(370, 110, 30, 30);
								addLabelg.setVisible(true);
								groupPanel .add(addLabelg);
								pstmtg2.close();
								rs2.close();
							}
							else{
								System.out.println("no group!");
								findg.setText("好可惜，您查找的账号不存在哦亲！");
								addLabelg.setVisible(false);				
						}
						//查看资料的图标
						System.out.println(findg.getText());
						}
					}
						//textSearchGrp.setText("");
						
					  catch (SQLException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
				}
				
			});
			//添加好友的图片被点击的监听器
			addLabel.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					// TODO Auto-generated method stub
				 	try {
						new AddFriend(friendId,userId);//获取userId
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				

				
				
			});
			////好友查找输入框
			textSearchNum.addMouseListener(new MouseAdapter() {
				public void mouseClicked(MouseEvent e) {
					if(i==0){
						textSearchNum.setText("");
						i++;
					}
					i=0;
				}	 
			});
			///查找群组
			textSearchGrp.addMouseListener(new MouseAdapter() {
				public void mouseClicked(MouseEvent e) {
					if(j==0){
						textSearchGrp.setText("");
						j++;
					}
					j=0;
				}	 
			});
			
			//查找到的好友显示，并调用AddGroup类
			addLabelg.addMouseListener(new MouseAdapter() {
						
				@Override
				public void mouseClicked(MouseEvent e) {
					// TODO Auto-generated method stub
				 	try {
						new AddGroup(groupId,userId);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}				
			});
			jFrame.setVisible(true);
			
			jFrame.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
			
	}
	
	
	
	
/*	public static void main(String[] args) throws Exception {
		UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		new SearchFriendView();
	}*/

	
	
	
	 public JTabbedPane getSearchPane() {
			return searchPane;
		}
		public void setSearchPane(JTabbedPane searchPane) {
			this.searchPane = searchPane;
		}
		public JTabbedPane getMidPane() {
			return friendPane;
		}
		public void setMidPane(JTabbedPane midPane) {
			this.friendPane = midPane;
		}
		public JTabbedPane getConditionPane() {
			return groupPane;
		}
		public void setConditionPane(JTabbedPane conditionPane) {
			this.groupPane = conditionPane;
		}
		public JFrame getjFrame() {
			return jFrame;
		}
		public void setjFrame(JFrame jFrame) {
			this.jFrame = jFrame;
		}
		public JPanel getSearchPanel() {
			return searchPanel;
		}
		public void setSearchPanel(JPanel searchPanel) {
			this.searchPanel = searchPanel;
		}
		public JPanel getFriendPanel() {
			return friendPanel;
		}
		public void setFriendPanel(JPanel friendPanel) {
			this.friendPanel = friendPanel;
		}
		public JPanel getGroupPanel() {
			return groupPanel;
		}
		public void setGroupPanel(JPanel groupPanel) {
			this.groupPanel = groupPanel;
		}
		public void setAccuFriendPanel(JPanel accuFriendPanel) {
			this.friendPanel = accuFriendPanel;
		}
		/*public JPanel getCondFriendPanel() {
			return condFriendPanel;
		}
		public void setCondFriendPanel(JPanel condFriendPanel) {
			this.condFriendPanel = condFriendPanel;
		}*/
		public JPanel getAccuGroupPanel() {
			return groupPanel;
		}
		public void setAccuGroupPanel(JPanel accuGroupPanel) {
			this.groupPanel = accuGroupPanel;
		}
		public JTextField getTextSearchNum() {
			return textSearchNum;
		}
		public void setTextSearchNum(JTextField textSearchNum) {
			this.textSearchNum = textSearchNum;
		}
		public JButton getSfriendBtn() {
			return sfriendBtn;
		}
		public void setSfriendBtn(JButton sfriendBtn) {
			this.sfriendBtn = sfriendBtn;
		}
	/*	public JButton getSconFriendBtn() {
			return sconFriendBtn;
		}
		public void setSconFriendBtn(JButton sconFriendBtn) {
			this.sconFriendBtn = sconFriendBtn;
		}*/
		public JButton getsGroupBtn() {
			return sGroupBtn;
		}
		public void setsGroupBtn(JButton sGroupBtn) {
			this.sGroupBtn = sGroupBtn;
		}
		public JTextField getTextSearchGrp() {
			return textSearchGrp;
		}
		public void setTextSearchGrp(JTextField textSearchGrp) {
			this.textSearchGrp = textSearchGrp;
		}
		public JLabel getLabelFind() {
			return labelFind;
		}
		public void setLabelFind(JLabel labelFind) {
			this.labelFind = labelFind;
		}
		public JPanel getInfoPanel() {
			return infoPanel;
		}
		public void setInfoPanel(JPanel infoPanel) {
			this.infoPanel = infoPanel;
		}
		public JPanel getAddPanel() {
			return addPanel;
		}
		public void setAddPanel(JPanel addPanel) {
			this.addPanel = addPanel;
		}
		public JLabel getAgeLabel() {
			return ageLabel;
		}
		public void setAgeLabel(JLabel ageLabel) {
			this.ageLabel = ageLabel;
		}
		public JLabel getSexLabel() {
			return sexLabel;
		}
		public void setSexLabel(JLabel sexLabel) {
			this.sexLabel = sexLabel;
		}
		public JLabel getBloodTypeLabel() {
			return bloodTypeLabel;
		}
		public void setBloodTypeLabel(JLabel bloodTypeLabel) {
			this.bloodTypeLabel = bloodTypeLabel;
		}
		public JLabel getConstellationLabel() {
			return constellationLabel;
		}
		public void setConstellationLabel(JLabel constellationLabel) {
			this.constellationLabel = constellationLabel;
		}
		public JCheckBox getOnStatus() {
			return OnStatus;
		}
		public void setOnStatus(JCheckBox onStatus) {
			OnStatus = onStatus;
		}
		public JComboBox getAgeCom() {
			return ageCom;
		}
		public void setAgeCom(JComboBox ageCom) {
			this.ageCom = ageCom;
		}
		public JComboBox getConstellationCom() {
			return constellationCom;
		}
		public void setConstellationCom(JComboBox constellationCom) {
			this.constellationCom = constellationCom;
		}
		public JComboBox getSexCom() {
			return sexCom;
		}
		public void setSexCom(JComboBox sexCom) {
			this.sexCom = sexCom;
		}
		public JComboBox getBloodTypCom() {
			return bloodTypCom;
		}
		public void setBloodTypCom(JComboBox bloodTypCom) {
			this.bloodTypCom = bloodTypCom;
		}
}
