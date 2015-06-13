package com.rg.snake.view;

import java.awt.Frame;
import java.awt.Graphics;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import com.rg.snake.object.Food;
import com.rg.snake.object.Map;
import com.rg.snake.object.Snake;

/**
 * 该类是游戏的界面类，也是游戏的入口类
 * @author GuLangxiangjie
 *
 */

@SuppressWarnings("serial")
public class GameView extends Frame{
	
	public static int WINDOW_WIDTH = 800;
	public static int WINDOW_HEIGHT = 600;
	public static int START_X = 200;
	public static int START_Y = 100;
	
	private Snake snake;
	private Food food;
	private List<Food> foods = new ArrayList<Food>();
	private Map map;
	private GameThread gameThread;
	
	private void lauchGame(){
		this.setSize(WINDOW_WIDTH, WINDOW_HEIGHT);
		this.setTitle("贪吃蛇V1.0");
		this.setLocation(START_X, START_Y);
		
		//添加关闭窗口的事件监听
		this.addWindowListener(new WindowAdapter() {

			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
			
		});
		
		//初始化游戏的数据
		initGame();
		
		//禁止窗口被最大化
		this.setResizable(false);
		//添加键盘监听事件
		this.addKeyListener(new KeyMonitor());
		this.setVisible(true);
		
		//启动游戏
		gameThread.setFlag(true);
		gameThread.start();
	}
	
	public void initGame(){
		snake = new Snake(this);
		food = new Food(20, 20);
		foods.add(food);
		map = new Map();
		gameThread = new GameThread();
	}
	
	public void paint(Graphics g) {
		snake.drawMe(g);
		foods.get(0).drawMe(g);
		map.drawMe(g);
	}
	
	public void playGame(){
		snake.move();
		if(snake.canEat(foods.get(0))){
			snake.eat(foods.get(0));
		}
		if(foods.get(0).isEat()){
			createFood();
		}
		if(map.isSnakeHitStone(snake)){
			snake.die();
		}
	}
	
	public void gameOver(){
		gameThread.setFlag(false);
	}
	
	public void createFood(){
		Random r = new Random();
		int x = r.nextInt(GameView.WINDOW_WIDTH / Snake.BODY_SIZE);
		int y = r.nextInt(GameView.WINDOW_HEIGHT / Snake.BODY_SIZE);
		Food f = new Food(x, y);
		f.setEat(false);
		foods.add(f);
		foods.remove(0);
	}

	public static void main(String[] args) {
		new GameView().lauchGame();
	}
	
	/**
	 * 游戏的线程类，控制游戏的运行
	 * @author GuLangxiangjie
	 *
	 */
	private class GameThread extends Thread{
		
		private int sleepSpan = 500;
		private boolean flag;
		
		public void setFlag(boolean flag){
			this.flag = flag;
		}
		
		public void run(){
			while(flag){
				repaint();
				playGame();
				try {
					Thread.sleep(sleepSpan);
				} catch (InterruptedException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	/**
	 * 该类是键盘的监听类，监听键盘的输入
	 * @author GuLangxiangjie
	 *
	 */
	private class KeyMonitor extends KeyAdapter{

		public void keyPressed(KeyEvent e) {
			snake.keyPressed(e);
		}

		public void keyReleased(KeyEvent e) {
			snake.keyReleased(e);
		}
		
	}
	
}
