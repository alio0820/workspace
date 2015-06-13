package com.rg.snake.object;

import java.awt.Color;
import java.awt.Graphics;

/**
 * 该类是游戏的食物类
 * @author GuLangxiangjie
 *
 */

public class Food {
	
	private int x;
	private int y;
	private int size;
	private boolean isEat = false;
	
	public Food(){
		this.size = Snake.BODY_SIZE;
	}
	
	public Food(int x, int y){
		this.size = Snake.BODY_SIZE;
		this.x = x * size;
		this.y = y * size;
	}
	
	public void drawMe(Graphics g){
		if(!isEat){
			Color c = g.getColor();
			g.setColor(Color.GREEN);
			g.fill3DRect(x, y, size, size, true);
			g.setColor(c);
		}
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

	public boolean isEat() {
		return isEat;
	}

	public void setEat(boolean isEat) {
		this.isEat = isEat;
	}

}
