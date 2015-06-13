package com.excel;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.format.UnderlineStyle;
import jxl.read.biff.BiffException;
import jxl.write.Label;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;


public class ExcelOpt {
 /**
  * ����һ��Excel�ļ� jxl
     * @param fileName  Ҫ���ɵ�Excel�ļ���
     * @jxl.jar �汾��2.6
     */ 
    public static void writeExcel(String fileName){  
        WritableWorkbook wwb = null;  
        try {  
            //����Ҫʹ��Workbook��Ĺ�����������һ����д��Ĺ�����(Workbook)����  
            wwb = Workbook.createWorkbook(new File(fileName));
         
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
        if(wwb!=null){  
            //����һ����д��Ĺ�����  
            //Workbook��createSheet������������������һ���ǹ���������ƣ��ڶ����ǹ������ڹ������е�λ��  
            WritableSheet ws = wwb.createSheet("����������", 0);  
              
            //���濪ʼ��ӵ�Ԫ��  
            for(int i=0;i<10;i++){  
                for(int j=0;j<5;j++){  
                    //������Ҫע����ǣ���Excel�У���һ��������ʾ�У��ڶ�����ʾ��  
                    Label labelC = new Label(j, i, "���ǵ�"+(i+1)+"�У���"+(j+1)+"��");
                    try {  
                        //�����ɵĵ�Ԫ����ӵ���������  
                        ws.addCell(labelC);  
                    } catch (RowsExceededException e) {  
                        e.printStackTrace();  
                    } catch (WriteException e) {  
                        e.printStackTrace();  
                    }  
 
                }  
            }  
 
            try {  
                //���ڴ���д���ļ���  
                wwb.write();  
                //�ر���Դ���ͷ��ڴ�  
                wwb.close();  
            } catch (IOException e) {  
                e.printStackTrace();  
            } catch (WriteException e) {  
                e.printStackTrace();  
            }  
        }  
    }
  
    /**  
     *   ����һ��Excel�ļ�POI
     *   @param   inputFile   ����ģ���ļ�·�� 
     *   @param   outputFile   �����ļ�����ڷ�����·�� 
     *   @param   dataList   ���������� 
     *   @throws   Exception 
     *   @roseuid: 
     */

    public static void exportExcelFile(String inputFile,String outputFile,List dataList) throws Exception{
  //��ģ���ļ�����poi 
  POIFSFileSystem fs = new POIFSFileSystem(new FileInputStream(inputFile));
  //����ģ�幤���� 
  HSSFWorkbook templatewb = new HSSFWorkbook(fs);
  //ֱ��ȡģ���һ��sheet���� 
  HSSFSheet templateSheet = templatewb.getSheetAt(1);
  //�õ�ģ��ĵ�һ��sheet�ĵ�һ�ж���   Ϊ�˵õ�ģ����ʽ 
  HSSFRow templateRow = templateSheet.getRow(0);

  //HSSFSheet   timplateSheet   =   templatewb.getSheetAt(1); 
  //ȡ��Excel�ļ��������� 
  int columns = templateSheet.getRow((short) 0)
    .getPhysicalNumberOfCells();
//  Debug.println("columns   is   :   " + columns);  //=========================
  //������ʽ���� 
  HSSFCellStyle styleArray[] = new HSSFCellStyle[columns];

  //һ���Դ��������е���ʽ���������� 
  for (int s = 0; s < columns; s++) {
   //�õ�����ʵ�� 
   styleArray[s] = templatewb.createCellStyle();
  }
  //ѭ����ÿһ����Ԫ����и�ֵ   
  //��λ�� 
  for (int rowId = 1; rowId < dataList.size(); rowId++) {
   //����ȡ��rowId������   ÿһ��������valueList 
   List valueList = (List) dataList.get(rowId - 1);
   //��λ�� 
   for (int columnId = 0; columnId < columns; columnId++) {
    //����ȡ����Ӧ��colunmId�е�ֵ 
    //ÿһ����Ԫ���ֵ 
    String dataValue = (String) valueList.get(columnId);
    //ȡ��colunmId�еĵ�style 
    //ģ��ÿһ�е���ʽ 
    HSSFCellStyle style = styleArray[columnId];
    //ȡģ���colunmId�еĵ�Ԫ����� 
    //ģ�嵥Ԫ����� 
    HSSFCell templateCell = templateRow.getCell((short) columnId);
    //����һ���µ�rowId��   �ж��� 
    //�½����ж���   
    HSSFRow hssfRow = templateSheet.createRow(rowId);
    //�����µ�rowId��   columnId��   ��Ԫ����� 
    //�½��ĵ�Ԫ����� 
    HSSFCell cell = hssfRow.createCell((short) columnId);
    //�����Ӧ��ģ�嵥Ԫ��   ��ʽΪ������ 
    if (templateCell.getCellStyle().getLocked() == false) {
     //���ô���styleΪ������ 
     style.setLocked(false);
     //���õ��µĵ�Ԫ���� 
     cell.setCellStyle(style);
    }
    //������ʽΪ���� 
    else {
     //���ô���styleΪ���� 
     style.setLocked(true);
     //���õ��µ�Ԫ���� 
     cell.setCellStyle(style);
    }
    //���ñ��� 
//    cell.setEncoding(HSSFCell.ENCODING_UTF_16);
    //Debug.println("dataValue   :   "   +   dataValue); 
    //����ֵ   ͳһΪString 
    cell.setCellValue(dataValue);
   }
  }
  //���������� 
  FileOutputStream fOut = new FileOutputStream(outputFile);
  //��ģ�������д������ļ��� 
  templatewb.write(fOut);
  fOut.flush();

  //�����������ر��ļ� 
  fOut.close();

 }
  
    /**
     * ��������ΪXLS��ʽ
     * @param fos ����Excel�ļ�Path
     * @param bo Ҫ���������
     */
    public static void  writeExcelBo(String fos, java.util.List ve)
    {
     jxl.write.WritableWorkbook wwb;
     try
     {
      wwb= Workbook.createWorkbook(new File(fos));
      jxl.write.WritableSheet ws= wwb.createSheet("��������", 10);
      ws.addCell(new jxl.write.Label(0, 1, "����"));
      ws.addCell(new jxl.write.Label(1, 1, "����"));
      ws.addCell(new jxl.write.Label(2, 1, "����"));
      ws.addCell(new jxl.write.Label(3, 1, "������"));
      int bookSize=ve.size();
      BookVO book = new BookVO();
      for (int i= 0; i < bookSize; i++)
      {
       book= (BookVO)ve.get(i);
       ws.addCell(new jxl.write.Label(0, i + 2, "" + book.getBookName()));
       ws.addCell(new jxl.write.Label(1, i + 2, book.getBookAuthor()));
       ws.addCell(new jxl.write.Label(2, i + 2, "" + book.getBookPrice()));
       ws.addCell(new jxl.write.Label(3, i + 2, book.getBookConcern()));

      }
     // jxl.write.WritableFont wfc=
      //new jxl.write.WritableFont(WritableFont.ARIAL,255,WritableFont.BOLD,false,UnderlineStyle.NO_UNDERLINE,jxl.format.Colour.BLACK);
      //jxl.write.WritableCellFormat wcfFC= new jxl.write.WritableCellFormat(wfc);
      ws.addCell(new jxl.write.Label(0, 0, "2007��07�¼����������飡"));
      wwb.write();
      // �ر�Excel����������
      wwb.close();
     } catch (IOException e){
     } catch (RowsExceededException e){
    
     } catch (WriteException e){
     }
    }
    
    
    
    /**��ȡExcel�ļ�������
    * @param file ����ȡ���ļ�
    * @return
    */
    public static String readExcel(File file){  
        StringBuffer sb = new StringBuffer();  
          
        Workbook wb = null;  
        try {  
            //����Workbook��������������  
            wb=Workbook.getWorkbook(file);  
        } catch (BiffException e) {  
            e.printStackTrace();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
          
        if(wb==null)  
            return null;  
          
        //�����Workbook����֮�󣬾Ϳ���ͨ�����õ�Sheet��������������  
        Sheet[] sheet = wb.getSheets();  
          
        if(sheet!=null&&sheet.length>0){  
            //��ÿ�����������ѭ��  
            for(int i=0;i< sheet.length;i++){
                //�õ���ǰ�����������  
                int rowNum = sheet[i].getRows();   
                 for(int j=0;j < rowNum;j++){
                    //�õ���ǰ�е����е�Ԫ��  
                    Cell[] cells = sheet[i].getRow(j);  
                    if(cells!=null&&cells.length>0){  
                        //��ÿ����Ԫ�����ѭ��  
                        for(int k=0;k < cells.length;k++){
                            //��ȡ��ǰ��Ԫ���ֵ  
                            String cellValue = cells[k].getContents();  
                            sb.append(cellValue+"\t"); 
                        }  
                    }  
                    sb.append("\r\n");  
                }  
                sb.append("\r\n");  
            }  
        }  
        //���ر���Դ���ͷ��ڴ�  
        wb.close();  
        return sb.toString();  
    } 
    
    
    
    /**����ĳһ���ļ����Ƿ����ĳ���ؼ���
     * @param file ���������ļ�
     * @param keyWord Ҫ�����Ĺؼ���
     * @return
     */
    public static boolean searchKeyWord(File file,String keyWord){  
        boolean res = false;  
          
        Workbook wb = null;  
        try {  
            //����Workbook��������������  
            wb=Workbook.getWorkbook(file);  
        } catch (BiffException e) {  
            return res;  
        } catch (IOException e) {  
            return res;  
        }  
          
        if(wb==null)  
            return res;  
          
        //�����Workbook����֮�󣬾Ϳ���ͨ�����õ�Sheet��������������  
        Sheet[] sheet = wb.getSheets();  
          
        boolean breakSheet = false;  
          
        if(sheet!=null&&sheet.length>0){  
            //��ÿ�����������ѭ��  
            for(int i=0;i<sheet.length;i++){
                if(breakSheet)  
                    break;  
                  
                //�õ���ǰ�����������  
                int rowNum = sheet[i].getRows();  
                  
                boolean breakRow = false;  
                  
                for(int j=0;j<rowNum;j++){
                    if(breakRow)  
                        break;  
                    //�õ���ǰ�е����е�Ԫ��  
                    Cell[] cells = sheet[i].getRow(j);  
                    if(cells!=null&&cells.length>0){  
                        boolean breakCell = false;  
                        //��ÿ����Ԫ�����ѭ��  
                        for(int k=0;k<cells.length;k++){
                            if(breakCell)  
                                break;  
                            //��ȡ��ǰ��Ԫ���ֵ  
                            String cellValue = cells[k].getContents();  
                            if(cellValue==null)  
                                continue;  
                            if(cellValue.contains(keyWord)){  
                                res = true;  
                                breakCell = true;  
                                breakRow = true;  
                                breakSheet = true;  
                            }  
                        }  
                    }  
                }  
            }  
        }  
        //���ر���Դ���ͷ��ڴ�  
        wb.close();  
          
        return res;  
    } 
     
  
    public static void main(String[] args) {
//	       ������excel��д��ķ���
//     writeExcel("c:\\2.xls");
//     System.out.println("OK");
//     ArrayList list = new ArrayList();
//    
//     for (int i = 0; i < 10; i++) {
//      BookVO book = new BookVO();
//      book.setBookName("WebWork in action+"+i);
//      book.setBookAuthor("����+"+i);
//      book.setBookPrice("39Ԫ+"+i);
//      book.setBookConcern("��˼�Ƽ�+"+i);
//      list.add(book);
//     }    
//     writeExcelBo("c:\\3.xls",list);
//     System.err.println("Book OK!!!");
//     ------------------------------------------------------------------------------------------------------
//    	���excel������
    	String str="";
    	File file = new File("C:\\Users\\hadoopor\\Desktop\\��ɸѡ�����ϴ�ѧ����Ժ����.xls");
    	str=readExcel(file);
    	System.out.println(str);
    	System.out.println(searchKeyWord(file,"����"));
    
 }

}