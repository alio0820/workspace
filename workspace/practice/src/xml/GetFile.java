package xml;

import java.io.File;


public class GetFile {
	public static void main(String[] args){
		File file = new File("E:\\java资料\\");
		File[] files = file.listFiles();
		for(int i=0;i<files.length;i++){
//			if(!files[i].isDirectory()){
				System.out.println(files[i].getName());
//			}
		}
	}
}
