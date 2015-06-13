package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import swu.edu.cn.bean.EvaluationFormBean;

public class EvaluationFormManagement extends DBConnection {

	
	
	public  static void main(String [] args){
		
		EvaluationFormManagement  efm=new EvaluationFormManagement();
		efm.OpenDB();
		
		ArrayList<EvaluationFormBean> list=efm.showEvaluationForm();
		
		for(EvaluationFormBean efb:list){
			System.out.print(efb.getEvaluationID()+"\t");
			System.out.print(efb.getTopClass()+"\t");
			System.out.print(efb.getLeadDepartment()+"\t");
			System.out.println(efb.getStandard());	
		}		
	}
	
	
	
	public ArrayList<EvaluationFormBean>  showEvaluationForm(){
		ArrayList<EvaluationFormBean> list=new ArrayList<EvaluationFormBean> ();
		
		String sql="select * from evaluationform";
		
		ResultSet  rs=this.SelectDB(sql);
		
		try {
			while(rs.next()){
				EvaluationFormBean  efb=new EvaluationFormBean();
					efb.setEvaluationID(rs.getInt("evaluationID"));
					efb.setTopClass(rs.getString("topClass"));
					efb.setLeadDepartment(rs.getString("leadDepartment"));
					efb.setStandard(rs.getString("standard"));
				
					
					list.add(efb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  list;
		
	}
	
	/**
	 * 该函数晒选某部门的评估项
	 */
	public ArrayList<EvaluationFormBean>  searchEvaluationByDepartment(int departmentID){
		ArrayList<EvaluationFormBean> list=new ArrayList<EvaluationFormBean> ();
		
		String sql= "select * from evaluationForm where topClass in " +
				"(select distinct firstClassify from  ProjectClassify,Project " +
				"where ProjectClassify.thirdClassify=Project.superClass and  responsibleDepartment="+departmentID+")";
		System.out.println(sql);
		ResultSet  rs=this.SelectDB(sql);
		
		try {
			while(rs.next()){
				EvaluationFormBean  efb=new EvaluationFormBean();
					efb.setEvaluationID(rs.getInt("evaluationID"));
					efb.setTopClass(rs.getString("topClass"));
					efb.setLeadDepartment(rs.getString("leadDepartment"));
					efb.setStandard(rs.getString("standard"));
				
					
					list.add(efb);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return  list;
		
	}
	
	
	/**
	 * 插入一条新的评估记录
	 */
	
	public boolean insertEvaluation(String topClass,String leadDepartment,String standard){
		
		String insertSQL="insert into EvaluationForm(topClass,leadDepartment,standard) values('"+topClass+"','"+leadDepartment+"','"+standard+"');";
		
//		String insertSQL="insert into Department(userName,password,departmentID) values(?,'888888',?);";
		System.out.println(insertSQL);
		
		return  this.insertDB(insertSQL);
	}
	
}

