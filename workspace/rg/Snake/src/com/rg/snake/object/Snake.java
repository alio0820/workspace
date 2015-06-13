package com.rg.snake.object;

import java.awt.Color;
import java.awt.Graphics;
import java.awt.event.KeyEvent;
import java.util.LinkedList;

import com.rg.snake.view.GameView;

/**
 * 该类是蛇的对象
 * @author GuLangxiangjie
 *
 */

public class Snake {
	
	public static final int BODY_SIZE = 20;
	public static final int TO_UP = 1;
	public static final int TO_DOWN = -1;
	public static final int TO_LEFT = 2;
	public static final int TO_RIGHT = -2;
	
	private int x;//蛇头的横坐标
	private int y;//蛇头的尾坐标
	private Body b;
	private int direction;//蛇前进的方向
	private int newDirection;//键盘按下的方向
	private LinkedList<Body> body = new LinkedList<Body>();//蛇的身体
	private GameView gameView;
	
	public Snake(GameView gameView){
		//清空蛇的所有节点
		body.clear();
		x = 20 * BODY_SIZE;
		y = 15 * BODY_SIZE;
		//构造一个三个节点的蛇，蛇头的方向向右
		for(int i = 0; i < 3; i++){
			Body b = new Body(x -= BODY_SIZE, y);
			body.add(b);
		}
		//设置蛇前进的方向
		direction = TO_RIGHT;
		this.gameView = gameView;
	}
	
	public void move(){
		x = body.getFirst().getX();
		y = body.getFirst().getY();
		switch(direction){
		case TO_UP:
			if(y - BODY_SIZE < 0){
				y = GameView.WINDOW_HEIGHT - BODY_SIZE;
			} else {
				y -= BODY_SIZE;
			}
			break;
		case TO_DOWN:
			if(y + BODY_SIZE * 2 > GameView.WINDOW_HEIGHT){
				y = BODY_SIZE;
			} else {
				y += BODY_SIZE;
			}
			break;
		case TO_LEFT:
			if(x - BODY_SIZE < 0){
				x = GameView.WINDOW_WIDTH - BODY_SIZE;
			} else {
				x -= BODY_SIZE;
			}
			break;
		case TO_RIGHT:
			if(x + BODY_SIZE * 2 > GameView.WINDOW_WIDTH){
				x = 0;
			} else {
				x += BODY_SIZE;
			}
			break;
		}
		doMove(x, y);
//		System.out.println("x = " + x + ", y = " + y);
//		System.out.println("direction = " + direction);
	}
	
	private void doMove(int x, int y){
		b = new Body();
		b.setX_Y(x, y);
		addHead(b);
		deleteTail();
	}
	
	public void addHead(Body b){
		body.addFirst(b);
	}
	
	public void deleteTail(){
		this.body.removeLast();
	}
	
	public Body getHead(){
		return this.body.getFirst();
	}
	
	public Body getTail(){
		return this.body.getLast();
	}
	
	public boolean canEat(Food food){
		boolean flag = false;
		if(this.x == food.getX() && this.y == food.getY()){
			flag = true;
		}
		return flag;
	}
	
	public void eat(Food food){
		switch(direction){
		case TO_UP:
			if(y - BODY_SIZE < 0){
				y = GameView.WINDOW_HEIGHT - BODY_SIZE;
			} else {
				y -= BODY_SIZE;
			}
			break;
		case TO_DOWN:
			if(y + BODY_SIZE * 2 > GameView.WINDOW_HEIGHT){
				y = BODY_SIZE;
			} else {
				y += BODY_SIZE;
			}
			break;
		case TO_LEFT:
			if(x - BODY_SIZE < 0){
				x = GameView.WINDOW_WIDTH - BODY_SIZE;
			} else {
				x -= BODY_SIZE;
			}
			break;
		case TO_RIGHT:
			if(x + BODY_SIZE * 2 > GameView.WINDOW_WIDTH){
				x = 0;
			} else {
				x += BODY_SIZE;
			}
			break;
		}
		doEat(x, y);
		food.setEat(true);
	}
	
	private void doEat(int x, int y){
		b = new Body();
		b.setX_Y(x, y);
		addHead(b);
	}
	
	public boolean isHitStone(Stone stone){
		boolean flag = false;
		if(this.x == stone.getX() && this.y == stone.getY()){
			flag = true;
		}
		return flag;
	}
	
	public void die(){
		gameView.gameOver();
	}
	
	public void drawMe(Graphics g){
		/*for(Body b : body){
			b.drawHead(g);
		}*/
		body.getFirst().drawHead(g);
		for(int i = 1; i < body.size(); i++){
			body.get(i).drawBody(g);
		}
	}
	
	/**
	 * 该类是蛇的身体节点
	 * @author GuLangxiangjie
	 *
	 */
	public class Body{
		private int x;//身体节点的横坐标
		private int y;//身体节点的纵坐标
		private int size;//蛇身节点的大小
		
		public Body(){
			x = 0;
			y = 0;
			size = BODY_SIZE;
		}
		
		public Body(int x, int y){
			this.x = x;
			this.y = y;
			size = BODY_SIZE;
		}
		
		public void drawBody(Graphics g){
			Color c = g.getColor();
			g.setColor(Color.BLUE);
			g.fill3DRect(x, y, size, size, true);
			g.setColor(c);
		}
		
		public void drawHead(Graphics g){
			Color c = g.getColor();
			g.setColor(Color.RED);
			g.fill3DRect(x, y, size, size, true);
			g.setColor(c);
		}
		
		public void setX_Y(int x, int y){
			this.x = x;
			this.y = y;
		}
		
		public int getX(){
			return this.x;
		}
		
		public int getY(){
			return this.y;
		}
	}
	
	/**
	 * 处理键盘的按下事件
	 * @param e
	 */
	public void keyPressed(KeyEvent e){
		switch(e.getKeyCode()){
		case KeyEvent.VK_UP:
			newDirection = TO_UP;
			break;
		case KeyEvent.VK_DOWN:
			newDirection = TO_DOWN;
			break;
		case KeyEvent.VK_LEFT:
			newDirection = TO_LEFT;
			break;
		case KeyEvent.VK_RIGHT:
			newDirection = TO_RIGHT;
			break;
		}
	}
	
	/**
	 * 处理键盘的松开事件
	 * @param e
	 */
	public void keyReleased(KeyEvent e){
		if(newDirection + direction != 0){
			direction = newDirection;
		}
	}
	
}
