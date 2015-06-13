package com.mail;
import java.io.BufferedReader;  
import java.io.InputStreamReader;  
import java.util.Properties;  
 
import javax.mail.Flags;  
import javax.mail.Folder;  
import javax.mail.Message;  
import javax.mail.Session;  
import javax.mail.Store;  
import javax.mail.internet.MimeUtility;
import javax.mail.search.AndTerm;  
import javax.mail.search.FromStringTerm;  
import javax.mail.search.SearchTerm;  
import javax.mail.search.SubjectTerm;  
 
/**  
 * ʹ�� java.mail.search ���е� SearchTerm ��  
 * �ڽ����ʼ�ʱ�����������������  
 * @author haolloyin  
 */ 
public class SearchMails {  
    public static void main(String[] args) throws Exception {  
        // ����pop3����������������Э�顢�û���������  
        String pop3Server = "pop3.163.com";  
        String protocol = "pop3";  
        String user = "wangjiuyingzui@163.com";  
        String pwd = "xingye";  
          
        // ����һ���о���������Ϣ��Properties����  
        Properties props = new Properties();  
        props.setProperty("mail.store.protocol", protocol);  
        props.setProperty("mail.pop3.host", pop3Server);  
          
        // ʹ��Properties������Session����  
        Session session = Session.getInstance(props);  
        session.setDebug(true);  
          
        // ����Session������Store���󣬲�����pop3������  
        Store store = session.getStore();  
        store.connect(pop3Server, user, pwd);  
          
        // ��������ڵ��ʼ���Folder������"��-д"��  
        Folder folder = store.getFolder("inbox");  
        folder.open(Folder.READ_WRITE);  
          
          
        // ����������Ϊ test_hao@sina.cn ������Ϊ"����1"���ʼ�  
        SearchTerm st = new AndTerm(  
                new FromStringTerm("450383731@qq.com"),  
                new SubjectTerm("web��ҳ����"));  
          
//      // ����ʼ���Folder�ڵ������ʼ�Message����  
//      Message [] messages = folder.getMessages();  
          
        // ��������������ֱ�ӷ��������ʼ�������ʹ��Folder.search()����  
        Message [] messages = folder.search(st);  
        int mailCounts = messages.length;  
        System.out.println("�������˵�" + mailCounts + " ������������ʼ���");  
          
        for(int i = 0; i < mailCounts; i++) {  
              
            String subject = messages[i].getSubject();  
            String from = (messages[i].getFrom()[0]).toString();  
            if(subject.startsWith("=?GB")||subject.startsWith("=?gb")){   
            	subject=MimeUtility.decodeText(subject);   
            }
            if(from.startsWith("=?GB")||from.startsWith("=?gb")){   
            	from=MimeUtility.decodeText(from);
            }
            System.out.println("�� " + (i+1) + "���ʼ������⣺" + subject);  
            System.out.println("�� " + (i+1) + "���ʼ��ķ����˵�ַ��" + from);  
              
            System.out.println("�Ƿ�ɾ�����ʼ�(yes/no)?��");  
            BufferedReader br = new BufferedReader(new InputStreamReader(System.in));  
            String input = br.readLine();  
            if("yes".equalsIgnoreCase(input)) {  
                // ֱ�����������̨��  
//              messages[i].writeTo(System.out);  
                // ����ɾ����ǣ�һ��Ҫ�ǵõ���saveChanges()����  
                messages[i].setFlag(Flags.Flag.DELETED, true);  
                messages[i].saveChanges();  
                System.out.println("�ɹ�������ɾ����ǣ�");  
            }             
        }  
        // �ر�����ʱ������ɾ����ǵ��ʼ��Żᱻ����ɾ�����൱��"QUIT"����  
        folder.close(false);  
        store.close();  
    }  
}