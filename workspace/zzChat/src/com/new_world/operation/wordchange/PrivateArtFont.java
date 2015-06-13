package com.new_world.operation.wordchange;


import java.awt.Color;
import java.awt.EventQueue;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;

import javax.swing.JButton;
import javax.swing.JColorChooser;
import javax.swing.JFrame;
import javax.swing.JPanel;
import javax.swing.SwingUtilities;
import javax.swing.UIManager;

import com.new_world.operation.groupchat.GroupOperation;
import com.newworld.view.GroupChatView;
import com.newworld.view.PrivateChatView;

public class PrivateArtFont implements ActionListener{
	Font font;
	private int boldStyle,italicStyle,underlineStyle;
	private int fontSizeStyle;
	private String fontNameStyle;
	private Color colorStyle=Color.black;//设置字体的默认颜色为黑色
	PrivateChatView pcv;
	
	
public PrivateArtFont(PrivateChatView pcv1){
	this.pcv = pcv1;
	boldStyle=0;
	italicStyle=0;
	underlineStyle=0;
	fontSizeStyle=15;
	fontNameStyle="隶书";
	font=new Font(fontNameStyle,boldStyle+italicStyle,fontSizeStyle);

	//字体类型的设置
	pcv.getFontType().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    //int stateChange=e.getStateChange();//实现监听字体名字改变的事件
		   String a =String.valueOf(pcv.getFontType().getItemAt(pcv.getFontType().getSelectedIndex()));
		   fontNameStyle = a;
		   System.out.println(fontNameStyle);
		   font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		   pcv.getInputTextArea().setFont(font);
			pcv.getChatTextArea().setFont(font);
		   }
		});
	
	//字体大小的设置
	pcv.getFontSize().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange();//实现监听字体大小改变的方法
		    int a = Integer.valueOf((String) pcv.getFontSize().getItemAt(pcv.getFontSize().getSelectedIndex()));
		    fontSizeStyle = a;
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    pcv.getInputTextArea().setFont(font);
			pcv.getChatTextArea().setFont(font);
		   }
		});
	
	//加粗设置
	pcv.getBoldBx().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
	
		    int stateChange=e.getStateChange(); //实现监听选择粗体状态改变的方法
		    if (pcv.getBoldBx().isSelected()){
		    boldStyle = 1;
		    }
		    else {
		    	boldStyle = 0;
		    }
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    pcv.getInputTextArea().setFont(font);
			pcv.getChatTextArea().setFont(font);
		   }
		});
	//斜体设置
	pcv.getItalicBx().addItemListener(new ItemListener(){
	
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange(); //实现监听选择斜体状态改变的方法
		   if (pcv.getItalicBx().isSelected()){
			    italicStyle = 2; 
		   }
		   else
			   italicStyle = 0; 
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    pcv.getInputTextArea().setFont(font);
			pcv.getChatTextArea().setFont(font);
		   }

		});
    pcv.getColorBtn().addActionListener(this);
    pcv.getInputTextArea().setFont(font);
	pcv.getChatTextArea().setFont(font);
}
   public void actionPerformed(ActionEvent e){
	if(e.getSource()==pcv.getColorBtn()){//改变颜色
	colorStyle=JColorChooser.showDialog(pcv.getColorBtn(),"选择字体颜色",colorStyle);
	pcv.getColorBtn().setForeground(colorStyle);
	pcv.getInputTextArea().setForeground(colorStyle);
	pcv.getChatTextArea().setForeground(colorStyle);
	}
	}

	}

