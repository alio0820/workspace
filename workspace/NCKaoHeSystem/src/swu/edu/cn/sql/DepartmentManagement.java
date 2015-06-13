package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import swu.edu.cn.bean.DepartmentBean;

/**
 * 
 * 作者	 韩东海
 * 日期	2012-05-08
 * 功能	该类为部门管理的类，包括对部门的操作的所有方法
 * 其中最重要的方法为通过评估表查找别考核的部门
 */

public class DepartmentManagement extends DBConnection {
	
	/******************************************************************************************************/
	/**
	 * 该函数返回所有的部门信息,不包括自建的特殊部门（督查，视察领导，批示领导，管理员）
	 */
	public ArrayList<DepartmentBean> searchAllDepartment(){
		ArrayList<DepartmentBean>  list=new ArrayList<DepartmentBean> ();
		
		String selectSQL="select departmentId,departmentName,firstClassify,secondClassify,functions,number  from Department where departmentId like 'department%' order by  cast(substring(departmentId,11,3) as int);";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
//				System.out.println(rs.getString("departmentId"));
//				System.out.println(rs.getString("departmentName"));
//				System.out.println(rs.getString("firstClassify"));
//				System.out.println(rs.getString("secondClassify"));
//				System.out.println(rs.getString("functions"));
//				System.out.println(rs.getInt("number"));
				
				DepartmentBean db=new DepartmentBean();
				db.setDepartmentId(rs.getString("departmentId"));
				db.setDepartmentName(rs.getString("departmentName"));
				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setFuctions(rs.getString("functions"));
				db.setNumber(rs.getInt("number"));
				
				list.add(db);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
		
	}

	
	/******************************************************************************************************/
	/**
	 * 该函数通过某评估项的编号查找需要被评估的部门
	 */
	public ArrayList<DepartmentBean> searchDepartmentByEvaluation(String evaluationId){
		ArrayList<DepartmentBean>  list=new ArrayList<DepartmentBean> ();
		
		String selectSQL="select departmentId,departmentName,firstClassify,secondClassify,functions,number  from Department,EvaluationDepartment,EvaluationForm where EvaluationForm.evaluationId='"+evaluationId+"'  and  EvaluationForm.evaluationId=EvaluationDepartment.evaluationId and departmentId=evaDepartmentId";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
//				System.out.println(rs.getString("departmentId"));
//				System.out.println(rs.getString("departmentName"));
//				System.out.println(rs.getString("firstClassify"));
//				System.out.println(rs.getString("secondClassify"));
//				System.out.println(rs.getString("functions"));
//				System.out.println(rs.getInt("number"));
				
				DepartmentBean db=new DepartmentBean();
				db.setDepartmentId(rs.getString("departmentId"));
				db.setDepartmentName(rs.getString("departmentName"));
				db.setFirstClassify(rs.getString("firstClassify"));
				db.setSecondClassify(rs.getString("secondClassify"));
				db.setFuctions(rs.getString("functions"));
				db.setNumber(rs.getInt("number"));
				
				list.add(db);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return  list;
		
	}
	

	/******************************************************************************************************/

	public  static void main(String[] args){
		
		DepartmentManagement  dm=new DepartmentManagement();
		dm.OpenDB();
//		ArrayList<DepartmentBean>  list=dm.searchDepartmentByEvaluation("evaluation004");
		ArrayList<DepartmentBean>  list=dm.searchAllDepartment();
		for(DepartmentBean db:list){
			
			System.out.println(db.getDepartmentId());
			System.out.println(db.getDepartmentName());
			System.out.println(db.getSecondClassify());
		}
	}
	
}
