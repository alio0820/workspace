package com.mail;
import java.io.BufferedReader;  
import java.io.InputStreamReader;  
import java.util.Properties;  
  
import javax.mail.Flags;  
import javax.mail.Flags.Flag;
import javax.mail.Folder;  
import javax.mail.Message;  
import javax.mail.Session;  
import javax.mail.Store;  
import javax.mail.internet.MimeUtility;  
  
import com.sun.mail.imap.IMAPMessage;  
  
/** 
 * <b>ʹ��IMAPЭ������ʼ�</b><br/> 
 * <p>POP3��IMAPЭ�������:</p> 
 * <b>POP3</b>Э����������ʼ��ͻ������ط������ϵ��ʼ�,�����ڿͻ��˵Ĳ���(���ƶ��ʼ�������Ѷ���)�����ᷴ�����������ϣ�<br/> 
 * ����ͨ���ͻ�����ȡ�������е�3���ʼ����ƶ��������ļ��У�����������ϵ���Щ�ʼ���û��ͬʱ���ƶ��ġ�<br/> 
 * <p><b>IMAP</b>Э���ṩwebmail������ʼ��ͻ���֮���˫��ͨ�ţ��ͻ��˵Ĳ�������ͬ����Ӧ���������ϣ����ʼ����еĲ��������� 
 * �ϵ��ʼ�Ҳ������Ӧ�Ķ����������ڿͻ�����ȡ�������е�3���ʼ�����������һ����Ϊ�Ѷ���������������Ϊɾ������Щ������ 
 * ��ʱ�������������ϡ�</p> 
 * <p>����Э����ȣ�IMAP ������Ϊ�û�������Ϊ��ݺͿɿ������顣POP3���׶�ʧ�ʼ�����������ͬ���ʼ�����IMAPͨ���ʼ��ͻ��� 
 * ��webmail֮���˫��ͬ�����ܺܺõر�������Щ���⡣</p> 
 */  
public class IMAPReceiveMail{  
  
    public static void main(String[] args) throws Exception {  
        // ׼�����ӷ������ĻỰ��Ϣ  
        Properties props = new Properties();  
        props.setProperty("mail.store.protocol", "imap");  
        props.setProperty("mail.imap.host", "imap.163.com");  
        props.setProperty("mail.imap.port", "143");  
          
        // ����Sessionʵ������  
        Session session = Session.getInstance(props);  
          
        // ����IMAPЭ���Store����  
        Store store = session.getStore("imap");  
          
        // �����ʼ�������  
        store.connect("wangjiuyingzui@163.com", "xingye");  
          
        // ����ռ���  
        Folder folder = store.getFolder("INBOX");  
        // �Զ�дģʽ���ռ���  
        folder.open(Folder.READ_WRITE);  
          
        // ����ռ�����ʼ��б�  
        Message[] messages = folder.getMessages();  
          
        // ��ӡ��ͬ״̬���ʼ�����  
        System.out.println("�ռ����й�" + messages.length + "���ʼ�!");  
        System.out.println("�ռ����й�" + folder.getUnreadMessageCount() + "��δ���ʼ�!");  
        System.out.println("�ռ����й�" + folder.getNewMessageCount() + "�����ʼ�!");  
        System.out.println("�ռ����й�" + folder.getDeletedMessageCount() + "����ɾ���ʼ�!");  
          
        System.out.println("------------------------��ʼ�����ʼ�----------------------------------");  
          
        // �����ʼ�  
        for (Message message : messages) {  
            IMAPMessage msg = (IMAPMessage) message;  
            String subject = MimeUtility.decodeText(msg.getSubject());
            // ɾ���ʼ�  
            // msg.setFlag(Flags.Flag.DELETED, true); 
            //pop3û���ж��ʼ��Ƿ�Ϊ�Ѷ��Ĺ��ܣ�Ҫʹ��Imap�ſ���
            String status;
            Flags flags = msg.getFlags(); 
            if (flags.contains(Flags.Flag.SEEN)) 
                status = "�Ѷ�"; 
            else { 
                status = "δ��"; 
            }
            System.out.println("[" + subject + "]"+status+"���Ƿ���Ҫ�Ķ����ʼ���yes/no����");  
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));  
            String answer = reader.readLine();  
            if ("yes".equalsIgnoreCase(answer)) {  
                POP3ReceiveMailTest.parseMessage(msg);  // �����ʼ�  
                // �ڶ��������������Ϊtrue�����޸ķ�������������false�򲻷�����������  
                msg.setFlag(Flag.SEEN, true);   //�����Ѷ���־  
            }  
        }  
          
        // �ر���Դ  
        folder.close(false);  
        store.close();  
    }  
}  