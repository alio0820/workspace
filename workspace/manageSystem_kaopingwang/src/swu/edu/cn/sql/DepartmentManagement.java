package swu.edu.cn.sql;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import swu.edu.cn.bean.*;

public class DepartmentManagement extends DBConnection {
	/**
	 * 	public  LinkedList<DepartmentBean>	getAllDepartment()
	 * public boolean insertDepartment(String departmentName,String departmentClassify,String comment)
	 * public int deleteDepartment(int departmentID)
	 */
	
	
	public DepartmentManagement() {
		// TODO Auto-generated constructor stub
		super();
	}

	/**
	 * �ú���ɸѡ�����еĲ��ż�������ŵ���ϸ��Ϣ���ŵ����������
	 */
	public  List getAllDepartment(){
		List list = new ArrayList();
		
		this.OpenDB();
		String selectSQL="select  departmentID,departmentName,departmentClassify,comment from Department";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				DepartmentBean db=new DepartmentBean();
				
				db.setDepartmenID(rs.getString("departmentID"));
				db.setDepartmentName(rs.getString("departmentName"));
				db.setDepartmentClassify(rs.getString("departmentClassify"));
				db.setComment(rs.getString("comment"));
				
				list.add(db);
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;	
	}
	
	
	
	
	
	/**
	 * 
	 * ���Ӳ�����һ������,ͨ��
	 */
	
	public boolean insertDepartment(String departmentName,String departmentClassify,String comment){
		
		String insertSQL="insert into Department(departmentName,departmentClassify,comment) values('"+departmentName+"','"+departmentClassify+"','"+comment+"');";
		
//		String insertSQL="insert into Department(userName,password,departmentID) values(?,'888888',?);";
		System.out.println(insertSQL);
		return  this.insertDB(insertSQL);
	}
	
	
	/**������������������������������������������������������������������������������������������������������������������������������������������������������
	 * ɾ��һ������,����ɾ����¼������
	 */
	
	public int deleteDepartment(int departmentID){
		int sum=0;
		
		String deleteSQL="delete  from Department where departmentID="+departmentID;
		
		sum=this.deleteDB(deleteSQL);
		return  sum;
	}
	
	
	
	public static void main(String[] args){
		DepartmentManagement  dm=new DepartmentManagement();
		dm.OpenDB();
//		dm.insertDepartment("han","dd", "handonghai");
//		dm.CloseDB();
		List list=dm.getAllDepartment();
		
		while(!list.isEmpty()){
			DepartmentBean db=new DepartmentBean();
			db=(DepartmentBean) list.get(0);
			System.out.println(db.getDepartmentClassify()+"\t"+db.getDepartmenID()+"\t"+db.getDepartmentName());
			list.remove(0);
		}
		
	}
	
	
}
