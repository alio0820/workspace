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



///////////���Һ��ѺͲ���Ⱥ�Ľ���by Akira
	public class SearchFriendView extends JFrame{
	private JTabbedPane searchPane=new JTabbedPane();
	 private JTabbedPane friendPane=new JTabbedPane(1);
	 private JTabbedPane groupPane=new JTabbedPane();
	 private JFrame jFrame=new JFrame("������ϵ��");
	 private static int i=0 ;
	 private static int j=0 ;
	private static String userId;
	 private static String groupId;
	 private static String friendId;
	 //�鿴���Ϻ���Ӻ���ͼ��
	private JLabel findf=new JLabel();
	private JLabel findg=new JLabel();
	private JLabel addLabel= new JLabel(new ImageIcon("image/addfriend.png"));
	private JLabel addLabelg=new JLabel(new ImageIcon("image/addfriend.png"));
	//JList 
	//��Panel�Ĵ���
	 private JPanel searchPanel=new ImagePanel("image/2.jpg");
	 private JPanel friendPanel=new ImagePanel("image/2.jpg");
	 private JPanel groupPanel=new ImagePanel("image/2.jpg");
	//button
	 private JTextField textSearchNum=new JTextField(); 
	 private JButton sfriendBtn=new JButton("����");
	// private JButton sconFriendBtn=new JButton("���Ұ�");
	 private JButton sGroupBtn=new JButton("����Ⱥ");
	 private JTextField textSearchGrp=new JTextField(); 
	
	
	 private JLabel labelFind=new JLabel("���ҵ��ĺ��ѣ�");
	 private JPanel infoPanel=new ImagePanel("image/info.jpg");
	 private JPanel addPanel=new ImagePanel("image/addfriend.jpg");
	//��������

	 private JLabel ageLabel =new JLabel("����:");//����label
	 private JLabel sexLabel =new JLabel("�Ա�:");//�Ա�label
	 private JLabel bloodTypeLabel = new JLabel("Ѫ ��:");//Ѫ��label
	private JLabel constellationLabel = new JLabel("�� ��:");//����label
	private JCheckBox OnStatus=new JCheckBox("��  ��");
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
			//�����ǩ
		searchPane.add("���Һ���", friendPanel);
		searchPane.add("����Ⱥ��", groupPanel);
		jFrame.add(searchPane);
			
			/////////��ȷ����-----------
			//���������ť���ı���
		friendPanel.setLayout(null);
		textSearchNum.setBounds(50, 40, 300, 30);
		textSearchNum.setText("��������Ҫ���ҵ��˺�");
		sfriendBtn.setBounds(350, 40, 90, 30);
		friendPanel.add(textSearchNum);
		friendPanel.add(sfriendBtn);
			
		groupPanel.setLayout(null);
		textSearchGrp.setBounds(50, 40, 300, 30);
		groupPanel.add(textSearchGrp);
		textSearchGrp.setText("��������Ҫ���ҵ�Ⱥ��");
		sGroupBtn.setBounds(350, 40, 90, 30);
		groupPanel.add(sGroupBtn);
		////////���Һ���
		findf.setBounds(100, 100, 300, 50);
		friendPanel.add(findf);
		//����Ⱥ
		findg.setBounds(110, 100, 300, 50);
		groupPanel.add(findg);
		
		jFrame.setResizable(false);
			
 		//���Ȼ�ý���	
	/*	jFrame.addWindowListener(new   WindowAdapter()   {   
	          public   void   windowActivated(WindowEvent   e)   {   
	                  textSearchNum.requestFocusInWindow();   
	          }   
	  });  */
		
		
		///���Ұ�ť�ļ�����
			sfriendBtn.addActionListener(new ActionListener() {		
			
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub

				  		Connection connection = conn.getConnection(null);
				  		boolean flag=true;
				  		String searchNum = textSearchNum.getText();
				  		//��ȡ�ı������ݲ��Ҹ�����
				  		 try {
				  			 jFrame.repaint();
				  			 //�ж����������ֻ����ַ�
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
					  		 ///���������Ϣ��
					  		 if(rs.next()){
					  			 findf.setText("�˺ţ�"+rs.getString("userId")
					  					 +"	"
					  					 +"    �ǳƣ�"+rs.getString("nickname")
					  					 +"	"
					  					 +"   ����:"+rs.getString("birthday"));
					  			   friendId=textSearchNum.getText();
					  			   System.out.println(friendId);
					  			
					  			 addLabel.setBounds(370, 110, 30, 30);
					  			 addLabel.setVisible(true);
					  			 friendPanel .add(addLabel);
					  			 rs.close();
					  		 }
					  		 else{
					  			 findf.setText("�ÿ�ϧŶ�������ҵ��˺Ų����ڣ�");
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
						  			 findf.setText("�˺ţ�"+rs2.getString("userId")
						  					 +"	"
						  					 +"    �ǳƣ�"+rs2.getString("nickname")
						  					 +"	"
						  					 +"   ����:"+rs2.getString("birthday"));
						  			    friendId=rs2.getString("userId");
						  			  //System.out.println(friendId);
						  			
						  			 addLabel.setBounds(370, 110, 30, 30);
						  			 addLabel.setVisible(true);
						  			 friendPanel .add(addLabel);
						  			 pstmt2.close();
						  			 rs2.close();
						  			 
						  		 }
				  				 else{
				  					 findf.setText("�ÿ�ϧŶ�������ҵ��˺Ų����ڣ�");
						  			 addLabel.setVisible(false);
				  				 }
				  			 }
					  		
					  			 
					  			 //�鿴���ϵ�ͼ��
						//	textSearchNum.setText("");
					      
						} catch (SQLException e2) {
							// TODO Auto-generated catch block
							e2.printStackTrace();
					}
				}
				
			});
			
			////// ------����Ⱥ��ť����a
			sGroupBtn.addActionListener(new ActionListener() {		
				
				@Override
				public void actionPerformed(ActionEvent e) {
					// TODO Auto-generated method stub
					//��ȡ�ı������ݲ��Ҹ�����
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
								findg.setText("Ⱥ�ţ�"+rs2.getString("groupId")
										+"	"
										+"    Ⱥ����"+rs2.getString("groupName"));
								System.out.println(groupId);
								addLabelg.setBounds(370, 110, 30, 30);
								addLabelg.setVisible(true);
								groupPanel .add(addLabelg);
								pstmtg.close();
								rs2.close();
							}
						else{
							System.out.println("no group!");
							findg.setText("�ÿ�ϧ�������ҵ��˺Ų�����Ŷ�ף�");
							addLabelg.setVisible(false);						
							}
						}
						if(flag == false){
							jFrame.repaint();
							pstmtg2 = connection.prepareStatement("select groupId,groupName from groupinfo where groupName =?");
							pstmtg2.setString(1, textSearchGrp.getText());
							ResultSet rs2 = pstmtg2.executeQuery();
							if(rs2.next()){
								findg.setText("Ⱥ�ţ�"+rs2.getString("groupId")
										+"	"
										+"    Ⱥ����"+rs2.getString("groupName"));
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
								findg.setText("�ÿ�ϧ�������ҵ��˺Ų�����Ŷ�ף�");
								addLabelg.setVisible(false);				
						}
						//�鿴���ϵ�ͼ��
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
			//��Ӻ��ѵ�ͼƬ������ļ�����
			addLabel.addMouseListener(new MouseAdapter() {
				@Override
				public void mouseClicked(MouseEvent e) {
					// TODO Auto-generated method stub
				 	try {
						new AddFriend(friendId,userId);//��ȡuserId
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
				

				
				
			});
			////���Ѳ��������
			textSearchNum.addMouseListener(new MouseAdapter() {
				public void mouseClicked(MouseEvent e) {
					if(i==0){
						textSearchNum.setText("");
						i++;
					}
					i=0;
				}	 
			});
			///����Ⱥ��
			textSearchGrp.addMouseListener(new MouseAdapter() {
				public void mouseClicked(MouseEvent e) {
					if(j==0){
						textSearchGrp.setText("");
						j++;
					}
					j=0;
				}	 
			});
			
			//���ҵ��ĺ�����ʾ��������AddGroup��
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
