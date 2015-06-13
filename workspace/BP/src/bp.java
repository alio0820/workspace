import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.ListSelectionModel;


public class bp extends JFrame{
public bp(){
	// 列表模型，添加元素
    DefaultListModel listModel = new DefaultListModel();
    ImageIcon icon1 = new ImageIcon("images/b.png");
    ImageIcon icon2 = new ImageIcon("images/run.png");
    ImageIcon icon3 = new ImageIcon("images/tz.png");
    listModel.addElement(icon1);
    listModel.addElement(icon2);
    listModel.addElement(icon3);
    // 根据模型实例化JList
    final JList pictureList = new JList(listModel);
    // 设置JList单选属性
    pictureList
      .setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
    // 元素水平显示
    pictureList.setLayoutOrientation(JList.HORIZONTAL_WRAP);
    // 元素自动换行
    pictureList.setVisibleRowCount(-1);
    // JList是轻量级组件，要把它添加到窗体上
    final JFrame jf1 = new JFrame();
    jf1.setLocationRelativeTo(null);
    jf1.setSize(96 * 4 + 30, 192 + 50);
    jf1.getContentPane().add(pictureList);
    jf1.setUndecorated(true);// 去边框，调用方法就行了
    jf1.setVisible(true);
    pictureList.setBounds(0, 0, 96 * 4 + 20, 192 + 50);

}
public static void main(String[] args) {
	new bp();
}
}
