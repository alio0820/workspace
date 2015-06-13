package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import swu.edu.cn.bean.DepartmentBean;

/**
 * 
 * ����	 ������
 * ����	2012-05-08
 * ����	����Ϊ���Ź�����࣬�����Բ��ŵĲ��������з���
 * ��������Ҫ�ķ���Ϊͨ����������ұ𿼺˵Ĳ���
 */

public class DepartmentManagement extends DBConnection {
	
	/******************************************************************************************************/
	/**
	 * �ú����������еĲ�����Ϣ,�������Խ������ⲿ�ţ����飬�Ӳ��쵼����ʾ�쵼������Ա��
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
	 * �ú���ͨ��ĳ������ı�Ų�����Ҫ�������Ĳ���
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
