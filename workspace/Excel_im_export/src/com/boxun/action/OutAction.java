package com.boxun.action;

import java.io.IOException;

import java.io.OutputStream;
import java.util.List;
import javax.servlet.http.HttpServletResponse;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.struts2.interceptor.ServletResponseAware;
import com.boxun.bean.Userinfo;
import com.boxun.biz.IUserBiz;
import com.opensymphony.xwork2.ActionSupport;

public class OutAction extends ActionSupport implements ServletResponseAware {
	/**
  *
  */
	private static final long serialVersionUID = 1L;

	private IUserBiz biz;

	public void setBiz(IUserBiz biz) {
		this.biz = biz;
	}

	private String format = "xls";
	private HttpServletResponse response;
	private String fileName;

	public String execute() {

		@SuppressWarnings("all")
		List la = biz.getAllSql();

		setResponseHeader();
		try {
			exportExcel(response.getOutputStream());
			response.getOutputStream().flush();
			response.getOutputStream().close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	/** ������Ӧͷ */
	public void setResponseHeader() {
		try {
			// response.setContentType("application/msexcel;charset=UTF-8");
			// //���ַ���������
			response.setContentType("application/octet-stream;charset=iso-8859-1");
			response.setHeader("Content-Disposition", "attachment;filename="
					+ java.net.URLEncoder.encode(this.fileName, "UTF-8"));
			// �ͻ��˲�����
			response.addHeader("Pargam", "no-cache");
			response.addHeader("Cache-Control", "no-cache");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/** �������� */
	private void exportExcel(OutputStream os) throws IOException {
		Workbook book = new HSSFWorkbook();
		Sheet sheet = book.createSheet("������Ϣ");
		Row row = sheet.createRow(0);
		row.createCell(0).setCellValue("���");
		row.createCell(1).setCellValue("�û���");
		row.createCell(2).setCellValue("����");
		row.createCell(3).setCellValue("��ʵ����");
		row.createCell(4).setCellValue("��ַ");
		row.createCell(5).setCellValue("��ע");
		CellStyle sty = book.createCellStyle();
		List<Userinfo> list = biz.getAll();
		for (int i = 1; i < list.size(); i++) {
			Userinfo user = list.get(i - 1);
			row = sheet.createRow(i);
			row.createCell(0).setCellValue(user.getId());
			row.createCell(1).setCellValue(user.getName());
			row.createCell(2).setCellValue(user.getPass());
			row.createCell(3).setCellValue(user.getLastname());
			row.createCell(4).setCellValue(user.getAddres());
			row.createCell(5).setCellValue(user.getRemark());
		}
		try {
			book.write(os);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
		this.fileName = "��������.xls";
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/** ��סһ���и����Ե�set���� */
	public void setServletResponse(HttpServletResponse response) {
		this.response = response;
	}
}