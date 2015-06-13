package com.boxun.action;
import java.io.File;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import com.boxun.bean.ExcelWorkSheet;
import com.boxun.bean.Userinfo;
import com.boxun.biz.IUserBiz;
import com.opensymphony.xwork2.ActionSupport;
public class UserAction extends ActionSupport {
 private IUserBiz userBiz;
 public void setUserBiz(IUserBiz userBiz) {
  this.userBiz = userBiz;
 }
 
 private File excelFile; //�ϴ����ļ�
 
    private String excelFileFileName; //����ԭʼ�ļ���
 
 //��Excel�ļ�������Ϻ���Ϣ��ŵ����������
 private ExcelWorkSheet<Userinfo> excelWorkSheet;
 
 public File getExcelFile() {
  return excelFile;
 }
 public void setExcelFile(File excelFile) {
  this.excelFile = excelFile;
 }
 public String getExcelFileFileName() {
  return excelFileFileName;
 }
 public void setExcelFileFileName(String excelFileFileName) {
  this.excelFileFileName = excelFileFileName;
 }
 public ExcelWorkSheet<Userinfo> getExcelWorkSheet() {
  return excelWorkSheet;
 }
 public void setExcelWorkSheet(ExcelWorkSheet<Userinfo> excelWorkSheet) {
  this.excelWorkSheet = excelWorkSheet;
 }
 
 
 //�ж��ļ�����
 public Workbook createWorkBook(InputStream is) throws IOException{
  if(excelFileFileName.toLowerCase().endsWith("xls")){
   return new HSSFWorkbook(is);
  }
  if(excelFileFileName.toLowerCase().endsWith("xlsx")){
   return new XSSFWorkbook(is);
  }
  return null;
 }
 
 public String execute() throws Exception{
  Workbook book = createWorkBook(new FileInputStream(excelFile));
  //book.getNumberOfSheets();  �ж�Excel�ļ��ж��ٸ�sheet
  Sheet sheet =  book.getSheetAt(0); 
  excelWorkSheet = new ExcelWorkSheet<Userinfo>();
  //���湤��������
  Row firstRow = sheet.getRow(0);
  Iterator<Cell> iterator = firstRow.iterator();
  
  //��������
  List<String> cellNames = new ArrayList<String>();
  while (iterator.hasNext()) {
   cellNames.add(iterator.next().getStringCellValue());
  }
  excelWorkSheet.setColumns(cellNames);
  for (int i = 1; i <= sheet.getLastRowNum(); i++) {
   Row ros = sheet.getRow(i);
   Userinfo user = new Userinfo();
   user.setId((int)ros.getCell(0).getNumericCellValue());
   user.setName(ros.getCell(1).getStringCellValue());
   user.setPass(ros.getCell(2).getStringCellValue());
   user.setLastname(ros.getCell(3).getStringCellValue());
   user.setAddres(ros.getCell(4).getStringCellValue());
   user.setRemark(ros.getCell(5).getStringCellValue());
   excelWorkSheet.getData().add(user);
  }
  for (int i = 0; i < excelWorkSheet.getData().size(); i++) {
   Userinfo info = excelWorkSheet.getData().get(i);
   System.out.println(info.getLastname());
  }
  return SUCCESS;
 }
 
 
 
 
}