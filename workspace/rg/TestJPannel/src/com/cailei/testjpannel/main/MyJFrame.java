package com.cailei.testjpannel.main;

/**
 * JPannel不能单独使用，JPannel必须依赖于JFrame存在，所以使用JPannel的步骤是：
 * 1.初始化化一个JFrame的实例，设置这个JFrame的相关属性。
 * 2.调用JFrame的add(Component comp)方法将JPannel的一个实例添加进去。
 */

import javax.swing.JFrame;

public class MyJFrame extends JFrame{
	
	public MyJFrame(){
		this.setSize(800, 610);
		this.setTitle("关于JFrame的测试");
		this.setLocation(100, 100);
		this.add(new ChatPanel());
		this.setVisible(true);
	}
	
	public static void main(String[] args) {
		new MyJFrame();
	}

}
