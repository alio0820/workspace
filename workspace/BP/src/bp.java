import javax.swing.DefaultListModel;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JList;
import javax.swing.ListSelectionModel;


public class bp extends JFrame{
public bp(){
	// �б�ģ�ͣ����Ԫ��
    DefaultListModel listModel = new DefaultListModel();
    ImageIcon icon1 = new ImageIcon("images/b.png");
    ImageIcon icon2 = new ImageIcon("images/run.png");
    ImageIcon icon3 = new ImageIcon("images/tz.png");
    listModel.addElement(icon1);
    listModel.addElement(icon2);
    listModel.addElement(icon3);
    // ����ģ��ʵ����JList
    final JList pictureList = new JList(listModel);
    // ����JList��ѡ����
    pictureList
      .setSelectionMode(ListSelectionModel.SINGLE_INTERVAL_SELECTION);
    // Ԫ��ˮƽ��ʾ
    pictureList.setLayoutOrientation(JList.HORIZONTAL_WRAP);
    // Ԫ���Զ�����
    pictureList.setVisibleRowCount(-1);
    // JList�������������Ҫ������ӵ�������
    final JFrame jf1 = new JFrame();
    jf1.setLocationRelativeTo(null);
    jf1.setSize(96 * 4 + 30, 192 + 50);
    jf1.getContentPane().add(pictureList);
    jf1.setUndecorated(true);// ȥ�߿򣬵��÷���������
    jf1.setVisible(true);
    pictureList.setBounds(0, 0, 96 * 4 + 20, 192 + 50);

}
public static void main(String[] args) {
	new bp();
}
}
