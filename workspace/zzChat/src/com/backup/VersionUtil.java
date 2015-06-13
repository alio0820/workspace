package com.backup;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Cursor;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.awt.Font;
import java.awt.Point;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseMotionAdapter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.swing.BorderFactory;
import javax.swing.ImageIcon;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.SwingConstants;
import javax.swing.border.LineBorder;

import com.newworld.view.ImagePanel;

public class VersionUtil {
	private Map<String, String> feaMap = null;
	 private Point oldP;//上一次坐标,拖动窗口时用
	 private TipWindow tw = null;//提示框 
	 private ImageIcon img = null;//背景图图像组件
	 private JLabel imgLabel = null; //背景图片标签
	 private JPanel headPan = null;//头像组件
	 private ImageIcon headImg = null;//头像图片标签
	 private JPanel headImgLabel = null;
	 private JPanel feaPan =null;//添加上线信息
	 private JLabel title = null;
	 private JLabel head = null;
	 private JLabel close = null;//关闭按钮
	 private JTextArea feature = null; 
	 private JLabel releaseLabel = null;
	 private SimpleDateFormat sdf=null;
	 private String path;
	 private String friendNoteName;
	 
	 
	 public VersionUtil(String img,String friendNoteName){
	  {
		  sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		  feaMap = new HashMap<String, String>();
		  feaMap.put("name", "NewWorld.zzChat");
		  feaMap.put("release", sdf.format(new Date()));
		  feaMap.put("feature", "    "+friendNoteName+"\n    上线了");
	  }
	  this.path = img;
	  this.friendNoteName = friendNoteName;
	  init(); 
	  tw.setAlwaysOnTop(true);    
	  tw.setUndecorated(true);
	  tw.setResizable(false);
	  tw.setVisible(true);
	  tw.run();
	}
	 public void init(){
	  //新建300x220的消息提示框
	  tw = new TipWindow(300,220);
	  img = new ImageIcon("image/bb.png");//背景头像
	  imgLabel = new JLabel(img);
	  
//	  try {
//		headImg = new ImageIcon(path);//上线用户头像
//	 } catch (Exception e1) {
//		e1.printStackTrace();
//	 }
	 
	  headImgLabel = new ImagePanel(path);
	  
	  //设置各个面板的布局以及面板中控件的边界
//	   headPan = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
//       feaPan = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
   
	  headPan = new JPanel();
      feaPan = new JPanel();
      feaPan.setBounds(0, 0, 320, 100);
      feaPan.setBounds(0, 100, 320, 100);
	  title = new JLabel("上线提醒");
	  head = new JLabel(feaMap.get("name"));
	  close = new JLabel(" x");//关闭按钮
	  feature = new JTextArea(feaMap.get("feature")); 
	  releaseLabel = new JLabel("登录  " + feaMap.get("release"));  
	  
	  // 将各个面板设置为透明，否则看不到背景图片
	  ((JPanel) tw.getContentPane()).setOpaque(false);
	  headPan.setOpaque(false);
      feaPan.setOpaque(false);
      feature.setOpaque(false);
      
	  //设置JDialog的整个背景图片
	  tw.getLayeredPane().add(imgLabel, new Integer(Integer.MIN_VALUE));
	  imgLabel.setBounds(0,0, 300,220);
	  headPan.setPreferredSize(new Dimension(300, 220));//300
	  
	  //设置头像图片
	  headImgLabel.setBorder(new LineBorder(Color.red));
	  headImgLabel.setPreferredSize(new Dimension(100,100));
	  headImgLabel.setBounds(10,200,100, 100);
	  feaPan.add(headImgLabel);
//	  feaPan.setBounds(0, 0, 100, 100);
	  //设置提示框的边框,宽度和颜色
	  tw.getRootPane().setBorder(BorderFactory.createMatteBorder(1, 1, 1, 1, Color.gray));
	  
	  title.setPreferredSize(new Dimension(260, 26));//260
	  title.setVerticalTextPosition(JLabel.CENTER);
	  title.setHorizontalTextPosition(JLabel.CENTER);
	  title.setFont(new Font("宋体", Font.PLAIN, 12));
	  title.setForeground(Color.black);

	  
	  close.setFont(new Font("Arial", Font.BOLD, 15));
	  close.setPreferredSize(new Dimension(20, 20));
	  close.setVerticalTextPosition(JLabel.CENTER);
	  close.setHorizontalTextPosition(JLabel.CENTER);
	  close.setCursor(new Cursor(12));
	  close.setToolTipText("关闭");

	  
	  head.setPreferredSize(new Dimension(250, 35));//250
	  head.setVerticalTextPosition(JLabel.CENTER);
	  head.setHorizontalTextPosition(JLabel.CENTER);
	  head.setFont(new Font("宋体", Font.PLAIN, 15));
	  head.setForeground(Color.BLUE);

	  
	  feature.setEditable(false);
	  feature.setForeground(Color.black);
	  feature.setFont(new Font("宋体", Font.PLAIN, 13));
	  feature.setBackground(Color.white);//184 230 172
	  //设置文本域自动换行
	  feature.setLineWrap(true);
	  
	  releaseLabel.setForeground(Color.DARK_GRAY);
	  releaseLabel.setFont(new Font("宋体", Font.PLAIN, 12));
	  
	  headPan.add(title);
	  headPan.add(close);
	  headPan.add(head);
	  feaPan.add(feature);
	  headPan.add(releaseLabel);
	  headPan.add(feaPan);
	
	  tw.add(headPan, BorderLayout.NORTH);
	  
	  //增加鼠标拖动事件
	  title.addMouseMotionListener(new MouseMotionAdapter(){
	   public void mouseDragged(MouseEvent e) {
	    // TODO Auto-generated method stub
	   Point newP = new Point(e.getXOnScreen(), e.getYOnScreen());   
	    int x = tw.getX() + (newP.x - oldP.x);
	    int y = tw.getY() + (newP.y - oldP.y);
	    tw.setLocation(x, y);
	    oldP=newP;
	    
	   }   
	  });
	  //鼠标按下时初始坐标,供拖动时计算用
	  title.addMouseListener(new MouseAdapter() { 
	   public void mousePressed(MouseEvent e) {
	    oldP = new Point(e.getXOnScreen(), e.getYOnScreen());
	   }
	  });
	  
	  //右上角关闭按钮事件
	  close.addMouseListener(new MouseAdapter() {
	   public void mouseClicked(MouseEvent e) {
	    tw.close();
	   }

	   public void mouseEntered(MouseEvent e) {
	    close.setBorder(BorderFactory.createLineBorder(Color.gray));
	   }

	   public void mouseExited(MouseEvent e) {
	    close.setBorder(null);
	   }
	  });

	 }
	 public static void main(String args[]) {
	  ImageIcon img = new ImageIcon("image/rabbit1.jpg");
	  String path = "image/rabbit1.jpg";
	  String friendNoteName = "刺青";
	  new VersionUtil(path,friendNoteName);
	 }


}
