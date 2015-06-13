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
			System.out.println("����������ʧ��...");
		}
	}
	//��ø�Ⱥ��������û�
	public ArrayList<Integer> getGroupUser(int groupId) throws Exception{
		ArrayList<Integer> gu = new ArrayList<Integer>();		
		Connection connection = conn.getConnection(null);
		pstmt = connection.prepareStatement("select userId from groupuser where groupId=?");
		pstmt.setInt(1, groupId);
		ResultSet  rs=pstmt.executeQuery();
		while(rs.next()){										//��if������
			gu.add(rs.getInt("userId"));
		}
		rs.close();
		pstmt.close();
		connection.close();
		return gu;
	}
	//��ȡ���û������к���
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
				if(i==0){													//��ʼ�������Ϣ
					PrivateChatServer.map.put(message.getSender(), oos);
					i++;
					System.out.println("��ʼ�������Ϣ");
					
					ArrayList<Integer> gf = this.getFriend(message.getSender());
					for(int userId : gf){
						oos =PrivateChatServer.map.get(userId);
						if(oos!=null){
							oos.writeObject(message);
							oos.flush();
							System.out.println("����������״̬�ı��ź�...");
						}
					}
				}
				else{
					if(message.getStatus()==1){									//������Ϣ
						if(message.getSendTo()<=9999){							//��ʱ��Ⱥ��Ϣ
							ArrayList<Integer> gu = this.getGroupUser(message.getSendTo());
							int j =0;
							System.out.println("gu��size:"+gu.size());
							for(int groupId : gu){
								System.out.println(groupId);
								j++;
								if(groupId==message.getSender())				//����Ǳ���������
									continue;
								oos =PrivateChatServer.map.get(groupId);
								if(oos!=null){
									oos.writeObject(message);
									oos.flush();
								}
								System.out.println("������"+j+"����");
							}
							System.out.println("Ⱥ��Ϣ");
						}
						else{													//��ʱ��˽����Ϣ
							oos =PrivateChatServer.map.get(message.getSendTo());
							if(oos!=null){
								oos.writeObject(message);
								oos.flush();
							}
							System.out.println("˽����Ϣ");
						}
					}
					else if(message.getStatus()==2){							//����״̬�ı��ź�
						if(message.getContent()!=null && message.getContent().equals("2")){
							PrivateChatServer.map.remove(message.getSender());
							System.out.println("������///");
							PrivateChatServer.clientNum--;
//							System.out.println(PrivateChatServer.map.size());
						}
						System.out.println("״̬�ı���Ӵ...");
						ArrayList<Integer> gf = this.getFriend(message.getSender());
						System.out.println("gf"+gf);
						for(int userId : gf){
							System.out.println(userId);
							oos =PrivateChatServer.map.get(userId);
							System.out.println("oos"+oos);
							if(oos!=null){
								oos.writeObject(message);
								oos.flush();
								System.out.println("����������״̬�ı��ź�...");
							}
						}
					}
					else if(message.getStatus()==3){							//���Ͷ����ź�
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
								message.setContent("�ú��Ѳ����ߣ����ܸ��䷢���ļ�");
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
				System.out.println("������������Ϣʧ��...");
				break;
			}
			
		}
		System.out.println("�ͻ�������...");
	}
}
