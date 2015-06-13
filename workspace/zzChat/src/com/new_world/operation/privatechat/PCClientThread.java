package com.new_world.operation.privatechat;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

import javax.swing.ImageIcon;
import javax.swing.JOptionPane;

import com.backup.VersionUtil;
import com.newworld.common.Conn;
import com.newworld.common.PCMessage;
import com.new_world.operation.groupchat.GroupChatClient;
import com.new_world.operation.mainframe.FriendList;
import com.new_world.operation.mainframe.GroupList;
import com.new_world.operation.mainframe.MainDisplay;
import com.new_world.operation.privatechat.PCClient;

public class PCClientThread extends Thread {
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	private ObjectInputStream ois;
//	private ObjectOutputStream oos;
	public PCClientThread(ObjectInputStream ois) {
		this.ois = ois;
	}
	/**��ȡ����������Ϣ
	 * 
	 */
	public FriendList getFriendInfo(int friendId) throws Exception{
		FriendList friendinfo = new FriendList();
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select headPortrait,singature,status,realName,birthday,mailbox,mobinum from userinfor where  userinfor.userId=?");
		pstmt.setInt(1, friendId);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){
			friendinfo.setFriendId(friendId);
			friendinfo.setHeadPortrait(rs.getString("headPortrait"));
			friendinfo.setSingature(rs.getString("singature"));
			friendinfo.setStatus(rs.getInt("status"));
			friendinfo.setBirthday(rs.getString("birthday"));
			friendinfo.setMailbox(rs.getString("mailbox"));
			friendinfo.setMobinum(rs.getString("mobinum"));
			friendinfo.setRealName(rs.getString("realName"));
		}
		pstmt = connection.prepareStatement("select friendNoteName,groupingName from friend where friendId=? and userId = ?");
		pstmt.setInt(1, friendId);
		pstmt.setInt(2, MainDisplay.id);
		rs=pstmt.executeQuery();
		while(rs.next()){
			friendinfo.setFriendNoteName(rs.getString("friendNoteName"));
			friendinfo.setGroupingName(rs.getString("groupingName"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		return friendinfo;
	}
	public static String getMessagePath(int friendId){
		//�жϼ�¼�ļ��Ƿ���ڣ���������ھʹ������ļ�
		String sysSet = String.valueOf(System.getProperty("user.dir"));
		sysSet = sysSet.replace("\\", "/");
		System.out.println(sysSet);
		String messagePath="D:/" + MainDisplay.id+ "-" + friendId + "message.txt";
		String messagePathReal = messagePath;
		File f1 = new File(sysSet + "/" + MainDisplay.id + "FilePath.txt");	
		if(!f1.exists()){
			try {
				f1.createNewFile();
				FileWriter fw = new FileWriter(f1);
				fw.write(messagePathReal);
				fw.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		else{
			try {
				BufferedReader br = new BufferedReader(new FileReader(sysSet + "/" + MainDisplay.id + "FilePath.txt"));
				messagePathReal = br.readLine();
				messagePathReal += "/"+ MainDisplay.id + "-" + friendId + "message.txt";				
			} catch (Exception e1) {
				System.out.println("�ļ�������");
			}
		}
		File f = new File(messagePathReal);
	    try{
			if(!f.exists()){
				f.createNewFile();
			}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	   return messagePathReal;
	}
	public void run(){
		
		while(true){
			try {
//				oos = new ObjectOutputStream(new FileOutputStream("e:/record.txt"));
				PCMessage message = (PCMessage)ois.readObject();
				int sendId = message.getSender();
				if(message.getStatus()==1){									//������Ϣ	
					File fR=null;
					if(message.getSendTo()>9999){								//˽����Ϣ
						if(MainDisplay.mapFriend.get(sendId)!=null){		//�����˴����������Ϣ
							
							PCClient pcclient = (PCClient)(MainDisplay.mapFriend.get(sendId));
							pcclient.pcv.getChatTextArea().append(message.toString());
							pcclient.pcv.setVisible(true);
							System.out.println("//1");
							//��ô��ʾע���Ĵ���;
						}
						else{
							String friendName=null;
							for(FriendList friendl:MainDisplay.fl){
								if(friendl.getFriendId()==sendId)
									friendName = friendl.getFriendNoteName();
							}
							PCClient pcclient = new PCClient(MainDisplay.user.getUserId(), sendId,friendName, MainDisplay.oos);						
							pcclient.pcv.getChatTextArea().append(friendName+message.toString2());
							pcclient.pcv.setTitle("�����ں�"+friendName+"����");
							MainDisplay.mapFriend.put(sendId, pcclient);
							System.out.println("//2");
						}
						fR = new File(PCClientThread.getMessagePath(message.getSender()));
					}
					else{											//Ⱥ����Ϣ
						int groupId = message.getSendTo();
						if(MainDisplay.mapGroup.get(groupId)!=null){		//�����˴����������Ϣ
							GroupChatClient gcclient = (GroupChatClient)(MainDisplay.mapGroup.get(groupId));
							gcclient.gcv.getChatTextArea().append(message.toString());
							gcclient.gcv.setVisible(true);
							System.out.println("//3");
							//��ô��ʾע���Ĵ���;
						}
						else{
							String groupName=null;
							for(GroupList group1:MainDisplay.gl){
								if(group1.getGroupId()==groupId)
									groupName = group1.getGroupName();
							}
							GroupChatClient gcclient = new GroupChatClient(MainDisplay.user.getUserId(), groupId,groupName, MainDisplay.oos);						
							gcclient.gcv.getChatTextArea().append(message.toString());
							MainDisplay.mapGroup.put(groupId, gcclient);
							System.out.println(MainDisplay.user.getUserId()+"����Ⱥ�Ĵ���"+message.toString());
						}
						fR = new File(PCClientThread.getMessagePath(message.getSendTo()));
					}
					//System.out.println("12345" + PCClientThread.getMessagePath(message.getSender()));
					
					FileWriter fw=null;
				    try{
						if(!fR.exists()){
							fR.createNewFile();							
						}
						fw = new FileWriter(fR,true);
				    }catch(Exception e1){
				    	System.out.println("������Ϣ��¼�ļ�ʧ��..");
				    }
					
					fw.append(message.toString());
					fw.close();
				}
				else if(message.getStatus()==2){						//����״̬�ı��ź�
					FriendList friendinfo = getFriendInfo(message.getSender());
					for(int i =0;i<MainDisplay.fl.size();i++){
						if(MainDisplay.fl.get(i).getFriendId()==message.getSender()){
							if(message.getContent()!=null && message.getContent().equals("1")){				//����
								String path=null;
								if(MainDisplay.fl.get(i).getHeadPortrait()==null||MainDisplay.fl.get(i).getHeadPortrait().equals(""))
								path= "image/rabbit1.jpg";
								else
									path = MainDisplay.fl.get(i).getHeadPortrait();
								new VersionUtil(path,MainDisplay.fl.get(i).getFriendNoteName());
							}
							MainDisplay.fl.remove(i);
							MainDisplay.fl.add(i,friendinfo);
//							MainDisplay.flv.remove(MainDisplay.friend[i]);
							MainDisplay.friend[i].setToolTipText(MainDisplay.fl.get(i).getSingature());
							MainDisplay.friend[i].setText(MainDisplay.fl.get(i).getFriendNoteName()+"    "+MainDisplay.fl.get(i).getSingature());
							if(MainDisplay.fl.get(i).getStatus()==4)
								MainDisplay.friend[i].setIcon(new ImageIcon("image/qq0.png"));			//�޸�ͷ��
							else if(MainDisplay.fl.get(i).getStatus()==1)
								MainDisplay.friend[i].setIcon(new ImageIcon("image/qq1.png"));
							else if(MainDisplay.fl.get(i).getStatus()==2)
								MainDisplay.friend[i].setIcon(new ImageIcon("image/qq2.png"));
							else if(MainDisplay.fl.get(i).getStatus()==3)
								MainDisplay.friend[i].setIcon(new ImageIcon("image/qq3.png"));
							else
								MainDisplay.friend[i].setIcon(new ImageIcon("image/qq0.png"));
							MainDisplay.friend[i].repaint();
							System.out.println("�����µ���Ϣ");
							break;
						}
					}
				}
				else if(message.getStatus()==3){							//����
					if(MainDisplay.mapFriend.get(sendId)!=null){							
						PCClient pcclient = (PCClient)(MainDisplay.mapFriend.get(sendId));
						pcclient.pcv.setVisible(true);
						int x = pcclient.pcv.getX();
					    int y = pcclient.pcv.getY();
					    for (int i = 0; i < 20; i++) {
					     if ((i & 1) == 0) {
					      x += 10;
					      y +=10;
					     } else {
					      x -= 10;
					      y -= 10;
					     }
					     pcclient.pcv.setLocation(x, y);
					     try {
					      Thread.sleep( 60);
					     } catch (InterruptedException e1) {
					      e1.printStackTrace();
					     }
					    }						
						System.out.println("//1");
						//��ô��ʾע���Ĵ���;
					}
					else{
						String friendName=null;
						for(FriendList friendl:MainDisplay.fl){
							if(friendl.getFriendId()==sendId)
								friendName = friendl.getFriendNoteName();
						}
						PCClient pcclient = new PCClient(MainDisplay.user.getUserId(), sendId,friendName, MainDisplay.oos);						
						
						MainDisplay.mapFriend.put(sendId, pcclient);
						System.out.println("//2");
					}
				}
				else if(message.getStatus()==4){
					PCClient pcclient = (PCClient)(MainDisplay.mapFriend.get(sendId));
					String mess = "��ĺ���"+message.getSender()+"���㷢��"+message.getContent()+"�ļ�,���Ƿ���գ�";
					int a = JOptionPane.showConfirmDialog(null, mess, "title", JOptionPane.OK_CANCEL_OPTION);
				}
				else if(message.getStatus()==5){
					if(MainDisplay.mapFriend.get(sendId)!=null){		
						
						PCClient pcclient = (PCClient)(MainDisplay.mapFriend.get(sendId));						
						File fR = new File(pcclient.filePath);
					    try{
							if(fR.exists()){
								new ClientTcpSend(pcclient.filePath);
							}
					    }catch(Exception e1){
					    	System.out.println("������Ϣ��¼�ļ�ʧ��..");
					    }
					    new ClientTcpSend(pcclient.filePath);
					}
					
				}
			} catch (Exception e) {
				System.out.println("�ͻ��˶�ȡ��Ϣʧ��...");
				e.printStackTrace();
				break;
			}
		}
	}
	
}

