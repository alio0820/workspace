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
	 private Point oldP;//��һ������,�϶�����ʱ��
	 private TipWindow tw = null;//��ʾ�� 
	 private ImageIcon img = null;//����ͼͼ�����
	 private JLabel imgLabel = null; //����ͼƬ��ǩ
	 private JPanel headPan = null;//ͷ�����
	 private ImageIcon headImg = null;//ͷ��ͼƬ��ǩ
	 private JPanel headImgLabel = null;
	 private JPanel feaPan =null;//���������Ϣ
	 private JLabel title = null;
	 private JLabel head = null;
	 private JLabel close = null;//�رհ�ť
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
		  feaMap.put("feature", "    "+friendNoteName+"\n    ������");
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
	  //�½�300x220����Ϣ��ʾ��
	  tw = new TipWindow(300,220);
	  img = new ImageIcon("image/bb.png");//����ͷ��
	  imgLabel = new JLabel(img);
	  
//	  try {
//		headImg = new ImageIcon(path);//�����û�ͷ��
//	 } catch (Exception e1) {
//		e1.printStackTrace();
//	 }
	 
	  headImgLabel = new ImagePanel(path);
	  
	  //���ø������Ĳ����Լ�����пؼ��ı߽�
//	   headPan = new JPanel(new FlowLayout(FlowLayout.CENTER, 0, 0));
//       feaPan = new JPanel(new FlowLayout(FlowLayout.LEFT, 0, 0));
   
	  headPan = new JPanel();
      feaPan = new JPanel();
      feaPan.setBounds(0, 0, 320, 100);
      feaPan.setBounds(0, 100, 320, 100);
	  title = new JLabel("��������");
	  head = new JLabel(feaMap.get("name"));
	  close = new JLabel(" x");//�رհ�ť
	  feature = new JTextArea(feaMap.get("feature")); 
	  releaseLabel = new JLabel("��¼  " + feaMap.get("release"));  
	  
	  // �������������Ϊ͸�������򿴲�������ͼƬ
	  ((JPanel) tw.getContentPane()).setOpaque(false);
	  headPan.setOpaque(false);
      feaPan.setOpaque(false);
      feature.setOpaque(false);
      
	  //����JDialog����������ͼƬ
	  tw.getLayeredPane().add(imgLabel, new Integer(Integer.MIN_VALUE));
	  imgLabel.setBounds(0,0, 300,220);
	  headPan.setPreferredSize(new Dimension(300, 220));//300
	  
	  //����ͷ��ͼƬ
	  headImgLabel.setBorder(new LineBorder(Color.red));
	  headImgLabel.setPreferredSize(new Dimension(100,100));
	  headImgLabel.setBounds(10,200,100, 100);
	  feaPan.add(headImgLabel);
//	  feaPan.setBounds(0, 0, 100, 100);
	  //������ʾ��ı߿�,��Ⱥ���ɫ
	  tw.getRootPane().setBorder(BorderFactory.createMatteBorder(1, 1, 1, 1, Color.gray));
	  
	  title.setPreferredSize(new Dimension(260, 26));//260
	  title.setVerticalTextPosition(JLabel.CENTER);
	  title.setHorizontalTextPosition(JLabel.CENTER);
	  title.setFont(new Font("����", Font.PLAIN, 12));
	  title.setForeground(Color.black);

	  
	  close.setFont(new Font("Arial", Font.BOLD, 15));
	  close.setPreferredSize(new Dimension(20, 20));
	  close.setVerticalTextPosition(JLabel.CENTER);
	  close.setHorizontalTextPosition(JLabel.CENTER);
	  close.setCursor(new Cursor(12));
	  close.setToolTipText("�ر�");

	  
	  head.setPreferredSize(new Dimension(250, 35));//250
	  head.setVerticalTextPosition(JLabel.CENTER);
	  head.setHorizontalTextPosition(JLabel.CENTER);
	  head.setFont(new Font("����", Font.PLAIN, 15));
	  head.setForeground(Color.BLUE);

	  
	  feature.setEditable(false);
	  feature.setForeground(Color.black);
	  feature.setFont(new Font("����", Font.PLAIN, 13));
	  feature.setBackground(Color.white);//184 230 172
	  //�����ı����Զ�����
	  feature.setLineWrap(true);
	  
	  releaseLabel.setForeground(Color.DARK_GRAY);
	  releaseLabel.setFont(new Font("����", Font.PLAIN, 12));
	  
	  headPan.add(title);
	  headPan.add(close);
	  headPan.add(head);
	  feaPan.add(feature);
	  headPan.add(releaseLabel);
	  headPan.add(feaPan);
	
	  tw.add(headPan, BorderLayout.NORTH);
	  
	  //��������϶��¼�
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
	  //��갴��ʱ��ʼ����,���϶�ʱ������
	  title.addMouseListener(new MouseAdapter() { 
	   public void mousePressed(MouseEvent e) {
	    oldP = new Point(e.getXOnScreen(), e.getYOnScreen());
	   }
	  });
	  
	  //���Ͻǹرհ�ť�¼�
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
	  String friendNoteName = "����";
	  new VersionUtil(path,friendNoteName);
	 }


}
