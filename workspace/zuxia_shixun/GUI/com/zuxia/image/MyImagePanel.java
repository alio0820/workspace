package com.zuxia.image;

import java.awt.Graphics;
import java.awt.Image;

import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class MyImagePanel extends JPanel{
	private Image img;
	private int imgWidth;
	private int imgHeight;
	
	public MyImagePanel(){
		this.img = new ImageIcon(this.getClass().getResource("dot.gif")).getImage();
		this.imgWidth =this.img.getWidth(this);
		this.imgHeight = this.img.getHeight(this);
	}
	
	public MyImagePanel(String imageFileName){
		this.img = new ImageIcon(imageFileName).getImage();
		this.imgWidth =this.img.getWidth(this);
		this.imgHeight = this.img.getHeight(this);
	}
	
	public MyImagePanel(Image image){
		this.img = image;
		this.imgWidth =this.img.getWidth(this);
		this.imgHeight = this.img.getHeight(this);
	}
	protected void paintComponent(Graphics g){
//		g.drawImage(img, 0, 0, this);
//		g.drawImage(img, 0, 0, this.getWidth(), this.getHeight(), this);
		
		for(int x=0;x<this.getWidth();x+=imgWidth){
			for(int y =0;y<this.getHeight();y+=imgHeight){
				g.drawImage(img, x, y, this);
			}
		}
	}
}	
