package swu.edu.cn.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.util.Iterator;
import java.util.List;
 

 
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import swu.edu.cn.ExcelDB.*;

public class FileUploadAccept extends HttpServlet {

	private static final long serialVersionUID = 1L;

    private String uploadPath = "D:\\temp"; 				// 上传文件的目录
    private String tempPath = "d:\\temp\\buffer\\"; 		// 临时文件目录
    File tempPathFile;
   // private String leibie;

public FileUploadAccept() {
		super();
	}

public void destroy() {
		super.destroy(); 
	}


public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String leibie = request.getParameter("leibie");
		System.out.println(leibie);
		HttpSession session = request.getSession();
		session.setAttribute("leibie", leibie);
		response.setContentType("text/html;charset=UTF-8");
		String responseText="传入成功！";
		PrintWriter out =response.getWriter(); 			 
		out.print(responseText);    
		out.flush();    
		out.close();
	}

public void doPost(HttpServletRequest request, HttpServletResponse response){
	HttpSession session = request.getSession();
	String leibie=session.getAttribute("leibie").toString();
	System.out.println(leibie);
	try {

     DiskFileItemFactory factory = new DiskFileItemFactory();

     factory.setSizeThreshold(4096); 			// 设置缓冲区大小，这里是4kb
     factory.setRepository(tempPathFile);		// 设置缓冲区目录

     ServletFileUpload upload = new ServletFileUpload(factory);

     upload.setSizeMax(4194304); // 设置最大文件尺寸，这里是4MB

     List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
     
     Iterator<FileItem> i = items.iterator();
     while (i.hasNext()) {
        FileItem fi = (FileItem) i.next();
        String fileName = fi.getName();
        if (fileName != null) {
//            File fullFile = new File(fi.getName());
//            File savedFile = new File(uploadPath, fullFile.getName());
            File savedFile = new File(uploadPath, "ProjectTable.xls");
            fi.write(savedFile);	//
            
            ImportDB  idb=new ImportDB();
            idb.OpenDB();
            if(leibie.equals("project")){
            	 idb.ImportProject(savedFile);			//导入项目表
            	 System.out.println("正在导入项目表");
            	 
            }else if(leibie.equals("department")){
            	idb.ImportDepartment(savedFile);	
            	System.out.println("正在导入部门表");	//导入部门表
            	
            }else if(leibie.equals("evaluation")){
            	idb.ImportEvaluationForm(savedFile);									//导入评估表
            	System.out.println("正在导入评估表");
            	
            }else{
            	System.out.println("error");
            }
           
            idb.CloseDB();
        }
     }
     	request.setAttribute("result", "文件导入成功");
     	response.setContentType("text/html;charset=UTF-8");
     	RequestDispatcher dispatcher=null;
     	dispatcher = request.getRequestDispatcher("/projectEntry.jsp");  //跳转到目标页面
		dispatcher.forward(request, response);
     System.out.print("upload succeed");
 } catch (Exception e) {
     // 可以跳转出错页面
     e.printStackTrace();
 }
}

public void init() throws ServletException {
    File uploadFile = new File(uploadPath);
    if (!uploadFile.exists()) {
        uploadFile.mkdirs();
    }
    File tempPathFile = new File(tempPath);
     if (!tempPathFile.exists()) {
        tempPathFile.mkdirs();
    }
 }
}
