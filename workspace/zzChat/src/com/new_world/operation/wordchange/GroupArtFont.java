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
	private Color colorStyle=Color.black;//���������Ĭ����ɫΪ��ɫ
	GroupChatView gcv;
	
	
public GroupArtFont(GroupChatView gcv1){
	this.gcv = gcv1;
	boldStyle=0;
	italicStyle=0;
	underlineStyle=0;
	fontSizeStyle=15;
	fontNameStyle="����";
	font=new Font(fontNameStyle,boldStyle+italicStyle,fontSizeStyle);

	//�������͵�����
	gcv.getFontType().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    //int stateChange=e.getStateChange();//ʵ�ּ����������ָı���¼�
		   String a =String.valueOf(gcv.getFontType().getItemAt(gcv.getFontType().getSelectedIndex()));
		   fontNameStyle = a;
		   System.out.println(fontNameStyle);
		   font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		   gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }
		});
	
	//�����С������
	gcv.getFontSize().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange();//ʵ�ּ��������С�ı�ķ���
		    int a = Integer.valueOf((String) gcv.getFontSize().getItemAt(gcv.getFontSize().getSelectedIndex()));
		    fontSizeStyle = a;
		    font = new Font (fontNameStyle,boldStyle+italicStyle,fontSizeStyle);
		    gcv.getInputTextArea().setFont(font);
			gcv.getChatTextArea().setFont(font);
		   }
		});
	
	//�Ӵ�����
	gcv.getBoldBx().addItemListener(new ItemListener(){
		   public void itemStateChanged(ItemEvent e){
	
		    int stateChange=e.getStateChange(); //ʵ�ּ���ѡ�����״̬�ı�ķ���
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
	//б������
	gcv.getItalicBx().addItemListener(new ItemListener(){
	
		   public void itemStateChanged(ItemEvent e){
		    int stateChange=e.getStateChange(); //ʵ�ּ���ѡ��б��״̬�ı�ķ���
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
	if(e.getSource()==gcv.getColorBtn()){//�ı���ɫ
	colorStyle=JColorChooser.showDialog(gcv.getColorBtn(),"ѡ��������ɫ",colorStyle);
	gcv.getColorBtn().setForeground(colorStyle);
	gcv.getInputTextArea().setForeground(colorStyle);
	gcv.getChatTextArea().setForeground(colorStyle);
	}
	}

	}

