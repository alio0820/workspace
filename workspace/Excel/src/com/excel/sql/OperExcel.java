package com.excel.sql;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import com.excel.sql.ExcuteData;
import com.excel.sql.TableCell;
import com.excel.sql.GenericUtil;

public class OperExcel<T extends Serializable> {				//Excel操作类
	private HSSFWorkbook workbook;
	private String tableName;
	private Class<T> type;
	private String sheetName;

	public OperExcel(File excelFile, String tableName, Class<T> type,
			String sheetName) throws FileNotFoundException,
			IOException {
		workbook = new HSSFWorkbook(new FileInputStream(excelFile));
		this.tableName = tableName;
		this.type = type;
		this.sheetName = sheetName;
		InsertData();
	}

	// 向表中写入数据
	public void InsertData() {
		System.out.println("yyy");
		ExcuteData excuteData = new ExcuteData();
		List<List> datas = getDatasInSheet(this.sheetName);		
		String strSql="";
//		//如果存在该表就删除它
//		strSql="DROP TABLE IF EXISTS "+this.tableName;
//		excuteData.ExcuData(strSql);
		
		// 向表中添加数据之前先删除表中数据
		strSql = "delete from " + this.tableName;
		excuteData.ExcuData(strSql);
		
		// 拼接sql语句
		for (int i = 1; i < datas.size(); i++) {
			strSql = "insert into " + this.tableName;
			List row = datas.get(i);
//			if(i==1){    								//创建数据库this.tableName
////				String createTable="Create table "+this.tableName+"(";
//				for (short n = 0; n < row.size(); n++) {
//					TableCell excel = (TableCell) row.get(n);
//					if (n != row.size() - 1){
//						strSql += excel.get_name() + ",";
////						if(n==0)
////							createTable +=excel.get_name()+" varchar(50) not null primary key ,";
////						else
////							createTable +=excel.get_name()+" varchar(200),";
//					}
//					else{
//						strSql += excel.get_name() + ")";
////						createTable +=excel.get_name()+" varchar(200) )";
//					}
//				}
////				excuteData.ExcuData(createTable);
//			}
			strSql += " values (";
			for (short n = 0; n < row.size(); n++) {
				TableCell excel = (TableCell) row.get(n);
				try {
					if (n != row.size() - 1) {
						strSql += getTypeChangeValue(excel) + ",";
					} else
						strSql += getTypeChangeValue(excel) + ")";
				} catch (RuntimeException e) {
					e.printStackTrace();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//执行sql
//			strSql="insert into bb(expeSuggNumb,conc,expeSugg) values ('缺乏','立即进行春灌,先在树冠下筑土埂形成灌水盘，每平方米树冠投影面积灌水20kg；在树冠滴水线附近挖灌水穴2-4个，每平方米树冠投影面积灌水10kg；')";
			excuteData.ExcuData(strSql);
		}
	}

	/**
	 * 获得表中的数据
	 * @param sheetName 表格索引(EXCEL 是多表文档,所以需要输入表索引号)
	 * @return 由LIST构成的行和表
	 */
	public List<List> getDatasInSheet(String sheetName) {
		List<List> result = new ArrayList<List>();
		// 获得指定的表
		HSSFSheet sheet = workbook.getSheet(sheetName);
		List<TableCell> rowData=null;
		// 获得数据总行数
		int rowCount = sheet.getLastRowNum();
		if (rowCount < 1) {
			return result;
		}
		int num=0;		//记录第几次
		boolean bl = false;
		// 逐行读取数据
		for (int rowIndex = 4; rowIndex < rowCount; rowIndex++) {
			// 获得行对象
			HSSFRow row = sheet.getRow(rowIndex);
			//定义boolean变量,当bl为true时，表示此行不添加			
			
			if (row != null) {
				if(this.getCellString((sheet.getRow(rowIndex)).getCell(1)) != null){	//如果为空则不创建
					rowData= new ArrayList<TableCell>();
					num=0;
					// 获得本行中单元格的个数
					int columnCount = sheet.getRow(0).getLastCellNum();
					// 获得本行中各单元格中的数据
					for (short columnIndex = 0; columnIndex < columnCount; columnIndex++) {
						HSSFCell cell = row.getCell(columnIndex);
						// 获得指定单元格中数据
						Object cellStr = this.getCellString(cell);
						if(xiangmu(this.getCellString((sheet.getRow(rowIndex)).getCell(0)))||xiangmu2(this.getCellString((sheet.getRow(rowIndex)).getCell(0)))){
							bl=true;
							break;
						}
						else
							bl=false;
						//如果第一个数不为空
							TableCell TableCell = new TableCell();
							if(columnIndex==4){
								TableCell.set_name("money_sour_total_name");
								TableCell.set_value("总计");
							}
							else if(columnIndex==5){
								TableCell.set_name("money_sour_total_num");
								TableCell.set_value(cellStr == null ? "" : cellStr
										.toString());
							}
							else{
								TableCell.set_name(getCellString(sheet.getRow(0).getCell(columnIndex)).toString());
								TableCell.set_value(cellStr == null ? "" : cellStr
										.toString());
							}
							if(columnIndex==5){						
								rowData.add(TableCell);
								for(int i =1;i<=6;i++){
									TableCell TableCell1 = new TableCell();
									TableCell1.set_name("money_sour_"+i+"_name");
									TableCell1.set_value("");
									rowData.add(TableCell1);
									TableCell TableCell2 = new TableCell();
									TableCell2.set_name("money_sour_"+i+"_num");
									TableCell2.set_value("");
									rowData.add(TableCell2);
								}
							}
							else if(columnIndex==0)
								;
							else
								rowData.add(TableCell);
					}
					if(bl==true)
						continue;
					if(this.getCellString((sheet.getRow(rowIndex+1)).getCell(1)) != null){
						result.add(rowData);
					}
				}
				else{																			//第一个单元格为空
					num++;
					// 获得本行中各单元格中的数据
					for (short columnIndex = 4; columnIndex <= 5; columnIndex++) {
						HSSFCell cell = row.getCell(columnIndex); 
						// 获得指定单元格中数据
						Object cellStr = this.getCellString(cell);
//						if(xiangmu(cellStr.toString())||xiangmu2(cellStr.toString())){
//							bl=true;
//							break;
//						}
						//如果第一个数不为空
							
							if(columnIndex==4){
								TableCell TableCell1 = new TableCell();
								TableCell1.set_name("money_sour_"+num+"_name");
								TableCell1.set_value(cellStr == null ? "" : cellStr
										.toString());
								rowData.remove(columnIndex+num*2-1);
								rowData.add(columnIndex+num*2-1, TableCell1);
							}
							else if(columnIndex==5){
								TableCell TableCell2 = new TableCell();
								TableCell2.set_name("money_sour_"+num+"_num");
								TableCell2.set_value(cellStr == null ? "" : cellStr
										.toString());
								rowData.remove(columnIndex+num*2-1);
								rowData.add(columnIndex+num*2-1, TableCell2);
							}							
					}
					if(this.getCellString((sheet.getRow(rowIndex+1)).getCell(1)) != null){
						result.add(rowData);
					}
				}
			}
		}
		return result;
	}

	/**
	 * 获得单元格中的内容
	 * 
	 * @param cell
	 * @return result
	 */
	protected Object getCellString(HSSFCell cell) {
		Object result = null;
		if (cell != null) {
			int cellType = cell.getCellType();
			switch (cellType) {

			case HSSFCell.CELL_TYPE_STRING:
				result = cell.getStringCellValue();
				break;
			case HSSFCell.CELL_TYPE_NUMERIC:
				result = cell.getNumericCellValue();
				break;
			case HSSFCell.CELL_TYPE_FORMULA:
				result = cell.getNumericCellValue();
				break;
			case HSSFCell.CELL_TYPE_ERROR:
				result = null;
				break;
			case HSSFCell.CELL_TYPE_BOOLEAN:
				result = cell.getBooleanCellValue();
				break;
			case HSSFCell.CELL_TYPE_BLANK:
				result = null;
				break;
			}
		}
		return result;
	}

	// 根据类型返回相应的值
	@SuppressWarnings("unchecked")
	public String getTypeChangeValue(TableCell excelElement)
			throws RuntimeException, Exception {
		String colName = excelElement.get_name();
		String colValue = excelElement.get_value();
		String retValue = "";
		if (colName.equals("id")) {
			retValue = "'" + GenericUtil.getPrimaryKey() + "'";
			return retValue;
		}
		if (colName == null) {
			retValue = null;
		}
		if (colName.equals("class_createuser")) {
			retValue = "yaa101";
			return "'" + retValue + "'";
		}
		retValue = "'" + colValue + "'";
		return retValue;
	}
	public boolean xiangmu(Object str1){
		String str;
		if(str1==null)
			return false;
		else
			str = str1.toString();
		if(str.equals("(一)")||str.equals("(二)")||str.equals("(三)")||str.equals("(四)")||str.equals("(五)")||str.equals("(六)")||str.equals("(七)")||str.equals("(八)")||str.equals("(九)")||str.equals("(十)")||str.equals("总计"))
			return true;
		return false;
	}
	public boolean xiangmu2(Object str1){
		String str;
		if(str1==null)
			return false;
		else
			str = str1.toString();
		if(str.equals("一")||str.equals("二")||str.equals("三")||str.equals("四")||str.equals("五")||str.equals("六")||str.equals("七")||str.equals("八")||str.equals("九")||str.equals("十"))
			return true;
		return false;
	}
}
