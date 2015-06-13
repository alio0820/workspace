package swu.edu.cn.ExcelDB;

import java.io.File;
import java.sql.ResultSet;
import java.sql.SQLException;


import jxl.Sheet;
import jxl.Workbook;


import swu.edu.cn.sql.*;


public class ImportDB extends DBConnection {


	public  static void main(String[]  args){
		
			ImportDB ib=new ImportDB();
			ib.OpenDB();
			
//			String firstClassify="1111";
//			String secondClassify="2222";
//			String thirdClassify="333";
//			
//			if(ib.isProjectClassifyExist(firstClassify, secondClassify, thirdClassify)==false){
//				ib.insertProjectClassify(firstClassify, secondClassify, thirdClassify);
//        		System.out.println("该分类不存在");
//        		
//        	}
//			System.out.println(ib.getDepartmentIdByName("工业园区管委会"));
//			if(ib.isProjectClassifyExist("1111111", "22222", "33333")==false){
//					ib.insertProjectClassify("1111111", "22222", "33333");
//			}
			File file=new File("d:/Test.xls");
			ib.ImportDepartment(file);
//			ib.ImportEvaluationForm();
//			ib.ImportProject();
			ib.CloseDB();
	}
	
	
	/**
	 * 通过部门名称，返回部门的键值，导入项目表时，将部门名称转化为数字编号后在导入	
	 * 返回-1表示部门表中不存在该部门名称
	 */
	
	public  int getDepartmentIdByName(String departmentName){
		int res=-1;	
		
		String selectSQL="select departmentID from Department where departmentName='"+departmentName+"';";
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				res=rs.getInt("departmentID");
				break;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
				
	}
	
	/**
	 * 判断项目的分类是否存在
	 * 存在返回true
	 * 三级分类都要判断
	 * @throws SQLException 
	 */
	
	
	public  boolean  isProjectClassifyExist(String firstClassify,String secondClassify,String thirdClassify){
		
		boolean  res=false;
		String selectSQL="select * from ProjectClassify where firstClassify='"+firstClassify+"'and secondClassify='"+secondClassify+"'and thirdClassify='"+thirdClassify+"';";
		
//		System.out.println(selectSQL);
		
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			if(rs.next())
					res=true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  res;
	}
	
	/**
	 * 插入分类，当某项目的分类不存在时候，需要插入该项目的分类	
	 */

	public  boolean  insertProjectClassify(String firstClassify,String secondClassify,String thirdClassify){
		boolean  res=false;
		
		String insertSQL="insert into ProjectClassify values('"+firstClassify+"','"+secondClassify+"','"+thirdClassify+"');";
//		System.out.println(insertSQL);
		this.insertDB(insertSQL);
		
		return  res;
	}



	public boolean ImportProject(File file) {
		// TODO Auto-generated method stub
		
//		序号 	项目名称	牵头部门（单一）　	责任部门（单一）　	区分管领导　	分解任务　	当前完成（百分比）　	备注　	第一分类（评估分类）	第二分类	第三分类

		//File file=new File("d:/Test.xls");
		
		try {   
            Workbook book = Workbook.getWorkbook(file);     
            Sheet sheet = book.getSheet(0);   
            //get 1st-Column,1st-Row content. 
            int i=1;

            ProjectManagement  pm=new ProjectManagement();
            pm.OpenDB();
//            while(sheet.getCell(0, i).getContents()!=null){
            	
            for(;i<sheet.getRows();i++){	
//            	int projectID=Integer.parseInt(sheet.getCell(0, i).getContents());
            	String projectName=sheet.getCell(1, i).getContents();
            	String leadDepartment=sheet.getCell(2, i).getContents();
            	String responsibleDepartment=sheet.getCell(3, i).getContents();
            	String leader=sheet.getCell(4, i).getContents();
            	
            	String expectTask=sheet.getCell(5, i).getContents();
            	String rate=sheet.getCell(6, i).getContents();
            	String comment=sheet.getCell(7, i).getContents();;
            	
            	String firstClassify=sheet.getCell(8, i).getContents();
            	String secondClassify=sheet.getCell(9, i).getContents();
            	String thirdClassify=sheet.getCell(10, i).getContents();
            	
            	
//            	System.out.print(projectID+"\t");
//            	System.out.print(projectName+"\t");
//            	System.out.print(leadDepartment+"\t");
//            	System.out.println(responsibleDepartment);
//            	
            	
            	
            	//插入部门记录
            	
            	if(this.isProjectClassifyExist(firstClassify, secondClassify, thirdClassify)==false){
            		this.insertProjectClassify(firstClassify, secondClassify, thirdClassify);
            		System.out.println("该分类不存在,添加该分类");
            		
            	}else{
            		System.out.println("该分类存在!");
            		
            	}
            	
            		String superClass=thirdClassify;
            		double currentProgress=Double.parseDouble(rate);
            		
    
            		String leadDepartmentInt=this.getDepartmentIdByName(leadDepartment)+"";
            		String responsibleDepartmentInt=this.getDepartmentIdByName(responsibleDepartment)+"";
            		
//            		System.out.println(projectName);
//            		System.out.println(superClass);
//            		System.out.println(leadDepartmentInt);
//            		System.out.println(responsibleDepartmentInt);
//            		System.out.println(leader);
//            		System.out.println(expectTask);
//            		System.out.println(currentProgress);
//            		System.out.println(comment);
            		pm.insertProject(projectName, superClass, leadDepartmentInt, responsibleDepartmentInt, leader, expectTask, currentProgress, comment);
            	
//            		i++;
            
            		
            }  
            book.close(); 
            pm.CloseDB();
        } catch (Exception e) {   
            e.printStackTrace();  
            
        } 
		
		return false;
	}


	//exceal的格式统一,四列，第一行不读取，最为列标题
	//编号（此列无用），部门名称，部门类别，部门备注（部门其他信息）
	public boolean ImportDepartment(File file) {
		// TODO Auto-generated method stub

		//File file=new File("d:/Test.xls");
		
		try {   
            Workbook book = Workbook.getWorkbook(file);     
            Sheet sheet = book.getSheet(0);   
            //get 1st-Column,1st-Row content. 
            
            DepartmentManagement dm=new DepartmentManagement();
            dm.OpenDB();
            int i=1;

//            while(sheet.getCell(0, i).getContents()!=null){
            for(;i<sheet.getRows();i++){
            	int departmentID=Integer.parseInt(sheet.getCell(0, i).getContents());
            	String departmentName=sheet.getCell(1, i).getContents();
            	String departmentClassify=sheet.getCell(2, i).getContents();
            	String comment=sheet.getCell(3, i).getContents();
            	
            	System.out.print(departmentID+"\t");
            	System.out.print(departmentName+"\t");
            	System.out.print(comment+"\t");
            	System.out.println(departmentClassify);
            	
            	//插入部门记录
            	
            	dm.insertDepartment(departmentName, departmentClassify, comment);
            	
//            	i++;
            }  
            book.close(); 
            dm.CloseDB();
        } catch (Exception e) {   
            e.printStackTrace();  
            
        } 
		
		return true;
	}


/**
 * 导入项目评估表，excel格式统一，四列，第一行不存有效数据
 */
	public boolean ImportEvaluationForm(File file) {
		// TODO Auto-generated method stub
		
		//File file=new File("d:/Test.xls");
		
		try {   
            Workbook book = Workbook.getWorkbook(file);     
            Sheet sheet = book.getSheet(0);   
            //get 1st-Column,1st-Row content. 
            
            EvaluationFormManagement efm=new EvaluationFormManagement();
            efm.OpenDB();
            int i=1;

           // while(sheet.getCell(0, i).getContents()!=null){
            for(;i<sheet.getRows();i++){
            	int EvaluationID=Integer.parseInt(sheet.getCell(0, i).getContents());
            	String topClass=sheet.getCell(1, i).getContents();
            	String leadDepartment=sheet.getCell(2, i).getContents();
            	String standard=sheet.getCell(3, i).getContents();
            	
            	System.out.print(EvaluationID+"\t");
            	System.out.print(topClass+"\t");
            	System.out.print(leadDepartment+"\t");
            	System.out.println(standard);
            	
            	//插入部门记录
            	
            	efm.insertEvaluation(topClass, leadDepartment, standard);
            	
//            	i++;
            }  
            book.close(); 
            efm.CloseDB();
        } catch (Exception e) {   
            e.printStackTrace();  
            
        } 
		
		return false;
	}


}
