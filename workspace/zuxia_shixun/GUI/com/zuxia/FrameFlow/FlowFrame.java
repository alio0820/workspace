package com.zuxia.FrameFlow;

import java.awt.Graphics;
import java.awt.Image;


import javax.swing.ImageIcon;
import javax.swing.JPanel;

public class FlowFrame extends JPanel{
	private Image img;
	public Image getImg() {
		return img;
	}

	public void setImg(Image img) {
		this.img = img;
	}

	public FlowFrame(){
		this.img = new ImageIcon(this.getClass().getResource("Pet12.jpg")).getImage();		
	}
	
}
