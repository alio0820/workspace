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
				System.out.println("请输入需要加密的文件的绝对路径：");
				fileUrl=sca.next();
				while (!(new File(fileUrl).exists())) {
					System.out.println("文件不存在，请重新输入：");
					fileUrl=sca.next();
				}
				System.out.println("请输入密钥：");
				secretKey=sca.next();
				MainClass.encryptFile(fileUrl, secretKey);
			}
			else if (userCmd==2){
				System.out.println("请输入需要解密的文件的绝对路径：");
				fileUrl=sca.next();
				while (!(new File(fileUrl).exists())) {
					System.out.println("文件不存在，请重新输入：");
					fileUrl=sca.next();
				}
				System.out.println("请输入密钥：");
				secretKey=sca.next();
				MainClass.unEncryptFile(fileUrl, secretKey);
			}
			else System.out.println(userCmd+"   未识别的命令，请重新输入：");
			userCmd=sca.nextInt();
				
			}
		System.out.println("感谢使用S-encrypt-tool!^_^")	;
	}
	public static void outWelcomeWord(){
		System.out.println("--------------------欢迎使用 S-encrypt-tool--------------------");
		System.out.println("请输入命令　：  1   加密   2   解密   0  退出");
		
		System.out.println("  ");
		System.out.println("提示                     *加密文件内容只支持常见符号、数字、英文");
		System.out.println("            *加密会删除原文件，请牢记加密密钥");
		System.out.println("            *加密或解密成功会在原文件相同路径下生成与原文件名字相似的文件");
		System.out.println("            *必需输入加密文件绝对路径，不支持相对路径");
		System.out.println("            *密钥支持常见符号、数字、英文、中文");
	}
	public static void encryptFile(String fileUrl,String secretKey) throws IOException{
		BufferedReader in=new BufferedReader(new FileReader(fileUrl));
		String newFile=fileUrl.substring(0,fileUrl.lastIndexOf('/')+1)+"（已加密的）"+fileUrl.substring(fileUrl.lastIndexOf('/')+1,fileUrl.length());//临时密文文件
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
		System.out.print("加密完成！");
		if (oldFile.delete())System.out.println("    原文件删除成功");
		else System.out.println("     原文件删除失败,如需要请手动删除！");
		in.close();
		output.close();
	}
	public static void unEncryptFile(String fileUrl,String secretKey) throws IOException{
		BufferedReader in=new BufferedReader(new FileReader(fileUrl));
		String newFile=fileUrl.substring(0,fileUrl.lastIndexOf('/')+1)+"（已解密的）"+fileUrl.substring(fileUrl.lastIndexOf('/')+1,fileUrl.length());//临时密文文件
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
		System.out.println("解密完成，注意查看解密文件！");
		in.close();
		output.close();
	}
	
}