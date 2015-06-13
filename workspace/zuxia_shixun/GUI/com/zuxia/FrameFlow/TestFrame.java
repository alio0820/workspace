package com.zuxia.FrameFlow;

import java.awt.Color;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;

import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;

import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.border.LineBorder;

public class TestFrame{
	private JFrame jfMain = new JFrame("测试鼠标跟随");
	private JPanel jpMain = new JPanel();
	private JLabel jl = new JLabel(new ImageIcon(this.getClass().getResource("Pet12.jpg")));
	private int FirstX=0;
	private int FirstY=0;
	private boolean flag=false;
	public TestFrame(){
//		jfMain.setResizable(false);
		jl.setBounds(0, 0, 150, 150);
//		jl.setBorder(new LineBorder(Color.red));
		jpMain.setLayout(null);				//设置面板的layout为null
		jpMain.setBackground(Color.white);
		
		jfMain.setBounds(200,200,385,305);
		jfMain.add(jpMain);
		jpMain.add(jl);
		//jl.setLocation(0, 0);
		//frame的问题
		jpMain.addMouseMotionListener(new MouseAdapter(){

			public void mouseDragged(MouseEvent e){
				if(flag){
					jl.setLocation(+e.getX()+FirstX,e.getY()+FirstY);
				}
			}

		});
		jpMain.addMouseListener(new MouseAdapter(){
			public void mousePressed(MouseEvent e){
				int x = (int)jl.getLocation().getX();
				int y = (int)jl.getLocation().getY();
				if(e.getX()>=x&&e.getX()<=x+150&&e.getY()>=y&&e.getY()<=y+150){
					flag=true;
					FirstX = (int)jl.getLocation().getX()-e.getX();
					FirstY = (int)jl.getLocation().getY()-e.getY();
					System.out.println(1111);
				}
			}
			
			public void mouseReleased(MouseEvent e){
				flag=false;
			}
		});
		
		jfMain.addKeyListener(new KeyAdapter() {
			public void keyPressed(KeyEvent e) {
				if(e.getKeyCode()==KeyEvent.VK_UP&&jl.getLocation().y>=0)								//上
				{
					jl.setLocation((int)jl.getLocation().getX(),(int)jl.getLocation().getY()-10);		
				}
				if(e.getKeyCode()==KeyEvent.VK_RIGHT&&jl.getLocation().x+150<=jfMain.getWidth()){		//右
					jl.setLocation((int)jl.getLocation().getX()+10,(int)jl.getLocation().getY());
				}
				if(e.getKeyCode()==KeyEvent.VK_DOWN&&jl.getLocation().y+150<=jfMain.getHeight()){		//下 
					jl.setLocation((int)jl.getLocation().getX(),(int)jl.getLocation().getY()+10);
				}
				if(e.getKeyCode()==KeyEvent.VK_LEFT&&jl.getLocation().x>=0){							//左
					jl.setLocation((int)jl.getLocation().getX()-10,(int)jl.getLocation().getY());
				}
			}
		});
		jfMain.addWindowListener(new WindowAdapter(){
			public void windowClosing(WindowEvent e){
				System.exit(0);
			}
		});
		jfMain.setVisible(true);
	}
	public static void main(String[] args) {
		new TestFrame();
		
	}

}
