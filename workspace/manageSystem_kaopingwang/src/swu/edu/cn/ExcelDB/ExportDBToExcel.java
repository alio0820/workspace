package swu.edu.cn.ExcelDB;
import swu.edu.cn.sql.*;

import java.io.File;
import java.sql.*;


import jxl.*;    
import jxl.write.*; 


public class ExportDBToExcel extends DBConnection {
	
	public  static void main(String[]  args){
		
		ExportDBToExcel  eb=new ExportDBToExcel();
		eb.OpenDB();
		
		File  file1=new File("d:/project_copy.xls");
		//String selectSQL=" select projectName ,departmentName from project,department where leadDepartment=departmentID;";
		String selectSQL="select * from project_copy";
		ResultSet rs=eb.SelectDB(selectSQL);
		
		boolean res=eb.ResultSetToExcel(rs,  file1);
		System.out.println(res);
		
		
		
		eb.CloseDB();
		
	}
	

	public boolean ResultSetToExcel(ResultSet rs, File fileName) {
		// TODO Auto-generated method stub
		
		int row=0;
		try {
			WritableWorkbook book = Workbook.createWorkbook(fileName);   
			
			WritableSheet sheet = book.createSheet("Sheet_1", 0);   
			
			
			
			while(rs.next()){					//第row行
				ResultSetMetaData meta=rs.getMetaData();
				
				for(int i=1;i<=meta.getColumnCount();i++){
//					String columnName=meta.getColumnName(i);
					String  data=rs.getObject(i)+"";		//写入row行，i列数据
					Label label = new Label(i-1, row, data);     
					sheet.addCell(label);  
							
				}
				
				row++;
				}
			
			  book.write();      
			  book.close(); 
			  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("数据导出出错");
			return  false;
		}
		
		return  true;

	}

}
