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

public class GroupArtFont implements ActionListener{
	Font font;
	private int boldStyle,italicStyle,underlineStyle;
	private int fontSizeStyle;
	private String fontNameStyle;
	private Color colorStyle=Color.black;//设置字体的默认颜色为黑色
	GroupChatView gcv;
	
	
public GroupArtFont(GroupChatView gcv1){
	this.gcv = gcv1;
	boldStyle=0;
	italicStyle=0;
	underlineStyle=0;
	fontSizeStyle=15;
	fontNameStyle="隶书";
	font=new Font(fontNameStyle,boldStyle+italicStyle,fontSizeStyle);

	//字体类型的设置
	gcv.getFontType().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    //int stateChange=e.getStateChange();//实现监听字体名字改变的事件
		   String a =String.valueOf(gcv.getFontType().getItemAt(gcv.getFontType().getSelectedIndex()));
		   fontNameStyle = a;
		   System.out.println(fontNameStyle);
		   font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		   gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }
		});
	
	//字体大小的设置
	gcv.getFontSize().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange();//实现监听字体大小改变的方法
		    int a = Integer.valueOf((String) gcv.getFontSize().getItemAt(gcv.getFontSize().getSelectedIndex()));
		    fontSizeStyle = a;
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }
		});
	
	//加粗设置
	gcv.getBoldBx().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
	
		    int stateChange=e.getStateChange(); //实现监听选择粗体状态改变的方法
		    if (gcv.getBoldBx().isSelected()){
		    boldStyle = 1;
		    }
		    else {
		    	boldStyle = 0;
		    }
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }
		});
	//斜体设置
	gcv.getItalicBx().addItemListener(new ItemListener(){
	
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange(); //实现监听选择斜体状态改变的方法
		   if (gcv.getItalicBx().isSelected()){
			    italicStyle = 2; 
		   }
		   else
			   italicStyle = 0; 
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }

		});
    gcv.getColorBtn().addActionListener(this);
    gcv.getInputTextArea().setFont(font);
	gcv.getChatTextArea().setFont(font);
}
   public void actionPerformed(ActionEvent e){
	if(e.getSource()==gcv.getColorBtn()){//改变颜色
	colorStyle=JColorChooser.showDialog(gcv.getColorBtn(),"选择字体颜色",colorStyle);
	gcv.getColorBtn().setForeground(colorStyle);
	gcv.getInputTextArea().setForeground(colorStyle);
	gcv.getChatTextArea().setForeground(colorStyle);
	}
	}

	}

