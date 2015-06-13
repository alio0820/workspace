import java.io.*;
import java.util.Scanner;
public class MainClass{
	public static void main(String[] args) throws IOException{
		int userCmd;
		String fileUrl="",secretKey="";
		MainClass.outWelcomeWord();
		Scanner sca=new Scanner(System.in);
		userCmd=sca.nextInt();
		
		while (userCmd!=0){
			if (userCmd==1){
				System.out.println("��������Ҫ���ܵ��ļ��ľ���·����");
				fileUrl=sca.next();
				while (!(new File(fileUrl).exists())) {
					System.out.println("�ļ������ڣ����������룺");
					fileUrl=sca.next();
				}
				System.out.println("��������Կ��");
				secretKey=sca.next();
				MainClass.encryptFile(fileUrl, secretKey);
			}
			else if (userCmd==2){
				System.out.println("��������Ҫ���ܵ��ļ��ľ���·����");
				fileUrl=sca.next();
				while (!(new File(fileUrl).exists())) {
					System.out.println("�ļ������ڣ����������룺");
					fileUrl=sca.next();
				}
				System.out.println("��������Կ��");
				secretKey=sca.next();
				MainClass.unEncryptFile(fileUrl, secretKey);
			}
			else System.out.println(userCmd+"   δʶ���������������룺");
			userCmd=sca.nextInt();
				
			}
		System.out.println("��лʹ��S-encrypt-tool!^_^")	;
	}
	public static void outWelcomeWord(){
		System.out.println("--------------------��ӭʹ�� S-encrypt-tool--------------------");
		System.out.println("�����������  1   ����   2   ����   0  �˳�");
		
		System.out.println("  ");
		System.out.println("��ʾ                     *�����ļ�����ֻ֧�ֳ������š����֡�Ӣ��");
		System.out.println("            *���ܻ�ɾ��ԭ�ļ������μǼ�����Կ");
		System.out.println("            *���ܻ���ܳɹ�����ԭ�ļ���ͬ·����������ԭ�ļ��������Ƶ��ļ�");
		System.out.println("            *������������ļ�����·������֧�����·��");
		System.out.println("            *��Կ֧�ֳ������š����֡�Ӣ�ġ�����");
	}
	public static void encryptFile(String fileUrl,String secretKey) throws IOException{
		BufferedReader in=new BufferedReader(new FileReader(fileUrl));
		String newFile=fileUrl.substring(0,fileUrl.lastIndexOf('/')+1)+"���Ѽ��ܵģ�"+fileUrl.substring(fileUrl.lastIndexOf('/')+1,fileUrl.length());//��ʱ�����ļ�
		File tempFile=new File(newFile);
		if (!tempFile.exists()) tempFile.createNewFile();
		File oldFile=new File(fileUrl);
		PrintWriter output=new PrintWriter(tempFile);
		StringBuffer tempStr;
		while (in.ready()){
			tempStr=new StringBuffer(in.readLine());
			char tempChar='a';
			for (int i=0,j=0;i<tempStr.length();i++,j++){
				tempChar=(char)((int)(tempStr.charAt(i))+(int)(secretKey.charAt(j)));
				tempStr.setCharAt(i,tempChar);
				if (j==secretKey.length()-1) j=-1;
				}
			output.println(tempStr);
		}
		System.out.print("������ɣ�");
		if (oldFile.delete())System.out.println("    ԭ�ļ�ɾ���ɹ�");
		else System.out.println("     ԭ�ļ�ɾ��ʧ��,����Ҫ���ֶ�ɾ����");
		in.close();
		output.close();
	}
	public static void unEncryptFile(String fileUrl,String secretKey) throws IOException{
		BufferedReader in=new BufferedReader(new FileReader(fileUrl));
		String newFile=fileUrl.substring(0,fileUrl.lastIndexOf('/')+1)+"���ѽ��ܵģ�"+fileUrl.substring(fileUrl.lastIndexOf('/')+1,fileUrl.length());//��ʱ�����ļ�
		File tempFile=new File(newFile);
		if (!tempFile.exists()) tempFile.createNewFile();
		PrintWriter output=new PrintWriter(tempFile);
		StringBuffer tempStr;
		while (in.ready()){
			tempStr=new StringBuffer(in.readLine());
			char tempChar='a';
			for (int i=0,j=0;i<tempStr.length();i++,j++){
				tempChar=(char)((int)(tempStr.charAt(i))-(int)(secretKey.charAt(j)));
				tempStr.setCharAt(i,tempChar);
				if (j==secretKey.length()-1) j=-1;
				}
			output.println(tempStr);
		}
		System.out.println("������ɣ�ע��鿴�����ļ���");
		in.close();
		output.close();
	}
	
}