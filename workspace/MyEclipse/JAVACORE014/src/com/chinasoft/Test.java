package com.chinasoft;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.Reader;
import java.io.Writer;

public class Test {


	
	/**
	 * @param args
	 * @throws IOException 
	 */
	public static void main(String[] args) throws IOException {
		//File f = new File("d:\\text.txt");
		//f.createNewFile();
		//boolean b = f.delete();
		//System.out.println(b);
//		FileInputStream fis = new FileInputStream("d:\\sogou_pinyin_50q.exe");
//
//		
//		
//		FileOutputStream fos = new FileOutputStream("e:\\text.java");
//		byte[] b = new byte[1024];
//		while(fis.read(b)!=-1){
//			fos.write(b);
//		}
//		fos.close();
//		fis.close();
		

		
		
		FileOutputStream fos = new FileOutputStream("e:\\text1.txt");
		InputStream is = System.in;
		Reader r = new InputStreamReader(is);
		BufferedReader bf = new BufferedReader(r);		
		Writer w = new OutputStreamWriter(fos);
		
		String str;		
		while((str=bf.readLine())!=null){
			
		
			w.write(str);
			w.flush();
		}
		w.close();
		r.close();
		
		
	}

}
