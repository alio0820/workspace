package com.cailei.testjpannel.main;

import java.awt.BorderLayout;
import java.awt.TextArea;

import javax.swing.JPanel;

 public class ChatPanel extends JPanel{
	
	public TextArea chatLineArea =new TextArea ("",18,30,TextArea.SCROLLBARS_VERTICAL_ONLY);
	public ChatPanel(){
		setLayout(new BorderLayout());
		this.setSize(800, 600);
		add(chatLineArea,BorderLayout.CENTER);
	}

}


