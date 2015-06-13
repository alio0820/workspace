package com.new_world.operation.snapshot;

import java.awt.AWTException;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Point;
import java.awt.Rectangle;
import java.awt.Robot;
import java.awt.Toolkit;
import java.awt.datatransfer.Clipboard;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.WindowAdapter;
import java.awt.event.WindowEvent;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.swing.JFrame;
import javax.swing.filechooser.FileSystemView;

 
	class RectD extends JFrame {
		private static final long serialVersionUID = 1L;
		private boolean isLine = true;//标记截图是否完成
		private Point startPoint = new Point();//开始点
		private Point lastPoint = new Point();//结束点
		int x,y,width,height;
		Dimension d=null;//获得屏幕大小
		BufferedImage image;
		Robot robot;
		private Font ok = new Font("Comic Sans MS", Font.BOLD | Font.ITALIC, 64);
		Graphics g;
		private int id;
		public RectD(int userId){
			this.id = userId;
		try {
		robot = new Robot();//在基本屏幕坐标系中构造一个 Robot对象
		d = Toolkit.getDefaultToolkit().getScreenSize();//获得屏幕大小
		} catch (AWTException e) {
		throw new RuntimeException();
		}
		image = robot.createScreenCapture(new Rectangle(0, 0,d.width,d.height));//获得整个屏幕
		setUndecorated(true);//设置无标题栏
		setExtendedState(JFrame.MAXIMIZED_BOTH);//设置最大化显示
		setResizable(false);//设置不可改变大小
		setAlwaysOnTop(true);//设置总是在顶层(最上层)
		//setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);//默认关闭方式
		setVisible(true);

		this.addWindowListener(new WindowAdapter() {
		public void windowDeactivated(WindowEvent e) {
			
			
			dispose();
		
		
		}
		public void windowIconified(WindowEvent e) {
		
		dispose();
		}
		});

		//添加鼠标事件
		this.addMouseMotionListener(new MouseMotionListener(){
		@Override
		public void mouseDragged(MouseEvent e) {
		// TODO Auto-generated method stub
		lastPoint.x = e.getX();
		lastPoint.y = e.getY();
		RectD.this.repaint();
		}
		@Override
		public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		lastPoint.x = e.getX();
		lastPoint.y = e.getY();
		RectD.this.repaint();
		}
		});

		this.addMouseListener(new MouseListener(){
		@Override
		public void mouseClicked(MouseEvent e) {//单击(双击)组件时调用
		// TODO Auto-generated method stub

		}
		@Override
		public void mouseEntered(MouseEvent e) {//进入组件时调用
		// TODO Auto-generated method stub

		}
		@Override
		public void mouseExited(MouseEvent e) {//离开组件时调用
		// TODO Auto-generated method stub

		}
		@Override
		public void mousePressed(MouseEvent e) {//在组件上按下鼠标按键时调用
		// TODO Auto-generated method stub
		if (e.getButton() == MouseEvent.BUTTON3) {//如果是右键按下则退出
			dispose();
		
		} else {//否则记录按下时坐标
		isLine = false;
		startPoint.x = e.getX();
		startPoint.y = e.getY();
		}
		}
		@Override
		public void mouseReleased(MouseEvent e) {//在组件上释放鼠标按钮时调用
		// TODO Auto-generated method stub
		isLine = true;
		if (e.getButton() == MouseEvent.BUTTON1) {
		x =Math.min(startPoint.x, lastPoint.x);
		y =Math.min(startPoint.y, lastPoint.y);
		width = Math.abs(lastPoint.x - startPoint.x);
		height = Math.abs(lastPoint.y - startPoint.y);
		if(width==0||height==0){
		return;
		}
		image = image.getSubimage(x, y, width, height);
		if(image!=null){
		saveToFile();//保存图片
		savePicture(image);
		}
		}
		}
		});
		}

		public void repaint() {
		g = this.getGraphics();
		if(g == null)
		return;
		g.drawImage(image, 0, 0, this);
		g.setColor(Color.red);
		if (!isLine) {//开始截图
		x = startPoint.x < lastPoint.x ? startPoint.x : lastPoint.x;
		y = startPoint.y < lastPoint.y ? startPoint.y : lastPoint.y;
		width = Math.abs(lastPoint.x - startPoint.x);
		height = Math.abs(lastPoint.y - startPoint.y);
		g.drawRoundRect(x, y, width, height, 4, 4);
		} else {//未截图时
		g.drawLine(0, lastPoint.y, d.width, lastPoint.y);
		g.drawLine(lastPoint.x, 0, lastPoint.x, d.height);
		}
		}
		//保存图片到桌面，图片名称格式为yyyymmddHHmmss.jpg
		public void saveToFile() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String name = sdf.format(new Date());//格式转化获得图片名
		System.out.println(name);
		File path = FileSystemView.getFileSystemView().getHomeDirectory();//获得桌面路径
		String format = "jpg";
		String str = String.valueOf(System.getProperty("user.dir"));
		str = str.replace("\\", "/");
		File f2 = new File(str +  "/" + String.valueOf(id) + "FilePath.txt");
		String imagePath = "D:/";
		if(!f2.exists()){
			try {
				f2.createNewFile();
				FileWriter fw = new FileWriter(f2);
				fw.write("D:/");
				fw.close();
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}else{
			try {
				BufferedReader br = new BufferedReader(new FileReader(str + "/" + id + "FilePath.txt"));
				imagePath = br.readLine();
			} catch (Exception e1) {
				System.out.println("文件不存在");
			}
		}
		
		
		
		File f = new File(imagePath + File.separator + name + "." + format);
		try {
		ImageIO.write(image, format, f);//生成图片
		} catch (IOException e) {//抛出异常
		e.printStackTrace();
		}
		}
		//保存截图到剪切板，显示"OK",退出程序
		public void savePicture(BufferedImage image) {
		Clipboard clip = Toolkit.getDefaultToolkit().getSystemClipboard();
		Graphics g = RectD.this.getGraphics();
		g.setColor(Color.RED);
		g.setFont(ok);
		g.drawString("OK", x + width / 3, y + height / 2 - 10);
		clip.setContents(new ImageChange(image), null);
		g.dispose();
		dispose();
		}
		}


