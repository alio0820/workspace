package com.excel.sql;

/** 
2  * QuickExcel.java 
3  * 作者：杨庆成 
4  * Created on 2004年11月22日, 下午4:05 
5  * 在实际应用中经常要将数据库中的表导入Excel 
6  * 本人在Apache的POI基础上写了一个简单的类 
7  * 有不当指出请指正，谢谢！ 
8  *  
9  */  
  
import com.citrus.info.util.Conn;
import java.sql.*;  
import java.io.*;  
 
import org.apache.poi.hssf.usermodel.*;  
import org.apache.poi.poifs.filesystem.POIFSFileSystem;  
import org.apache.poi.hssf.record.*;  
 
/**//** 
29 * 
30 * @author  Administrator 
*/  
public class QuickExcel {
	HSSFWorkbook _wb;  
	String _file="";
     
   /**//** Creates a new instance of QuickExcel */  
   private QuickExcel(String file){  
       _file=file;  
  }  
     
   private void open()throws IOException{  
       InputStream stream = null;  
       Record[] records = null;  
       POIFSFileSystem fs =  
           new POIFSFileSystem(new FileInputStream(_file));  //poi的包必须放到最上边
       _wb = new HSSFWorkbook(fs);  
  }  
     
   private void create(){  
       _wb=new HSSFWorkbook();  
   }  
     
   public static QuickExcel newInstance (String file){  
       QuickExcel qe=new QuickExcel(file);  
       qe.create();  
       return qe;  
   }  
     
   public static QuickExcel openInstance(String file) throws IOException {  
       QuickExcel qe=new QuickExcel(file);  
       qe.open();  
       return qe;  
   }  
     
   public void close(){  
       try{  
           FileOutputStream fileOut = new FileOutputStream(_file);  
           _wb.write(fileOut);//把Workbook对象输出到文件workbook.xls中  
           fileOut.close();  
       }  
       catch (Exception ex){  
           System.out.println(ex.getMessage());  
       }  
   }  
     
   private void removeSheet(String sheetName){  
       int i=_wb.getSheetIndex("sheetName");  
       if (i>=0) _wb.removeSheetAt(i);  
   }  
     
   public int fillSheet (ResultSet rs,String sheetName)throws SQLException {  
       HSSFSheet st= _wb.createSheet(sheetName);  
       ResultSetMetaData rsmd= rs.getMetaData();  
       int index=0;  
       int result=0;  
       HSSFRow row=st.createRow(index++);  
       for(int i=1;i<=rsmd.getColumnCount();++i){  
           HSSFCell cell=row.createCell((short)(i-1));  
           cell.setCellValue(rsmd.getColumnName(i));  
       }  
       while(rs.next()) {  
           result++;  
           row=st.createRow(index++);  
           for(int i=1;i<=rsmd.getColumnCount();++i){  
			HSSFCell cell=row.createCell((short)(i-1));  
//               cell.setEncoding(cell.ENCODING_UTF_16);  
               cell.setCellValue(rs.getString(i));  
           }  
       }  
       return result;  
}  
    
  public static void main(String[] args){  
      try{  
    	  Conn conn = new Conn();
  		  Connection connection = conn.getConnection(null);
  		  PreparedStatement pstmt = null;
  		  String sql="select * from user";
  		  pstmt = connection.prepareStatement(sql);
          QuickExcel qe=QuickExcel.newInstance("c:\\1.xls");    //创建excel，并将数据库写入excel
          ResultSet rs = pstmt.executeQuery();   
          qe.fillSheet(rs,"MT");
          qe.close();
          pstmt.close();
          rs.close();
          qe=QuickExcel.openInstance("c:\\1.xls");  			//打开excel，并将数据库写入excel
          sql="select * from category";
          pstmt = connection.prepareStatement(sql);
          rs = pstmt.executeQuery();
          qe.fillSheet(rs,"MO");
          
          qe.close();  
          pstmt.close();
          rs.close();
      }  
      catch (SQLException ex){  
          System.out.println(ex.getMessage());  
      }  
      catch (IOException ex){  
          System.out.println(ex.getMessage());  
      }  
  }    
} 
