package com.new_world.operation.privatechat;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;
import java.util.Date;

import javax.swing.JFileChooser;
import javax.swing.JPanel;
import javax.swing.KeyStroke;


import com.backup.FlashWindow;
import com.new_world.operation.mainframe.MainDisplay;

import com.new_world.operation.mainframe.FriendList;
import com.new_world.operation.mainframe.MainDisplay;
import com.new_world.operation.setinfo.ImagePanel;
import com.new_world.operation.snapshot.SnapshotTest;
import com.new_world.operation.wordchange.PrivateArtFont;
import com.newworld.common.PCMessage;
import com.newworld.view.PrivateChatView;
import com.newworld.view.SearchFriendView;

/**author:翟灿东
 * Time:2012-07-21  09:30
 * Last change:
 * function: 私聊窗口消息的发送和接收
 */
public class PCClient {
	public PrivateChatView pcv;
	public int friendId;
	private Socket socket;
	private BufferedReader br;
	private String messagePath;
	private String messagePathReal;
	public String filePath;
	public String fileName;
	private JPanel userPicAf;
	private boolean flagEnter = true;
	private FileInputStream readSysSet;
	
	public PCClient(int userId,int friendId,final String friendName,final ObjectOutputStream oos){		
		this.friendId = friendId;
		pcv =new PrivateChatView(friendName+"("+friendId+")");
		pcv.setTitle("你正在和"+friendName+"聊天");
		final int  user =userId;
		final int friend  = friendId;
		
		pcv.getItem3().addMouseListener(new MouseAdapter() {

			public void mousePressed(MouseEvent e) {
				PCMessage message = new PCMessage();
				message.setSender(user);
				message.setSendTo(friend);
				message.setStatus(3);
				try {
					oos.writeObject(message);
				} catch (Exception e1) {
					System.out.println("发送身份消息失败...");
				}
				int x = pcv.getX();
			    int y = pcv.getY();
			    for (int i = 0; i < 20; i++) {
			     if ((i & 1) == 0) {
			      x += 10;
			      y +=10;
			     } else {
			      x -= 10;
			      y -= 10;
			     }
			    pcv.setLocation(x, y);
			     try {
			      Thread.sleep( 60);
			     } catch (InterruptedException e1) {
			      e1.printStackTrace();
			     }
			    }
			  
			   }
			  });		

		//私聊窗口用户信息显示
		FriendList fff = new FriendList();
		for(int i=0;i<MainDisplay.fl.size();i++){
			if(MainDisplay.fl.get(i).getFriendId()==friendId){
				fff = MainDisplay.fl.get(i);
				String a = fff.getHeadPortrait();
				if (a==null||a.equals("")) {
					userPicAf = new ImagePanel("image/pig.jpg");			
					
				}else{
					userPicAf = new ImagePanel(a);
					
				}
				pcv.getPrivateChatPanel().remove(pcv.getFriendPic());
				userPicAf.setBounds(10, 10, 65, 65);
				pcv.getPrivateChatPanel().add(userPicAf);
				
				pcv.getFriendRearNameTF().setText(fff.getRealName());
				pcv.getFriendBirthdayTF().setText(fff.getBirthday());
				pcv.getFriendTeleTF().setText(fff.getMobinum());
				pcv.getFriendMailboxTF().setText(fff.getMailbox());
				pcv.repaint();
				break;
			}
		}
		
		
		//判断记录文件是否存在，如果不存在就创建该文件
		String sysSet = String.valueOf(System.getProperty("user.dir"));
		sysSet = sysSet.replace("\\", "/");
		//System.out.println(sysSet);
		messagePath="D:/" + user + "-" + friend + "message.txt";
		messagePathReal = messagePath;
		File f1 = new File(sysSet + "/" + userId + "FilePath.txt");
		if(!f1.exists()){
			try {
				f1.createNewFile();
				FileWriter fw = new FileWriter(f1);
				fw.write("D:/");
				fw.close();
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		else{
			try {
				br = new BufferedReader(new FileReader(sysSet + "/" + userId + "FilePath.txt"));
				messagePathReal = br.readLine();
				messagePathReal += "/"+ user + "-" + friend + "message.txt";
			} catch (Exception e1) {
				System.out.println("文件不存在");
			}
		}
		File f = new File(messagePathReal);
		//System.out.println(messagePathReal);
	    try{
			if(!f.exists()){
				f.createNewFile();
				
			}
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
	    final String messagePathRealR = messagePathReal;

	    
	  //截图的监听事件，进行截图
		pcv.getPrintScreen().addMouseListener(new MouseAdapter()  {
			@Override
			public void mouseClicked(MouseEvent e) {
				// TODO Auto-generated method stub
			 	try {
			 			new SnapshotTest(user);
			 		/*SwingUtilities.invokeLater(new Runnable() {
			 			public void run() {
			 			new RectD();
			 			}
			 			});*/
				} catch (Exception e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
	});
		
		pcv.getFileTransfer().addMouseListener(new MouseAdapter() {
			
			@Override
			public void mouseClicked(MouseEvent e) {
				
				JFileChooser jfc = new JFileChooser("E:/");
				jfc.setDialogTitle("请选择需要发送的文件：");
				int isChoose = jfc.showOpenDialog(null);
				if(isChoose == 0){
					filePath = jfc.getSelectedFile().getPath();
					fileName = jfc.getSelectedFile().getName();
					filePath = filePath.replace("\\", "/");
					System.out.println(filePath);
					//发送身份信息
					PCMessage message = new PCMessage();
					message.setSender(user);
					message.setSendTo(friend);
					message.setContent(fileName);
					message.setStatus(4);
					try {
						oos.writeObject(message);
					} catch (Exception e1) {
						System.out.println("发送身份消息失败...");
					}
				}
			}
		});
	    
		 
	    pcv.getMessageRem().addMouseListener(new MouseAdapter() {

			public void mousePressed(MouseEvent e) {
				File fR = new File(messagePathRealR);
			    try{
					if(!fR.exists()){
						fR.createNewFile();
					}
			    }catch(Exception e1){
			    	System.out.println("创建消息记录文件失败..");
			    }
				if(pcv.getMessageRem().isSelected()){
					pcv.getFriendRealNameLabel().setVisible(false);
					pcv.getFriendRearNameTF().setVisible(false);
					pcv.getFriendBirthdayLabel().setVisible(false);
					pcv.getFriendBirthdayTF().setVisible(false);
					pcv.getFriendTeleLabel().setVisible(false);
					pcv.getFriendTeleTF().setVisible(false);
					pcv.getFriendMailboxLabel().setVisible(false);
					pcv.getFriendMailboxTF().setVisible(false);
					pcv.getChatRecordSP().setViewportView(pcv.getChatRecordTA());
					pcv.getChatRecordSP().setBounds(415, 90, 270, 430);
					pcv.getChatScrollPane().setVisible(true);
					pcv.getPrivateChatPanel().add(pcv.getChatRecordSP());
					pcv.getPrivateChatPanel().repaint();
					try {
						BufferedReader br =new BufferedReader(new FileReader(messagePathRealR));
						String text="";
						String data= br.readLine();
						while(data!=null){
							text=text+data+"\n";
							data= br.readLine();
						}
						pcv.getChatRecordTA().setText(text);
					} catch (Exception e1) {
						e1.printStackTrace();
					} 
										
				}else if(!pcv.getMessageRem().isSelected()){
					pcv.getFriendRealNameLabel().setVisible(true);
					pcv.getFriendRearNameTF().setVisible(true);
					pcv.getFriendBirthdayLabel().setVisible(true);
					pcv.getFriendBirthdayTF().setVisible(true);
					pcv.getFriendTeleLabel().setVisible(true);
					pcv.getFriendTeleTF().setVisible(true);
					pcv.getFriendMailboxLabel().setVisible(true);
					pcv.getFriendMailboxTF().setVisible(true);
					pcv.getPrivateChatPanel().remove(pcv.getChatRecordSP());
					pcv.getPrivateChatPanel().repaint();
				}
				
				
			}
		});
	    
		KeyStroke   enter   =   KeyStroke.getKeyStroke( "ENTER");
		pcv.getInputTextArea().getInputMap().put(enter,"none");			//禁用回车
		
		String str = String.valueOf(System.getProperty("user.dir"));
		try {
			readSysSet = new FileInputStream(str + "/" + user + "SysSetFile.txt");
			int aa = readSysSet.read();
			if(aa == -1){
				flagEnter = true;
			}else{
				readSysSet.read();
				int a = readSysSet.read();
				if(a == 1){
					flagEnter = true;
				}else{
					flagEnter = false;
				}
				
			}
			//System.out.println(flagEnter);
			
		} catch (FileNotFoundException e2) {
			// TODO Auto-generated catch block
			e2.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			

		
		
		
		System.out.println(flagEnter);
		//input框回车事件
		pcv.getInputTextArea().addKeyListener(new KeyAdapter() {
			
			public void keyPressed(KeyEvent e) {
				File fR = new File(messagePathRealR);
			    try{
					if(!fR.exists()){
						fR.createNewFile();
					}
			    }catch(Exception e1){
			    	System.out.println("创建消息记录文件失败..");
			    }
			    String s = pcv.getInputTextArea().getText();
				if (flagEnter == true) {
					if (e.getKeyCode() == 10 && (!s.equals("")) && s != null) {
						PCMessage message = new PCMessage();
						message.setSender(user);
						message.setSendTo(friend);
						message.setSendTime(new Date());
						message.setStatus(1);
						message.setContent(s);
						try {
							oos.writeObject(message);
							FileWriter fw = new FileWriter(messagePathRealR,
									true);
							fw.append(MainDisplay.user.getNickName()+message.toString2());
							fw.close();
							pcv.getInputTextArea().setText("");
							pcv.getChatTextArea().append(MainDisplay.user.getNickName()+message.toString2());
						} catch (Exception e1) {
							System.out.println("发送消息失败...");
						}
					}
				}else if(flagEnter == false){
					if(e.isControlDown() && e.VK_ENTER==e.getKeyCode() && (!s.equals("")) && s != null){
						PCMessage message = new PCMessage();
						message.setSender(user);
						message.setSendTo(friend);
						message.setSendTime(new Date());
						message.setStatus(1);
						message.setContent(s);
						try {
							oos.writeObject(message);
							FileWriter fw = new FileWriter(messagePathRealR,
									true);
							fw.append(MainDisplay.user.getNickName()+message.toString2());
							fw.close();
							pcv.getInputTextArea().setText("");
							pcv.getChatTextArea().append(MainDisplay.user.getNickName()+message.toString2());
						} catch (Exception e1) {
							System.out.println("发送消息失败...");
						}
					}
				}
			}
		});
		
		
		
		//发送按钮
		pcv.getSendButton().addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				File fR = new File(messagePathRealR);
			    try{
					if(!fR.exists()){
						fR.createNewFile();
					}
			    }catch(Exception e1){
			    	System.out.println("创建消息记录文件失败..");
			    }
				String s = pcv.getInputTextArea().getText();
				if((!s.equals(""))&&s!=null){
					
					PCMessage message = new PCMessage();
					message.setSender(user);
					message.setSendTo(friend);
					message.setSendTime(new Date());
					message.setStatus(1);
					message.setContent(s);
					try {
						oos.writeObject(message);
						FileWriter fw = new FileWriter(messagePathRealR,true);
						fw.append(MainDisplay.user.getNickName()+message.toString2());
						fw.close();
						pcv.getInputTextArea().setText("");
						pcv.getChatTextArea().append(MainDisplay.user.getNickName()+message.toString2());
					} catch (Exception e1) {
						System.out.println("发送消息失败...");
					}
				}
			}
		});
		
		//设置字体监听事件
		pcv.getCharacterFormat().addMouseListener(new MouseAdapter(){

			public void mousePressed(MouseEvent e) {
				if (pcv.getCharacterFormat().isSelected()){
					pcv.getFontPanel().setVisible(true);
				pcv.getFontPanel().setLayout(null);
				pcv.getFontPanel().setBounds(10,345, 400, 50);
				pcv.getFontPanel().setOpaque(false);
				pcv.getPrivateChatPanel().add(pcv.getFontPanel());
				}
				else
					pcv.getFontPanel().setVisible(false);
			}
		});
		
		
		
		//关闭按钮
		pcv.getCloseButton().addActionListener(new ActionListener() {
			
			public void actionPerformed(ActionEvent e) {
				pcv.dispose();
			}
		});
		
		//启动接受消息线程
//		PCClientThread clientThread;
//		try {
//			clientThread = new PCClientThread(new ObjectInputStream(socket.getInputStream()), pcv.getChatTextArea());
//			clientThread.start();
//		} catch (IOException e1) {
//			System.out.println("接收消息失败...");
//		}
		new PrivateArtFont(pcv);
	}
	public static void main(String[] args) {
		
	}
}
