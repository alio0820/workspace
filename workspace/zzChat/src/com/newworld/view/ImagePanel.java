package com.newworld.view;

import java.awt.Graphics;
import java.awt.Image;

import javax.swing.ImageIcon;
import javax.swing.JPanel;
//Design by littlePP
public class ImagePanel extends JPanel{

	private Image img;
	private int imgWidth;
	private int imgHeight;
	
	
	public ImagePanel(String imageFileName){
		this.img = new ImageIcon(imageFileName).getImage();
	}
	
	public ImagePanel(){
		this.img = new ImageIcon("image/pig.jpg").getImage();
	}
	
	
	
	protected void paintComponent(Graphics g) {

				g.drawImage(img,0,0,this.getWidth(),this.getHeight(),this);
		
	}	
	

}
