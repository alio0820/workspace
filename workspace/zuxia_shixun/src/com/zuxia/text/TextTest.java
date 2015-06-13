package com.zuxia.text;

import javax.swing.JFrame;
import javax.swing.JTextArea;

public class TextTest extends JFrame
{
private JTextArea jTextArea=new JTextArea();
public TextTest()
{int j=jTextArea.getTabSize() ;
	this.setSize(200, 200);
	jTextArea.setBounds(40, 40, 40, 40);
	int i=jTextArea.getRows();
	System.out.println(i+"gdgd"+j);
	jTextArea.setLineWrap(false);
	this.add(jTextArea);
	this.setVisible(true);
	this.setDefaultCloseOperation(DISPOSE_ON_CLOSE);
	
}
public static void main(String[] args)
{
	new TextTest();
}
}
