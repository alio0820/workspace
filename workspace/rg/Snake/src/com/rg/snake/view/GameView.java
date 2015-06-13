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
 * ��������Ϸ�Ľ����࣬Ҳ����Ϸ�������
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
		this.setTitle("̰����V1.0");
		this.setLocation(START_X, START_Y);
		
		//��ӹرմ��ڵ��¼�����
		this.addWindowListener(new WindowAdapter() {

			public void windowClosing(WindowEvent e) {
				System.exit(0);
			}
			
		});
		
		//��ʼ����Ϸ������
		initGame();
		
		//��ֹ���ڱ����
		this.setResizable(false);
		//��Ӽ��̼����¼�
		this.addKeyListener(new KeyMonitor());
		this.setVisible(true);
		
		//������Ϸ
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
	 * ��Ϸ���߳��࣬������Ϸ������
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
	 * �����Ǽ��̵ļ����࣬�������̵�����
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
