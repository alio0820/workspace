package com.tool;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.action.PersonAction;
import com.bean.UserBean;
import com.common.MyLog;

public class UploadFilesServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		System.out.println("--------upload start--------");
		HttpSession  session=request.getSession();
		UserBean user = PersonAction.getUserFromSession(session);
		String userName = user==null?"...":user.getUserName();
		try {
			request.setCharacterEncoding("UTF-8");
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
//			System.out.println("request:" + request);
			List items = upload.parseRequest(request);

			Iterator iter = items.iterator();
			while (iter.hasNext()) {
				FileItem item = (FileItem) iter.next();
				if (item.isFormField()) {
					/*
					 * String name = item.getFieldName(); String value = item.getString();
					 * System.out.println("name = " + name); System.out.println("value = " +
					 * value); System.out.println("/r/n");
					 */
				} else {
					String fieldName = item.getFieldName();
					String fileName = item.getName();
//					System.out.println("文件类型   " + fileName.substring(fileName.lastIndexOf('.') + 1, fileName.length()));
					// boolean isInMemory = item.isInMemory();
					long sizeInBytes = item.getSize();
					getListInSession(request).add(fileName);
					getListInSession(request).add(UUID.randomUUID());
//					System.out.println("fieldName = " + fieldName);
//					System.out.println("fileName = " + fileName);
					String msg = "用户["+userName+"]上传了文件《"+fileName+"》";
					MyLog.getLogInfo(msg);
					String filePath = this.getServletContext().getRealPath("/") + "download/";
					File savePath = new File(filePath);
//					System.out.println(savePath.getAbsolutePath());
					if(!savePath.exists()){
						savePath.mkdir();
					}
					item.write(new File(filePath + fileName));
				}
			}
//			System.out.println("--------upload finish--------");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List getListInSession(HttpServletRequest request) {
		List result = (List) request.getSession().getAttribute("_result");
		if (result == null) {
			result = new ArrayList();
			request.getSession().setAttribute("_result", result);
		}
		return result;
	}
}
