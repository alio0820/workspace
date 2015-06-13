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

    private String uploadPath = "D:\\temp"; 				// �ϴ��ļ���Ŀ¼
    private String tempPath = "d:\\temp\\buffer\\"; 		// ��ʱ�ļ�Ŀ¼
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
		String responseText="����ɹ���";
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

     factory.setSizeThreshold(4096); 			// ���û�������С��������4kb
     factory.setRepository(tempPathFile);		// ���û�����Ŀ¼

     ServletFileUpload upload = new ServletFileUpload(factory);

     upload.setSizeMax(4194304); // ��������ļ��ߴ磬������4MB

     List<FileItem> items = upload.parseRequest(request);// �õ����е��ļ�
     
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
            	 idb.ImportProject(savedFile);			//������Ŀ��
            	 System.out.println("���ڵ�����Ŀ��");
            	 
            }else if(leibie.equals("department")){
            	idb.ImportDepartment(savedFile);	
            	System.out.println("���ڵ��벿�ű�");	//���벿�ű�
            	
            }else if(leibie.equals("evaluation")){
            	idb.ImportEvaluationForm(savedFile);									//����������
            	System.out.println("���ڵ���������");
            	
            }else{
            	System.out.println("error");
            }
           
            idb.CloseDB();
        }
     }
     	request.setAttribute("result", "�ļ�����ɹ�");
     	response.setContentType("text/html;charset=UTF-8");
     	RequestDispatcher dispatcher=null;
     	dispatcher = request.getRequestDispatcher("/projectEntry.jsp");  //��ת��Ŀ��ҳ��
		dispatcher.forward(request, response);
     System.out.print("upload succeed");
 } catch (Exception e) {
     // ������ת����ҳ��
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
