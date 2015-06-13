package swu.edu.cn.sql;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import swu.edu.cn.bean.*;

/**
 * ����	������
 * ����	2012-05-08
 * ����	��ɶ�������Ĳ��������ӡ�ɾ��������Ҫ���Ǹ��ݲ���id���Ҹò��ų��ص�����ָ��
 *
 */
public class EvaluationManagement extends DBConnection {
	
	public EvaluationManagement(){
		
	}
	
	
	/*********************************************************************************************************/
	/**
	 * �ú����������е�����ָ��
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
	 * �ú���ɸѡĳ���ųе������е�����ָ��
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
	 * �ú�������һ��������¼,������
	 */
	
	public  boolean insertEvaluation(){
		
		return  false;
	}
	
	/*********************************************************************************************************/
	/**
	 * �ú����Ǹ���ĳ��������¼�ĵ�ǰ�����������������ݱ��е�currentFinish�ֶΣ�������
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
