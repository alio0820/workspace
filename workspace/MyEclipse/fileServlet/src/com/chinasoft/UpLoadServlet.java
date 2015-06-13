package com.chinasoft;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class UpLoadServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		//InputStream is =  request.getInputStream();
		
		//InputStreamReader isr = new InputStreamReader(is);
		//char[] c = new char[100];
		//while(isr.read(c)!=-1){
		//	System.out.println(c);
		//}
		
		
		
		String path = request.getRealPath("/");
		String savePath = path + "file\\";
		String tempPath = path + "temp\\";
		File f = new File(tempPath);
		//byte[] b = new byte[1];
		//int len = 0;
		//while((len=is.read(b))!=-1){
		//	fos.write(b,0,len);
		//}
		//fos.flush();
		//fos.close();
		//is.close();
		
		 DiskFileItemFactory factory = new DiskFileItemFactory(); 
		 factory.setRepository(f);
		 ServletFileUpload upload = new ServletFileUpload(factory);
		 upload.setSizeMax(1024*1024*1024);
		 List<FileItem> items = new ArrayList<FileItem>();
		 try {
			 items = upload.parseRequest(request);
		} catch (FileUploadException e) {			
			e.printStackTrace();
		}
		for(FileItem fileItem : items){
			System.out.println(fileItem.getName());
			System.out.println(fileItem.getFieldName());
			System.out.println(fileItem.getSize());			
			InputStream is = fileItem.getInputStream();
			FileOutputStream fos = new  FileOutputStream(savePath + fileItem.getName()) ;
			byte[] b = new byte[1024];
			int len = 0;
			while((len=is.read(b))!=-1){
				fos.write(b,0,len);
			}
			fos.flush();
			fos.close();
			is.close();
		}
		

	}

}
