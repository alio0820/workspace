package com.new_world.operation.mainframe;

import java.awt.Color;
import java.awt.Font;
import java.awt.Label;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Set;

import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JPopupMenu;
import javax.swing.UIManager;
import javax.swing.border.LineBorder;

import com.new_world.operation.delFriend.DeleteFriend;
import com.new_world.operation.delFriend.DeleteGroup;
import com.new_world.operation.groupchat.GroupChatClient;
import com.new_world.operation.privatechat.PCClient;
import com.new_world.operation.privatechat.PCClientThread;
import com.new_world.operation.setinfo.SetSysInfo;
import com.new_world.operation.setinfo.SetUserInfo;
import com.newworld.common.Conn;
import com.newworld.common.PCMessage;
import com.newworld.view.CreateGroupView;
import com.newworld.view.FriendListView;
import com.newworld.view.ImagePanel;
import com.newworld.view.MyWinAdapter;
import com.newworld.view.SearchFriendView;
/**author:翟灿东
 * Time:2012-07-21  15:41
 * Last change:
 * function: 聊天主面板的显示
 */
public class MainDisplay {
	public  static int id;
	public static String noteName;
	public static FriendListView flv;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	private Socket socket;
	public static JLabel[] friend;
	public static JLabel[] group;
	public static ObjectOutputStream oos;
	public static HashMap<Integer,Object> mapFriend = new HashMap<Integer, Object>();		//存储打开的私聊窗口
	public static HashMap<Integer,Object> mapGroup = new HashMap<Integer, Object>();		//存储打开的群窗口
	public static ArrayList<FriendList> fl;
	public static ArrayList<GroupList> gl;
	public static UserInfo user;
	private static JLabel friendSelected =null;
	private JPopupMenu popup = null;  
	private JPopupMenu popupg = null;
	public static  JPopupMenu popupLabel = null;
	public static  JPopupMenu popupgLabel = null;
	//private int q = 0;
	
	/**加载主面板
	 * 
	 */
	public MainDisplay(int userid) throws Exception{
		//加载主面板，并初始化主面板
		this.id = userid;
		flv= new FriendListView();
		
		//设置好友列表右键事件
		flv.getFriendListPanel().addMouseListener(new MouseAdapter() {   
	        public void mouseClicked(MouseEvent e) {   
	            if(e.getButton() == MouseEvent.BUTTON3) {   
	                getPopup().show(e.getComponent(),   
	                           e.getX(), e.getY());   
	            }
	        }   
	    });
		//设置群列表右键事件
		flv.getGroupListPanel().addMouseListener(new MouseAdapter(){			
			@Override
			public void mouseClicked(MouseEvent e) {
				if(e.getButton() == MouseEvent.BUTTON3){
					getPopupg().show(e.getComponent(),e.getX(),e.getY());
				}

				super.mouseClicked(e);
			}
		});
		
		//搜索按钮
		flv.getSearchFriendButton().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				new SearchFriendView(id); 
				
			}
		});

		
		//
		flv.getSetInfoButton().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				
				try {
					new SetUserInfo(id,oos);
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
		});
		
		//搜索好友直接聊天按钮按钮
		flv.getSearchButton().addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				Conn conn2=new Conn();
				Connection connection=conn2.getConnection(null);
				PreparedStatement pstmt2 = null;
				String friendSearch = flv.getSearchFriend().getText();
				try {
					pstmt2=connection.prepareStatement("select friendId,friendNoteName from friend where userId=? and friendId=? ");
					pstmt2.setInt(1, id);
					pstmt2.setString(2, friendSearch);
					ResultSet rs=pstmt2.executeQuery();
					if(rs.next()){
						new PCClient(id,Integer.parseInt(friendSearch), rs.getString("friendNoteName"),oos);
					}
					else{
				
						flv.getSearchFriend().setText("没有"+friendSearch+"这个好友!");
					}
					pstmt2.close();
					rs.close();
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
			
			
		});
		flv.getSearchFriend().addMouseListener(new MouseAdapter() {
			int j=0;
			public void mouseClicked(MouseEvent e) {
			if(j==0){
				flv.getSearchFriend().setText("");
				j++;
			}
			j=0;
		}});
				
			

		//建立连接
		try {
			socket = new Socket("localhost", 9999);
			System.out.println("连接服务器成功...");
			oos = new ObjectOutputStream(socket.getOutputStream());
			System.out.println("客户端创建输出流成功...");
		} catch (Exception e1) {
			System.out.println("连接服务器发生异常...");
		}
		
		//发送身份信息
		PCMessage message = new PCMessage();
		message.setSender(id);
		message.setSendTo(1);
		message.setSendTime(new Date());
		message.setContent("1");
		message.setStatus(2);
		try {
			oos.writeObject(message);
		} catch (Exception e1) {
			System.out.println("发送身份消息失败...");
		}
		
		//启动接受消息线程
		PCClientThread clientThread;
		try {
			clientThread = new PCClientThread(new ObjectInputStream(socket.getInputStream()));
			System.out.println("客户端创建输入流成功...");
			clientThread.start();
		} catch (Exception e1) {
			System.out.println("客户端创建输入流失败...");
		}
		
		//--------------------------------------------------------------------------------------------
		
		//加载个人信息并初始化面板
		user = getUserInfo(id);
		//用户头像
		if(user.getHeadPortrait()==null||user.getHeadPortrait().equals("")){
			flv.setUserPic(new ImagePanel("image/pig.jpg"));
		}
		else{
			flv.setUserPic(new ImagePanel(user.getHeadPortrait()));
		}
		userInfoMessage();				
			
		//好友状态改变
		flv.getUserStatus().addItemListener(new ItemListener() {
			public void itemStateChanged(ItemEvent e) {
				//发送状态改变信息给服务器
				PCMessage message = new PCMessage();
				message.setSender(id);
				message.setSendTime(new Date());
				message.setStatus(2);
				try {
					oos.writeObject(message);
					Connection connection = conn.getConnection(null);
					pstmt = connection.prepareStatement("update userinfor set status=? where userId=? ");
					pstmt.setInt(1, flv.getUserStatus().getSelectedIndex()+1);
					pstmt.setInt(2, id);
					int rs=pstmt.executeUpdate();
					pstmt.close();
					connection.close();
				} catch (Exception e1) {
					System.out.println("发送身份消息失败...");
				}	
				
			}
		});	
		//初始化群和好友列表
		groupAndFriendInfo();
		
		flv.addWindowListener(new MyWinAdapter(oos,id));
	}
	
	/**获取登录ID的信息
	 * 
	 */
	public static UserInfo getUserInfo(int id) throws Exception{
		Conn conn1 = Conn.getConnInstance();
		PreparedStatement pstmt1 = null;
		UserInfo userInfo= new UserInfo();
		Connection connection = conn1.getConnection(null);
		pstmt1 = connection.prepareStatement("select userId,nickName,singature,headPortrait,status from userinfor where userId=? ");
		pstmt1.setInt(1, id);
		ResultSet  rs=pstmt1.executeQuery();
		if(rs.next()){
			userInfo.setUserId(rs.getInt("userId"));
			userInfo.setNickName(rs.getString("nickName"));
			userInfo.setSingature(rs.getString("singature"));
			userInfo.setHeadPortrait(rs.getString("headPortrait"));
			userInfo.setStatus(rs.getInt("status"));
		}
		rs.close();
		pstmt1.close();
		connection.close();
		return userInfo;
	}
	
	/**获取好友列表
	 * 
	 */
	public static ArrayList<FriendList> getFriendList(int id) throws Exception{
		ArrayList<FriendList> fl = new ArrayList<FriendList>();
		Conn conn = Conn.getConnInstance();
		PreparedStatement pstmt = null;
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select friendId,friendNoteName,groupingName,headPortrait,singature,status,realName,birthday,mailbox,mobinum from  friend,userinfor where friend.friendId=userinfor.userId and friend.userId=? ");
		pstmt.setInt(1, id);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){
			FriendList friendlist = new FriendList();
			friendlist.setFriendId(rs.getInt("friendId"));
			friendlist.setFriendNoteName(rs.getString("friendNoteName"));
			friendlist.setGroupingName(rs.getString("groupingName"));
			friendlist.setHeadPortrait(rs.getString("headPortrait"));
			friendlist.setSingature(rs.getString("singature"));
			friendlist.setStatus(rs.getInt("status"));
			friendlist.setBirthday(rs.getString("birthday"));
			friendlist.setMailbox(rs.getString("mailbox"));
			friendlist.setMobinum(rs.getString("mobinum"));
			friendlist.setRealName(rs.getString("realName"));
			fl.add(friendlist);
		}
		rs.close();
		pstmt.close();
		connection.close();
		return fl;
	}
	/**获取群列表
	 * 
	 */
	public static ArrayList<GroupList> getGroupList(int id)throws Exception{
		ArrayList<GroupList> gl = new ArrayList<GroupList>();
		Conn conn = Conn.getConnInstance();
		PreparedStatement pstmt = null;
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select groupinfo.groupId,groupName,groupContent from groupinfo,groupuser where groupinfo.groupId=groupuser.groupId and groupuser.userId=? ");
		pstmt.setInt(1, id);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){
			GroupList grouplist = new GroupList();
			grouplist.setGroupId(rs.getInt("groupId"));
			grouplist.setGroupName(rs.getString("groupName"));
			grouplist.setGroupContent(rs.getString("groupContent"));
			gl.add(grouplist);
		}
		rs.close();
		pstmt.close();
		connection.close();
		return gl;
	}
	/**生成好友列表右键菜单
	 * 
	 */
	public  JPopupMenu getPopup() {  
	        if(popup == null) {
	            popup = new JPopupMenu("Popup");
	            JMenuItem item1  = new JMenuItem("搜索");   
	            item1.addActionListener(new ActionListener() {
	                public void actionPerformed(ActionEvent e) {   
	                	 new SearchFriendView(id);
	                }
	            });
	            popup.add(item1);
	  
	            JMenuItem item2  = new JMenuItem("个人信息设置");   
	            item2.addActionListener(new ActionListener() {  
	                public void actionPerformed(ActionEvent e) {   
	                	try {
							new SetUserInfo(id,oos);
						} catch (Exception e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
	                }   
	            });   
	            popup.add(item2);   
	  
	            JMenuItem item3  = new JMenuItem("系统设置");   
	            item3.addActionListener(new ActionListener() {   
	                public void actionPerformed(ActionEvent e) {   
	                	try {
							new SetSysInfo(id);
						} catch (Exception e1) {
							e1.printStackTrace();
						}
	                }   
	            });   
	            popup.add(item3); 
	            
	            JMenuItem item4  = new JMenuItem("刷新");   
	            item4.addActionListener(new ActionListener() {   
	                public void actionPerformed(ActionEvent e) {   
	                	try {
							groupAndFriendInfo();
						} catch (Exception e1) {
							e1.printStackTrace();
						}
	                }   
	            });   
	            popup.add(item4);
	            popup.setInvoker(flv.getFriendListPanel());
	        }   
	        return popup;   
	} 
	/**生成群列表右键菜单
	 * 
	 */
	public  JPopupMenu getPopupg() {
        if(popupg == null) {   
            popupg = new JPopupMenu("Popup");   
            JMenuItem item1  = new JMenuItem("创建群");   
            item1.addActionListener(new ActionListener() {   
            	public void actionPerformed(ActionEvent e) {   
            		//用户Id，userId为12345的用户创建的群
            		try {
						new CreateGroupView(id + "");
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
            		//new CreateGroup("12345");
            	}   
            });   
            popupg.add(item1); 
  
            JMenuItem item2 = new JMenuItem("个人信息设置");   
            item2.addActionListener(new ActionListener() {   
                public void actionPerformed(ActionEvent e) {   
                	try {
						new SetUserInfo(id,oos);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
                }   
            });   
            popupg.add(item2);   
            
            JMenuItem item3  = new JMenuItem("系统设置");   
            item3.addActionListener(new ActionListener() {   
                public void actionPerformed(ActionEvent e) {   
                	try {
						new SetSysInfo(id);
					} catch (Exception e1) {
						e1.printStackTrace();
					}
                }   
            });   
            popupg.add(item3); 
            
            JMenuItem item4  = new JMenuItem("刷新");   
            item4.addActionListener(new ActionListener() {   
                public void actionPerformed(ActionEvent e) {   
                	try {
                		groupAndFriendInfo();
					} catch (Exception e1) {
						e1.printStackTrace();
					}
                }   
            });
            popupg.add(item4);
            
            popupg.setInvoker(flv.getFriendListPanel());
        }
        return popupg;
    } 
	//fl(list),friend(Jlabel),gl(list).group(jlabel)
	
	//好友列表右键事件
	private static JPopupMenu getPopupLabel(int a) { 
		final int aa = a ;
		JMenuItem item1  = new JMenuItem("修改备注");  
		JMenuItem item2  = new JMenuItem("删除好友");  
		popupLabel = new JPopupMenu();
        popupLabel.add(item1);
        popupLabel.add(item2);
        popupLabel.setInvoker(friend[a]);
        
        item1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				
				try {
                	 noteName = JOptionPane.showInputDialog("修改该好友备注：",fl.get(aa).getFriendNoteName());
            		if(noteName!=null){
            		fl.get(aa).setFriendNoteName(noteName);
            		friend[aa].setText(noteName+"    "+fl.get(aa).getSingature());
            		friend[aa].repaint();
                	Conn conn = new Conn();
            		Connection connection = conn.getConnection(null);
            		PreparedStatement  pstmt = null;
            			pstmt = connection.prepareStatement("update friend  set friendNoteName=? where userId=? and friendId = ?");
            			pstmt.setString(1, noteName);
            			pstmt.setString(2, "" + id);
                		pstmt.setString(3, "" + fl.get(aa).getFriendId());
                		pstmt.executeUpdate();
                		pstmt.close();
                  		connection.close(); 
            		}} catch (SQLException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}

			}
		});
        item2.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				try {
					new DeleteFriend("" + id,"" + fl.get(aa).getFriendId());
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				
			}
		});
        return popupLabel;
    }
	
	
	private static JPopupMenu getPopupgLabel(int g) {  
		final int gg = g;
		JMenuItem item1  = new JMenuItem("发送群消息");  
		JMenuItem item2  = new JMenuItem("退出群"); 
		popupgLabel = new JPopupMenu();
		popupgLabel.add(item1);
		popupgLabel.add(item2);
		popupgLabel.setInvoker(group[g]);
        
        item1.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				new GroupChatClient(id,gl.get(gg).getGroupId(),gl.get(gg).getGroupName(),oos);
			}
		});
        
        item2.addActionListener(new ActionListener() {
			
			@Override
			public void actionPerformed(ActionEvent e) {
				// TODO Auto-generated method stub
				try {
					new DeleteGroup("" + gl.get(gg).getGroupId(), "" + id);
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		});
         
        return popupgLabel;   
		}   
	
	
	/**刷新指定好友的状态数据(未用到)
	 * 
	 */
	public static void updateFriendStatus(int friendId){
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement  pstmt = null;
		FriendList fd = new FriendList();
		try {
			pstmt = connection.prepareStatement("select friendId,friendNoteName,groupingName,headPortrait,singature,status from userinfor where friendId=?");
			pstmt.setInt(1, friendId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				fd.setFriendId(rs.getInt("friendId"));
				fd.setFriendNoteName(rs.getString("friendNoteName"));
				fd.setGroupingName(rs.getString("groupingName"));
				fd.setHeadPortrait(rs.getString("headPortrait"));
				fd.setSingature(rs.getString("singature"));
				fd.setStatus(rs.getInt("status"));
			}
			pstmt.close();
	  		connection.close();
    		for(int i=0;i<fl.size();i++){
    			if(fl.get(i).getFriendId()==fd.getFriendId()){
    				fl.remove(i);
    				fl.add(i, fd);
    				flv.getFriendListPanel().remove(friend[i]);
    			}
    		}
    	flv.repaint();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}
	/**初始化个人信息
	 * 
	 */
	public static void userInfoMessage(){
		JPanel userInfoPicAfter,userInfoPicBefore;
		userInfoPicBefore = flv.getUserPic();
		if(user.getHeadPortrait()==null||user.getHeadPortrait().equals("")){
			userInfoPicAfter = new ImagePanel("image/pig.jpg");		
			System.out.println(5555555);				
			
		}else{
			userInfoPicAfter = new ImagePanel(user.getHeadPortrait());
			
		}
		userInfoPicAfter.setBounds(5, 5, 65, 65);
		flv.getFriendListViewPanel().remove(userInfoPicBefore);
		flv.getFriendListViewPanel().add(userInfoPicAfter);
		flv.setUserPic(userInfoPicAfter);
		flv.getUserPic().repaint();
			
		
		flv.getUserPic().addMouseListener(new MouseAdapter() {
			@Override
			public void mouseClicked(MouseEvent e) {
				if(e.getClickCount()== 2 && e.getButton() == MouseEvent.BUTTON1){
					System.out.println("userpic");
					try {
						new SetUserInfo(id,oos);
					} catch (Exception e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
				}
			}
		});
		flv.getUserPic().setBounds(5, 5, 65, 65);
		flv.getFriendListViewPanel().add(flv.getUserPic());
		flv.getUserName().setText(user.getNickName());
		flv.getUserSign().setText(user.getSingature());
		flv.getUserStatus().setSelectedIndex(user.getStatus()-1);
		flv.repaint();
	}
	
	/**初始化好友和群列表
	 *
	 */
	public static void groupAndFriendInfo()throws Exception{
		//获取好友列表
		flv.getFriendListPanel().removeAll();
		flv.getGroupListPanel().removeAll();
		fl= getFriendList(id);
		int flsize = fl.size();
		//获取群列表
		gl = getGroupList(id);
		int glsize = gl.size();
		if(flsize!=0){
			friend = new JLabel[flsize];
			for(int i=0;i<flsize;i++){
				if(fl.get(i).getStatus()==4)
					friend[i] = new JLabel(new ImageIcon("image/qq0.png"),Label.RIGHT);
				else if(fl.get(i).getStatus()==1)
					friend[i] = new JLabel(new ImageIcon("image/qq1.png"),Label.RIGHT);
				else if(fl.get(i).getStatus()==2)
					friend[i] = new JLabel(new ImageIcon("image/qq2.png"),Label.RIGHT);
				else if(fl.get(i).getStatus()==3)
					friend[i] = new JLabel(new ImageIcon("image/qq3.png"),Label.RIGHT);
				else {
					friend[i] = new JLabel(new ImageIcon("image/qq0.png"),Label.RIGHT);
				}
				final JLabel fri = friend[i];
				friend[i].addMouseListener(new MouseAdapter() {
					
					public void mousePressed(MouseEvent e) {
						if(friendSelected!=null){
							friendSelected.setFont(new Font("sansserif",0 , 12));
							friendSelected.setBorder(null);
						}
						fri.setBorder(new LineBorder(Color.lightGray));
						fri.setFont(new Font("宋体",0 , 14));
						friendSelected =fri;
						fri.setSize(283, 25); 
					}
					
					public void mouseExited(MouseEvent e) {
						if(fri!=friendSelected){
							fri.setBorder(null);
							fri.setFont(new Font("sansserif",0 , 12));
							fri.setSize(283, 25);
						}
					}
					
					public void mouseEntered(MouseEvent e) {
						if(fri!=friendSelected){
							fri.setBorder(new LineBorder(Color.lightGray));
							fri.setFont(new Font("宋体",0 , 14));
							fri.setSize(283, 25);
						}
					}
				});
				final int ii = i;
				friend[i].setToolTipText(fl.get(i).getSingature());
				friend[i].setBounds(2, 5+i*25, 283, 25);
				friend[i].setText(fl.get(i).getFriendNoteName()+"    "+fl.get(i).getSingature());
				flv.getFriendListPanel().add(friend[i]);
				//添加双击监听器
				friend[i].addMouseListener(new MouseAdapter() {
					public void mouseClicked(MouseEvent e) {
						int clickCount = e.getClickCount();
						if(clickCount == 2 && e.getButton() == MouseEvent.BUTTON1){
							boolean flag =true;
							Set<Integer> keys = mapFriend.keySet();
							for(int s : keys){
								if(((PCClient)mapFriend.get(s)).friendId==MainDisplay.fl.get(ii).getFriendId()){
									flag = false;
									((PCClient)mapFriend.get(s)).pcv.setVisible(true);
									//((PCClient)mapFriend.get(s)).pcv.setAlwaysOnTop(true);
								}
								//怎么显示注销的窗口;
							}
							if(flag){
								PCClient pcclient = new PCClient(id,MainDisplay.fl.get(ii).getFriendId(),MainDisplay.fl.get(ii).getFriendNoteName(),oos);
								mapFriend.put(MainDisplay.fl.get(ii).getFriendId(), pcclient);
								System.out.println("map的长度:"+mapFriend.size());
							}
						}
						if(e.getButton() == MouseEvent.BUTTON3) {   
		                    getPopupLabel(ii).show(e.getComponent(),   
		                               e.getX(), e.getY());   
						}
					}
				});

			}
			flv.repaint();
		}
		
		
		//初始化群列表
		if(glsize!=0){
			group = new JLabel[glsize];
			for(int g=0;g<glsize;g++){
				group[g] = new JLabel(new ImageIcon("image/qq.png"),Label.RIGHT);
				final int gg = g;
				final int groupId = gl.get(g).getGroupId();
				final String groupName = gl.get(g).getGroupName();
				group[g].setToolTipText(gl.get(g).getGroupContent());
				group[g].setBounds(0, 5+g*25, 300, 25);
				group[g].setText(groupName+"    "+gl.get(g).getGroupContent());
				flv.getGroupListPanel().add(group[g]);
				//添加双击监听器
				group[g].addMouseListener(new MouseAdapter() {
					public void mouseClicked(MouseEvent e) {
						int clickCount = e.getClickCount();
						if(clickCount == 2 && e.getButton() == MouseEvent.BUTTON1){
							boolean flag =true;
							Set<Integer> keys = mapGroup.keySet();
							for(int s : keys){
								if(((GroupChatClient)mapGroup.get(s)).friendId==MainDisplay.gl.get(gg).getGroupId()){
									flag = false;
									((GroupChatClient)mapGroup.get(s)).gcv.setVisible(true);
								}
								//怎么显示注销的窗口;
							}
							if(flag){
								GroupChatClient gcclient = new GroupChatClient(id,MainDisplay.gl.get(gg).getGroupId(),MainDisplay.gl.get(gg).getGroupName(),oos);
								mapGroup.put(MainDisplay.gl.get(gg).getGroupId(), gcclient);
								System.out.println("map的长度:"+mapGroup.size());
							}
						}
						if (e.getButton() == MouseEvent.BUTTON3){
							getPopupgLabel(gg).show(e.getComponent(), e.getX(), e.getY());
							
						}
				
						
					}
				});
					
					
			}
			flv.repaint();
		}
	}
	
	public static void main(String[] args) throws Exception{
		
		//优化界面
		try {
			UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel");
		} catch (Exception e) {
			e.printStackTrace();
		}
		MainDisplay md = new MainDisplay(11111);
		
	}
}
