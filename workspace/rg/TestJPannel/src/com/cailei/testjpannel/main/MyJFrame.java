package com.cailei.testjpannel.main;

/**
 * JPannel���ܵ���ʹ�ã�JPannel����������JFrame���ڣ�����ʹ��JPannel�Ĳ����ǣ�
 * 1.��ʼ����һ��JFrame��ʵ�����������JFrame��������ԡ�
 * 2.����JFrame��add(Component comp)������JPannel��һ��ʵ����ӽ�ȥ��
 */

import javax.swing.JFrame;

public class MyJFrame extends JFrame{
	
	public MyJFrame(){
		this.setSize(800, 610);
		this.setTitle("����JFrame�Ĳ���");
		this.setLocation(100, 100);
		this.add(new ChatPanel());
		this.setVisible(true);
	}
	
	public static void main(String[] args) {
		new MyJFrame();
	}

}
