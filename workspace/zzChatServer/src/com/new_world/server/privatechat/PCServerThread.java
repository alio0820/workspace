package com.new_world.server.privatechat;

import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Set;

import com.newworld.common.Conn;
import com.newworld.common.PCMessage;

public class PCServerThread extends Thread{
	private ObjectInputStream ois;
	private ObjectOutputStream oos;
	private int sender;
	private Conn conn = Conn.getConnInstance();
	private PreparedStatement pstmt = null;
	public PCServerThread(Socket socket,ObjectOutputStream oos) {
		try {
			ois = new ObjectInputStream(socket.getInputStream());
			this.oos=oos;
		} catch (IOException e) {
			System.out.println("监听输入流失败...");
		}
	}
	//获得该群里的所有用户
	public ArrayList<Integer> getGroupUser(int groupId) throws Exception{
		ArrayList<Integer> gu = new ArrayList<Integer>();		
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select userId from groupuser where groupId=?");
		pstmt.setInt(1, groupId);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){										//被if语句坑了
			gu.add(rs.getInt("userId"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		return gu;
	}
	//获取该用户的所有好友
	public ArrayList<Integer> getFriend(int userId) throws Exception{
		ArrayList<Integer> gf = new ArrayList<Integer>();
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select friendId from friend where userId=?");
		pstmt.setInt(1, userId);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){										
			gf.add(rs.getInt("friendId"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		return gf;
	}
	public void run(){
		int i=0;
		while(true){
			try {
				PCMessage message = (PCMessage)ois.readObject();
				if(i==0){													//初始化身份信息
					PrivateChatServer.map.put(message.getSender(), oos);
					i++;
					System.out.println("初始化身份消息");
					
					ArrayList<Integer> gf = this.getFriend(message.getSender());
					for(int userId : gf){
						oos =PrivateChatServer.map.get(userId);
						if(oos!=null){
							oos.writeObject(message);
							oos.flush();
							System.out.println("服务器推送状态改变信号...");
						}
					}
				}
				else{
					if(message.getStatus()==1){									//推送消息
						if(message.getSendTo()<=9999){							//此时是群消息
							ArrayList<Integer> gu = this.getGroupUser(message.getSendTo());
							int j =0;
							System.out.println("gu的size:"+gu.size());
							for(int groupId : gu){
								System.out.println(groupId);
								j++;
								if(groupId==message.getSender())				//如果是本人则跳过
									continue;
								oos =PrivateChatServer.map.get(groupId);
								if(oos!=null){
									oos.writeObject(message);
									oos.flush();
								}
								System.out.println("发给了"+j+"个人");
							}
							System.out.println("群消息");
						}
						else{													//此时是私聊消息
							oos =PrivateChatServer.map.get(message.getSendTo());
							if(oos!=null){
								oos.writeObject(message);
								oos.flush();
							}
							System.out.println("私聊消息");
						}
					}
					else if(message.getStatus()==2){							//推送状态改变信号
						if(message.getContent()!=null && message.getContent().equals("2")){
							PrivateChatServer.map.remove(message.getSender());
							System.out.println("下线了///");
							PrivateChatServer.clientNum--;
//							System.out.println(PrivateChatServer.map.size());
						}
						System.out.println("状态改变了哟...");
						ArrayList<Integer> gf = this.getFriend(message.getSender());
						System.out.println("gf"+gf);
						for(int userId : gf){
							System.out.println(userId);
							oos =PrivateChatServer.map.get(userId);
							System.out.println("oos"+oos);
							if(oos!=null){
								oos.writeObject(message);
								oos.flush();
								System.out.println("服务器推送状态改变信号...");
							}
						}
					}
					else if(message.getStatus()==3){							//推送抖动信号
						oos =PrivateChatServer.map.get(message.getSendTo());
						if(oos!=null){
							oos.writeObject(message);
							oos.flush();
						}
					}
					else if(message.getStatus()==4){
						oos =PrivateChatServer.map.get(message.getSendTo());
						if(oos!=null){
							oos.writeObject(message);
							oos.flush();
						}
						else{
							oos =PrivateChatServer.map.get(message.getSender());
							if(oos!=null){
								message.setContent("该好友不在线，不能给其发送文件");
								message.setStatus(5);
								oos.writeObject(message);
								oos.flush();
							}
						}
					}
				}
//				for(ObjectOutputStream oos : PrivateChatServer.sets){
//					oos.writeObject(message);
//					oos.flush();
//				}
			} catch (Exception e) {
				System.out.println("服务器发送消息失败...");
				break;
			}
			
		}
		System.out.println("客户端下线...");
	}
}
