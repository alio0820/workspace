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
//        		System.out.println("�÷��಻����");
//        		
//        	}
//			System.out.println(ib.getDepartmentIdByName("��ҵ԰����ί��"));
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
	 * ͨ���������ƣ����ز��ŵļ�ֵ��������Ŀ��ʱ������������ת��Ϊ���ֱ�ź��ڵ���	
	 * ����-1��ʾ���ű��в����ڸò�������
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
	 * �ж���Ŀ�ķ����Ƿ����
	 * ���ڷ���true
	 * �������඼Ҫ�ж�
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
	 * ������࣬��ĳ��Ŀ�ķ��಻����ʱ����Ҫ�������Ŀ�ķ���	
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
		
//		��� 	��Ŀ����	ǣͷ���ţ���һ����	���β��ţ���һ����	���ֹ��쵼��	�ֽ�����	��ǰ��ɣ��ٷֱȣ���	��ע��	��һ���ࣨ�������ࣩ	�ڶ�����	��������

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
            	
            	
            	//���벿�ż�¼
            	
            	if(this.isProjectClassifyExist(firstClassify, secondClassify, thirdClassify)==false){
            		this.insertProjectClassify(firstClassify, secondClassify, thirdClassify);
            		System.out.println("�÷��಻����,��Ӹ÷���");
            		
            	}else{
            		System.out.println("�÷������!");
            		
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


	//exceal�ĸ�ʽͳһ,���У���һ�в���ȡ����Ϊ�б���
	//��ţ��������ã����������ƣ�������𣬲��ű�ע������������Ϣ��
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
            	
            	//���벿�ż�¼
            	
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
 * ������Ŀ������excel��ʽͳһ�����У���һ�в�����Ч����
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
            	
            	//���벿�ż�¼
            	
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
