package com.rg.snake.object;

import java.awt.Color;
import java.awt.Graphics;

public class Stone {
	
	private int x;
	private int y;
	private int size;
	
	public Stone(){
		this.size = Snake.BODY_SIZE;
	}
	
	public Stone(int x, int y){
		this.size = Snake.BODY_SIZE;
		this.x = x * size;
		this.y = y * size;
	}
	
	public void drawMe(Graphics g){
		Color c = g.getColor();
		g.setColor(Color.GRAY);
		g.fill3DRect(x, y, size, size, true);
		g.setColor(c);
	}
	
	public boolean isHitMe(Snake snake){
		boolean flag = false;
		if(this.x == snake.getHead().getX() && this.y == snake.getHead().getY()){
			flag = true;
		}
		return flag;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

}
