package swu.edu.cn.sql;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import swu.edu.cn.bean.*;

/**
 * 作者	韩东海
 * 日期	2012-05-08
 * 功能	完成对评估表的操作，增加、删除，最主要的是根据部门id查找该部门承载的评估指标
 *
 */
public class EvaluationManagement extends DBConnection {
	
	public EvaluationManagement(){
		
	}
	
	
	/*********************************************************************************************************/
	/**
	 * 该函数查找所有的评估指标
	 */
	public ArrayList<EvaluationBean>  searchAllEvaluaion(){
		ArrayList<EvaluationBean>  list=new ArrayList<EvaluationBean>();
		String selectSQL="select evaluationId,evaluationContent,leadDepartmentId,departmentName,separateLeader,evaluationStandard,isMoney,totalMoney,currentFinish from  EvaluationForm,Department where  leadDepartmentId=departmentId order by  cast(substring(evaluationId,11,3) as int)";

		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				EvaluationBean  eb=new EvaluationBean();
//				System.out.println(rs.getString("evaluationId"));
//				System.out.println(rs.getString("evaluationContent"));
//				System.out.println(rs.getString("leadDepartmentId"));
//				System.out.println(rs.getString("departmentName"));
//				System.out.println(rs.getString("evaluationStandard"));
//				System.out.println(rs.getString("isMoney"));
//				System.out.println(rs.getFloat("totalMoney"));
//				System.out.println(rs.getString("currentFinish"));
				
				eb.setEvaluationId(rs.getString("evaluationId"));
				eb.setEvaluationContent(rs.getString("evaluationContent"));
				eb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				eb.setLeadDepartmentName(rs.getString("departmentName"));
				eb.setSeparateLeader(rs.getString("separateLeader"));
				eb.setEvaluationStandard(rs.getString("evaluationStandard"));
				eb.setIsMoney(rs.getString("isMoney"));
				eb.setTotalMoney(rs.getFloat("totalMoney"));
				eb.setCurrentFinish(rs.getString("currentFinish"));
				
				list.add(eb);
				
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	/*********************************************************************************************************/
	/**
	 * 该函数筛选某部门承担的所有的评估指标
	 */
	public ArrayList<EvaluationBean>  searchEvaluaionByDepartment(String departmentId){
		ArrayList<EvaluationBean>  list=new ArrayList<EvaluationBean>();
		String selectSQL="select EvaluationForm.evaluationId,separateLeader,evaluationContent,leadDepartmentId,departmentName,evaluationStandard,isMoney,totalMoney,currentFinish from EvaluationForm, EvaluationDepartment,Department where evaDepartmentId='"+departmentId+"'  and EvaluationForm.evaluationId=EvaluationDepartment.evaluationId and  leadDepartmentId=departmentId order by  cast(substring(EvaluationForm.evaluationId,11,3) as int)";

		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				EvaluationBean  eb=new EvaluationBean();
//				System.out.println(rs.getString("evaluationId"));
//				System.out.println(rs.getString("evaluationContent"));
//				System.out.println(rs.getString("leadDepartmentId"));
//				System.out.println(rs.getString("departmentName"));
//				System.out.println(rs.getString("evaluationStandard"));
//				System.out.println(rs.getString("isMoney"));
//				System.out.println(rs.getFloat("totalMoney"));
//				System.out.println(rs.getString("currentFinish"));
				
				eb.setEvaluationId(rs.getString("evaluationId"));
				eb.setEvaluationContent(rs.getString("evaluationContent"));
				eb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				eb.setLeadDepartmentName(rs.getString("departmentName"));
				eb.setSeparateLeader(rs.getString("separateLeader"));
				
				eb.setEvaluationStandard(rs.getString("evaluationStandard"));
				eb.setIsMoney(rs.getString("isMoney"));
				eb.setTotalMoney(rs.getFloat("totalMoney"));
				eb.setCurrentFinish(rs.getString("currentFinish"));
				
				list.add(eb);
				
				
				
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	
	/*********************************************************************************************************/
	
	/**
	 * 该函数插入一条评估记录,待完善
	 */
	
	public  boolean insertEvaluation(){
		
		return  false;
	}
	
	/*********************************************************************************************************/
	/**
	 * 该函数是跟新某条评估记录的当前完成情况，即跟新数据表中的currentFinish字段，待完善
	 */
	public  boolean updateEvaluation(){
		
		return  false;
	}
	
	
	/*********************************************************************************************************/

	public  static void main(String[]  args){
		
		
		EvaluationManagement  em=new EvaluationManagement();
		em.OpenDB();
		
//		ArrayList<EvaluationBean> list=em.searchAllEvaluaion();
		ArrayList<EvaluationBean> list=em.searchAllEvaluaion();
		for(EvaluationBean eb:list){
			System.out.println(eb.getEvaluationId());
			System.out.println(eb.getEvaluationContent());
//			System.out.println(eb.getLeadDepartmentId());
			System.out.println(eb.getLeadDepartmentName());
			System.out.println(eb.getSeparateLeader());
			System.out.println(eb.getEvaluationStandard());
//			System.out.println(eb.getIsMoney());
//			System.out.println(eb.getTotalMoney());
			System.out.println(eb.getCurrentFinish());
			
		}
		
		em.CloseDB();
	}

}
