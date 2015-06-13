package com.new_world.operation.groupchat;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import javax.swing.JTextArea;

import com.newworld.common.Message;
/**author:Íõ²ÊÀÝ
 * Time:2012-07-21  
 * Last change:
 * function: ÈºÁÄ²Ù×÷
 */
public class GroupChatThread extends Thread{
   private ObjectInputStream ois;
	
	private JTextArea input;
	private ObjectOutputStream oos;
	
	public GroupChatThread(ObjectInputStream ois,JTextArea input) {
		this.ois = ois;
		this.input = input;
	}



	public void run(){
		while(true){
			try {
				Message message = (Message)ois.readObject();
				System.out.println(message.toString());
				input.append(message.toString());
				oos = new ObjectOutputStream(new FileOutputStream("e:/record.txt"));
				oos.writeObject(message);
			} catch (Exception e) {
				e.printStackTrace();
				break;
			}
		}
	}
	
}
