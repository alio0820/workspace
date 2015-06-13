package swu.edu.cn.sql;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import swu.edu.cn.bean.*;
/**
 *作者	韩东海
 *日期	2012-05-09
 *功能	该类是对项目所有操作，包括各种用户对项目的不同方法
 *
 */
public class ProjectManagement extends DBConnection {
	
	public ProjectManagement(){
		
	}
	
	public  static void main(String[] args){
		ProjectManagement  pm=new ProjectManagement();
		pm.OpenDB();
//		ArrayList<ProjectBean>	list=pm.searchProjectByDepartment("department119","evaluation002");
//		
//		for(ProjectBean pb:list){
//			System.out.println("责任部门ID="+pb.getResDepartmentId());
//			System.out.println("评估ID="+pb.getEvaluationId());
//			System.out.println("项目考核="+pb.getEvaContent());
//			System.out.println("考核指标内容="+pb.getEvaluationContent());
//			System.out.println(pb.getCurrentFinish());
//			
//			System.out.println(pb.getProjectName());
//			System.out.println(pb.getIsMoney());
//			System.out.println(pb.getTotalMoney());
//			System.out.println("----------------------");
//		}
		
		ArrayList<NoProjectEvaluationBean> list=pm.searchNoProjectEvaluationByNoReport("department119", 5);
		for(NoProjectEvaluationBean pmr:list){
			
			System.out.println(pmr.getEvaMonth());
			System.out.println(pmr.getMonthFinish());
			System.out.println(pmr.getEvaluationId());
			System.out.println(pmr.getEvaluationContent());
			System.out.println(pmr.getEvaDepartmentName());
		}
		pm.CloseDB();
		
	}
	/*****************************************************************************************/
	/**
	 *判断某部门是否承担了某考核指标下的项目（前提是该部门被该考核指标考核）
	 *这个对后面的操作至关重要！承担项目和不承担项目调用的函数将有区别
	 *承担项目就返回true，不承担项目返回false
	 */
	
	public boolean isDepartmentUndertakeProject(String evaluationId,String departmentId){	
		String  selectSQL="select projectId  from Project where Project.resDepartmentId='"+departmentId+"'  and evaluationId='"+evaluationId+"';";
		ResultSet rs=this.SelectDB(selectSQL);
		try {
			if(rs.next())
					return  true;							
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return  false;
	}
	
	/*****************************************************************************************/
	/**
	 * 该函数返回某部门某考核指标下的全部项目
	 * 如果该部门没有承担项目，则需要返回到该部门完成的辅助完成详情！（其他函数中实现）
	 */
	public ArrayList<ProjectBean>  searchProjectByDepartment(String evaluationId,String departmentId){
		ArrayList<ProjectBean>  list=new ArrayList<ProjectBean>();
		
//		String selectSQL="select t.evaid,t.evaluationcontent,t.leaddepartmentid,d1.departmentname as leadDept,t.ismoney,t.totalmoney,t.evacurrfinish,t.procurrentfinish,t.projectid,t.projectname,t.resdepartmentid,d2.departmentname as resDept,t.separateleader,t.evacontent,t.firstclassify,t.secondclassify  " +
//				"from((select evaluationform.evaluationid as evaid,evaluationcontent,leaddepartmentid,ismoney,totalmoney,evaluationform.currentfinish as evacurrfinish,project.currentFinish as procurrentfinish,projectid,projectname,resdepartmentid,separateleader,evacontent,firstclassify,secondclassify " +
//				"from evaluationform join project on (evaluationform.evaluationid=project.evaluationid)) t join department as d1 on (t.leaddepartmentid=d1.departmentid)join department as d2 on (t.resdepartmentid=d2.departmentid))where t.resdepartmentid='"+departmentId+"' and t.evaid='"+evaluationId+"';";
		
		String selectSQL="select evaid,leaddepartmentid,d1.departmentname as leadDeptName,ismoney,evatotalmoney,prototalmoney,evacurrentfinish,procurrentfinish,projectid,projectname,resdepartmentid,d2.departmentname as resDeptName,separateleader,efevacontent,proevacontent,t.firstclassify,t.secondclassify from((select evaluationform.evaluationid as evaid,evaluationform.evaluationcontent as efevacontent,project.evacontent as proevacontent,leaddepartmentid,ismoney,evaluationform.totalmoney as evatotalmoney,project.totalMoney as prototalmoney,evaluationform.currentfinish as evacurrentfinish,project.currentFinish as procurrentfinish,projectid,projectname,resdepartmentid,separateleader,firstclassify,secondclassify from evaluationform join project on (evaluationform.evaluationid=project.evaluationid)) t join department as d1 on (t.leaddepartmentid=d1.departmentid)join department as d2 on (t.resdepartmentid=d2.departmentid))where t.resdepartmentid='"+departmentId+"' and t.evaid='"+evaluationId+"'; ";
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			
			while(rs.next()){
				
				ProjectBean pb=new ProjectBean();				

//				System.out.println(rs.getString("evaid"));
//				System.out.println(rs.getString("leaddepartmentid"));
//				System.out.println(rs.getString("leadDeptName"));
//				System.out.println(rs.getString("ismoney"));
//				System.out.println(rs.getString("evatotalmoney"));//evatotalmoney//prototalmoney
//				
//				
//				System.out.println(rs.getString("prototalmoney"));
//				System.out.println(rs.getString("evacurrentfinish"));
//				System.out.println(rs.getString("procurrentfinish"));
//				System.out.println(rs.getString("projectid"));				
//				System.out.println(rs.getString("projectname"));
//				
//				System.out.println(rs.getString("resdepartmentid"));
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("separateleader"));
//				System.out.println(rs.getString("efevacontent"));
//				System.out.println(rs.getString("proevacontent"));
//				
//				System.out.println(rs.getString("firstclassify"));
//				System.out.println(rs.getString("secondclassify"));
//				System.out.println("-------------------------------------");
//				
				
				
				pb.setProjectId(rs.getString("projectid"));
				pb.setProjectName(rs.getString("projectname"));
				pb.setEvaContent(rs.getString("proevacontent"));	//该项目的考核标准								
				pb.setEvaluationId(rs.getString("evaid"));
				pb.setEvaluationContent(rs.getString("efevacontent"));
				
				pb.setSeparateLeader(rs.getString("separateleader"));								
				pb.setEvaContent(rs.getString("proevacontent"));
				pb.setLeadDepartmentId(rs.getString("leaddepartmentid"));				
				pb.setLeadDepartmentName(rs.getString("leadDeptName"));
				pb.setResDepartmentId(rs.getString("resdepartmentid"));
				pb.setResDepartmentName(rs.getString("resDeptName"));


				
		
				pb.setIsMoney(rs.getString("ismoney"));
				pb.setTotalMoney(rs.getDouble("prototalmoney"));				//有误！		
				pb.setCurrentFinish(rs.getDouble("procurrentfinish"));	
				pb.setFirstClassify(rs.getString("firstclassify"));			
				pb.setSecondClassify(rs.getString("secondclassify"));			
				
				
				
				
				
				list.add(pb);
			}
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
	/**
	 *重载上述方法，返回某部门的全部项目
	 */
	public ArrayList<ProjectBean>  searchProjectByDepartment(String departmentId){
		ArrayList<ProjectBean> list=new ArrayList<ProjectBean>();
		
		
		
		return  list;
		
	}
	
	
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectByEvaluation(String evaluationId,String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select evaid,evaluationcontent,leaddepartmentid,dept1.departmentname as leaddept,evadepartmentid,dept2.departmentname as evadept,evamonth,monthfinish,submittime,status,firstview,secondview,thirdview  " +
				"from((select evaluationform.evaluationid as evaid,evaluationcontent,leaddepartmentid,evadepartmentid,evamonth,monthfinish,submittime,status,firstview,secondview,thirdview  " +
				"from evaluationform join noprojectevaluation on evaluationform.evaluationid = noprojectevaluation.evaluationid) t  " +
				"join department as dept1 on (t.leaddepartmentid=dept1.departmentid) join department as dept2 on (t.evadepartmentid=dept2.departmentid))  " +
				"where evadepartmentid='"+departmentId+"' and  evaid='"+evaluationId+"';";
		/*evaid
		evaluationcontent
		leaddepartmentid
		leaddept
		evadepartmentid
		
		evadept
		evamonth
		monthfinish
		submittime
		status
		
		firstview
		secondview
		thirdview*/
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				npe.setEvaluationId(rs.getString("evaid"));
				npe.setEvaluationContent(rs.getString("evaluationcontent"));
				npe.setLeadDepartmentId(rs.getString("leaddepartmentid"));
				npe.setLeadDepartmentName(rs.getString("leaddept"));
				npe.setEvaDepartmentId(rs.getString("evadepartmentid"));
				
				npe.setLeadDepartmentName(rs.getString("evadept"));
				npe.setEvaMonth(rs.getInt("evamonth"));			
				npe.setMonthFinish(rs.getString("monthfinish"));
				npe.setSubmitTime(rs.getString("submittime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
				
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
	
	
	}
	
	
	/**
	 * 
	 * 查询某部门某月没有上报的记录》》》这个就是需要上报的记录
	 * 对于责任部门自己来说，也需要了解哪些项目没有上报，需要上报
	 * 具体是哪一级没有通过，可以通过status的值来判断
	 * 
	 */
	
	public ArrayList<ProjectMonthRecordBean>  searchProjectByNoReport(String departmentID,int taskMonth){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify  from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID  and Project.resDepartmentId='"+departmentID+"' ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId and taskMonth="+taskMonth+" ) where status is null;";

		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	currentFinish	firstClassify	secondClassify	
*/
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
//					System.out.println(rs.getString("projectId"));
//					System.out.println(rs.getString("projectName"));
//					System.out.println(rs.getString("isMoney"));
//					System.out.println(rs.getString("evaluationContent"));
//					System.out.println(rs.getString("totalProgress"));
//					System.out.println(rs.getString("departmentName"));
//					
//					System.out.println(rs.getString("evaContent"));
//					System.out.println(rs.getString("taskMonth"));
//					System.out.println(rs.getString("status"));
//					System.out.println(rs.getString("monthFinish"));
//					System.out.println(rs.getString("monthMoney"));
//					
//					System.out.println(rs.getString("monthProgress"));
//					System.out.println(rs.getString("submitTime"));
//					System.out.println(rs.getString("currentFinish"));
//					System.out.println(rs.getString("firstClassify"));
//					System.out.println(rs.getString("secondClassify"));
//					
//					System.out.println("--------------------------------------");
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					
					
					list.add(pmrb);
			
				}
	
	
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	/**
	 *该函数返回当月之前所有没有提交的项目记录
	 */
	public ArrayList<ProjectMonthRecordBean>  searchAllProjectByNoReport(String departmentID){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
				int len=(new java.util.Date()).getMonth()+1;
			
				for(int i=len;i>0;i--){
					
					ArrayList<ProjectMonthRecordBean> listTemp=searchProjectByNoReport(departmentID,i);
					
					for(ProjectMonthRecordBean pmb:listTemp)
							list.add(pmb);
				}

		return list;
		
	}
	
	/**责任部门上报数据后更新数据库！！！！*/
	public boolean ReportProjectRecord(String projectID,int taskMonth,String isMoney,double  monthProgress,double monthMoney,String monthFinish){
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		String submitTime = ts.toString().substring(0,10);  
		String status="000";
		//rojectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status
		String insertSQL=null;
		if(isMoney.replaceAll( "\\s","").equalsIgnoreCase("true")){
			//该项目设计资金
			//查找该项目记录完成资金的比例！monthProgress
			ResultSet rs=this.SelectDB("select totalMoney from project where projectId='"+projectID+"'");
				try {
					rs.next();
					monthProgress=monthMoney/rs.getDouble("totalMoney");
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			insertSQL="insert into ProjectMonthRecord(projectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status) values('"+projectID+"',"+taskMonth+",'"+monthFinish+"',"+monthMoney+","+monthProgress+",'"+submitTime+"','"+status+"');";

		}else{
			//该项目不涉及资金
			monthMoney=0;
			insertSQL="insert into ProjectMonthRecord(projectID,taskMonth,monthFinish,monthMoney,monthProgress,submitTime,status) values('"+projectID+"',"+taskMonth+",'"+monthFinish+"',"+monthMoney+","+monthProgress+",'"+submitTime+"','"+status+"');";

		}
		
		System.out.println(insertSQL);
		
		return super.insertDB(insertSQL);

}
	/**********************************************牵头部门对项目的操作！！**********************************************/
	public ArrayList<ProjectMonthRecordBean> searchProjectByLeadDepatrment(String leadDeparmtentId){
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
	String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId  and evaForm.leadDepartmentId='"+leadDeparmtentId+"' )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId )where status='000';";


	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			/*projectId	projectName	isMoney	evaluationContent	totalProgress	
			 * departmentName	evaContent	taskMonth	status	monthFinish	
			 * monthMoney	monthProgress	submitTime	firstView	secondView	
			 * thirdView	currentFinish	firstClassify	secondClassify
			 */
			
			ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
//				System.out.println(rs.getString("projectId"));
//				System.out.println(rs.getString("projectName"));
//				System.out.println(rs.getString("isMoney"));
//				System.out.println(rs.getString("evaluationContent"));
//				System.out.println(rs.getString("totalProgress"));
//				System.out.println(rs.getString("departmentName"));
//				
//				System.out.println(rs.getString("evaContent"));
//				System.out.println(rs.getString("taskMonth"));
//				System.out.println(rs.getString("status"));
//				System.out.println(rs.getString("monthFinish"));
//				System.out.println(rs.getString("monthMoney"));
//				
//				System.out.println(rs.getString("monthProgress"));
//				System.out.println(rs.getString("submitTime"));
//				System.out.println(rs.getString("currentFinish"));
//				System.out.println(rs.getString("firstClassify"));
//				System.out.println(rs.getString("secondClassify"));
				
//				System.out.println("--------------------------------------");
				
				pmrb.setProjectId(rs.getString("projectId"));
				pmrb.setProjectName(rs.getString("projectName"));
				pmrb.setIsMoney(rs.getString("isMoney"));
				pmrb.setTotalProgress(rs.getDouble("totalProgress"));
				pmrb.setResDepartmentName(rs.getString("departmentName"));
				
				
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				
				pmrb.setProjectEvaContent(rs.getString("evaContent"));
				pmrb.setEvaMonth(rs.getInt("taskMonth"));
				pmrb.setStatus(rs.getString("status"));
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setMonthProgress(rs.getDouble("monthMoney"));
				
				pmrb.setMonthProgress(rs.getDouble("monthProgress"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
//				pmrb.setMonthFinish(rs.getString("currentFinish"));
				pmrb.setFirstView(rs.getString("firstView"));
				pmrb.setSecondView(rs.getString("secondView"));
				pmrb.setThirdView(rs.getString("thirdView"));
				pmrb.setMonthMoney(rs.getDouble("monthMoney"));
				list.add(pmrb);
		
			}


	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	
	}

	public int	LeadDepartmentShen(String projectID,int taskMonth,String yijian,boolean tongguo){
		//通过status=T00，不通过为F00
		String status;
		if(tongguo==true){
			status="T00";
		}else{
			status="F00";
		}
		
		String updateSQL="update ProjectMonthRecord set status='"+status+"',firstView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
		
		return this.updateDB(updateSQL);
			
	}

	/**********************************************区分管领导对项目的操作！！**********************************************/

	public ArrayList<ProjectMonthRecordBean>  QianTouLeaderViewList(String  leadarName){
		
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,evaForm.separateLeader,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where  status='T00'  and  separateLeader='"+leadarName+"';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
//					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					pmrb.setMonthMoney(rs.getDouble("monthMoney"));
					
					
					list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}


	/**
	 * 牵头区领导审核他项目记录，通过/不通过，还要给意见
	 * 一级审核
	 * 就是对某条记录进行修改
	 * 
	 */

	public int	QianTouLeaderShen(String projectId,int taskMonth,String yijian,boolean tongguo){
		//通过，tongguo=true
		String status;
		if(tongguo==true){
			status="TT0";
		}else{
			status="TF0";
		}
		
		String updateSQL="update ProjectMonthRecord set status='"+status+"',secondView='"+yijian+"' where projectID='"+projectId+"' and taskMonth="+taskMonth;
		
		return this.updateDB(updateSQL);
			
	}
	
	/*****************************************两半督查的行为*************************************************
	 * 督查室筛选出属于自己待审的项目记录
	 * 督查只能看见上一级（牵头区领导）审核通过的项目
	 * 所有项目都要经过督查室审核！
	 * 使用之前不用打开数据库连接
	 * 返回项目记录队列
	 */

	public ArrayList<ProjectMonthRecordBean>  DuchaViewList(){
		
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,evaForm.separateLeader,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify    " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )left outer join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where status='TT0';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
					
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
//					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
					pmrb.setMonthMoney(rs.getDouble("monthMoney"));
					
					
					list.add(pmrb);
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
	}
	
	/********************************************************************************************************************/
	/**
	 * 该函数筛选出莫无项目部门某月需要提交的非项目数据，该数据针对某考核指标
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectEvaluationByNoReport(String departmentId,int evaMonth){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId  AND npe.evaMonth="+evaMonth+" ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status is null and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				//evaDepartmentid	departmentName	evaluationId	evaluationContent	leadDepartmentId	
				//departmentName	separateLeader	evaluationId	evaMonth	monthFinish	submitTime	
				//status	firstView	secondView	thirdView
				
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("leadDeptName"));
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
				
				list.add(npe);				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return  list;

	}
	
	/**
	 *某部门提交某月非项目完成情况
	 */
	public boolean ReportNoProjectRecord(String departmentId,String evaluationId,int taskMonth,String monthFinish){
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		String submitTime = ts.toString().substring(0,10);  
		String status="000";

		String	insertSQL="insert into NoProjectEvaluation(evaluationId,evaDepartmentId,evaMonth,monthFinish,submitTime,status) values('"+evaluationId+"','"+departmentId+"',"+taskMonth+",'"+monthFinish+"','"+submitTime+"','"+status+"');";

		System.out.println(insertSQL);
		return super.insertDB(insertSQL);
	}
	
	/**
	 *该函数筛选出某牵头部门审核的非项目信息
	 */
	public ArrayList<NoProjectEvaluationBean> searchNoProjectByLeadDepatrment(String leadDeparmtentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='000' and  leadDep.departmentId='"+leadDeparmtentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				//evaDepartmentid	departmentName	evaluationId	evaluationContent	leadDepartmentId	
				//departmentName	separateLeader	evaluationId	evaMonth	monthFinish	submitTime	
				//status	firstView	secondView	thirdView
				
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				
//				System.out.println(rs.getString("resDeptName"));
//				System.out.println(rs.getString("leadDeptName"));
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));

						
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
		}
	
	
	/**
	 * 重载上述方法，牵头部门审核非项目记录
	 */
	public int LeadDepartmentShen(String evaluationId,String evaDepartmentId,int taskMonth,String yijian,boolean tongguo){
	//通过status=T00，不通过为F00
	String status;
	if(tongguo==true){
	status="T00";
	}else{
	status="F00";
	}

	String updateSQL="update NoProjectEvaluation set status='"+status+"',firstView='"+yijian+"' where evaluationId='"+evaluationId+"'  and evaDepartmentId='"+evaDepartmentId+"' and evaMonth="+taskMonth;

	return this.updateDB(updateSQL);

	} 
	
	/**
	 *该函数筛选出牵头领导审核的非项目记录！！
	 */
		public ArrayList<NoProjectEvaluationBean>  QianTouLeaderNoProjectViewList(String  leadarName){
			
			ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
			
			String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
						"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='T00' and  ef.separateLeader='"+leadarName+"';";


			System.out.println(selectSQL);
			ResultSet rs=this.SelectDB(selectSQL);
			
			try {
				while(rs.next()){
					/*projectId	projectName	isMoney	evaluationContent	totalProgress	
					 * departmentName	evaContent	taskMonth	status	monthFinish	
					 * monthMoney	monthProgress	submitTime	firstView	secondView	
					 * thirdView	currentFinish	firstClassify	secondClassify
					 */
					
					NoProjectEvaluationBean  pmrb=new NoProjectEvaluationBean();

						
					
					pmrb.setEvaluationId(rs.getString("evaluationId"));
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					pmrb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
					pmrb.setLeadDepartmentName(rs.getString("leadDeptName"));
					pmrb.setEvaDepartmentId(rs.getString("evaDepartmentid"));
					
					
//					System.out.println(rs.getString("resDeptName"));
//					System.out.println(rs.getString("leadDeptName"));
					pmrb.setEvaDepartmentName(rs.getString("resDeptName"));
					pmrb.setEvaMonth(rs.getInt("evaMonth"));			
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setStatus(rs.getString("status"));
					
					pmrb.setFirstView(rs.getString("firstview"));
					pmrb.setSecondView(rs.getString("secondview"));
					pmrb.setThirdView(rs.getString("thirdview"));
						
						list.add(pmrb);
				
					}


			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
		}
		
	/**
	 *区分管领导对非项目进行（该函数重载分管领导对项目进行审核）
	 *
	 */
	
	public int	QianTouLeaderNoProjectShen(String evaluationId,String departmentId,int evaMonth,String yijian,boolean tongguo){
		String status;
		if(tongguo==true){
			status="TT0";
		}else{
			status="TF0";
		}
		
		String updateSQL="update NoProjectEvaluation set status='"+status+"',secondView='"+yijian+"' where evaluationId='"+evaluationId+"' and evaDepartmentId='"+departmentId+"'  and  evaMonth="+evaMonth;
		
		System.out.println(updateSQL);
		
		return this.updateDB(updateSQL);
			
	}
	
	/**
	 * 该函数筛选出由责任部门提交的某项目的所有项目记录（没有提交的记录将不会被筛选出来，因为数据表中没有这条记录，需要在牵头遍历时处理！）
	 */
	public ArrayList<ProjectMonthRecordBean> searchProjectByDetails(String projectId){
	ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
	
	String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
				"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId )inner join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId  and Project.projectId='"+projectId+"' )ORDER BY taskMonth DESC;";


	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();

				pmrb.setProjectId(rs.getString("projectId"));
				pmrb.setProjectName(rs.getString("projectName"));
				pmrb.setIsMoney(rs.getString("isMoney"));
				pmrb.setTotalProgress(rs.getDouble("totalProgress"));
				pmrb.setResDepartmentName(rs.getString("departmentName"));
				
				
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				
				pmrb.setProjectEvaContent(rs.getString("evaContent"));
				pmrb.setEvaMonth(rs.getInt("taskMonth"));
				pmrb.setStatus(rs.getString("status"));
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setMonthProgress(rs.getDouble("monthMoney"));
				
				pmrb.setMonthProgress(rs.getDouble("monthProgress"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
				pmrb.setMonthFinish(rs.getString("currentFinish"));
				pmrb.setFirstView(rs.getString("firstView"));
				pmrb.setSecondView(rs.getString("secondView"));
				pmrb.setThirdView(rs.getString("thirdView"));						
				list.add(pmrb);
			}

	} catch (SQLException e) {
		e.printStackTrace();
	}
	return list;
	
	}
	
	/**
	 * 该函数筛选出非项目详情（所有月份,没有提交的将不会被筛选出来，需要在牵头遍历时处理！）
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectByDetails(String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status is null and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				npe.setEvaDepartmentName(rs.getString("resDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));

						
				list.add(npe);
				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return  list;
		
	
	}
	
	/**
	 * 
	 * 小函数，在上面函数中调用
	 */
	public String CTS(String status,int i){
		char c=status.charAt(i);
		String res;
		if(c=='F')	res="<font style='color:red'>未通过</font>";
		else if(c=='T')	res="通过";
		else res="待审中";
		
		return res;
	}
	
	/**
	 * 该函数是督查室审核非项目记录完成情况
	 */
	public ArrayList<NoProjectEvaluationBean>  DuchaNoProjectViewList(){
		
	ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
					"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status='TT0';";


		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				/*projectId	projectName	isMoney	evaluationContent	totalProgress	
				 * departmentName	evaContent	taskMonth	status	monthFinish	
				 * monthMoney	monthProgress	submitTime	firstView	secondView	
				 * thirdView	currentFinish	firstClassify	secondClassify
				 */
				
				NoProjectEvaluationBean  pmrb=new NoProjectEvaluationBean();
	
				pmrb.setEvaluationId(rs.getString("evaluationId"));
				pmrb.setEvaluationContent(rs.getString("evaluationContent"));
				pmrb.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				pmrb.setLeadDepartmentName(rs.getString("leadDeptName"));
				pmrb.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				pmrb.setEvaDepartmentName(rs.getString("resDeptName"));
				pmrb.setEvaMonth(rs.getInt("evaMonth"));			
				pmrb.setMonthFinish(rs.getString("monthFinish"));
				pmrb.setSubmitTime(rs.getString("submitTime"));
				pmrb.setStatus(rs.getString("status"));
				
				pmrb.setFirstView(rs.getString("firstview"));
				pmrb.setSecondView(rs.getString("secondview"));
				pmrb.setThirdView(rs.getString("thirdview"));
					
				list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		}
		
	
	/**
	 * 该函数筛选出某部门上报没有通过的项目记录
	 * @param leadDeparmtentId  上报部门编号
	 * @return
	 */
	public ArrayList<ProjectMonthRecordBean> searchProjectFaildByLeadDepatrment(String leadDeparmtentId){
		ArrayList<ProjectMonthRecordBean> list=new ArrayList<ProjectMonthRecordBean>();
		
		String selectSQL="select Project.projectId,Project.projectName,evaForm.isMoney,evaForm.evaluationContent,Project.totalProgress,resDep.departmentName,Project.evaContent,ProjectMonthRecord.taskMonth,ProjectMonthRecord.status,ProjectMonthRecord.monthFinish,ProjectMonthRecord.monthMoney,ProjectMonthRecord.monthProgress,ProjectMonthRecord.submitTime,ProjectMonthRecord.firstView,ProjectMonthRecord.secondView,ProjectMonthRecord.thirdView,Project.currentFinish,Project.firstClassify, Project.secondClassify   " +
					"from (((project inner join Department as resDep on Project.resDepartmentId=resDep.departmentID ) inner join EvaluationForm as evaForm on  evaForm.evaluationId=Project.evaluationId  and evaForm.leadDepartmentId='"+leadDeparmtentId+"' )inner join ProjectMonthRecord  on   Project.projectId=ProjectMonthRecord.projectId ) where status like '%F%';";

		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				
				ProjectMonthRecordBean  pmrb=new ProjectMonthRecordBean();
	
					pmrb.setProjectId(rs.getString("projectId"));
					pmrb.setProjectName(rs.getString("projectName"));
					pmrb.setIsMoney(rs.getString("isMoney"));
					pmrb.setTotalProgress(rs.getDouble("totalProgress"));
					pmrb.setResDepartmentName(rs.getString("departmentName"));
					
					
					pmrb.setEvaluationContent(rs.getString("evaluationContent"));
					
					pmrb.setProjectEvaContent(rs.getString("evaContent"));
					pmrb.setEvaMonth(rs.getInt("taskMonth"));
					pmrb.setStatus(rs.getString("status"));
					pmrb.setMonthFinish(rs.getString("monthFinish"));
					pmrb.setMonthProgress(rs.getDouble("monthMoney"));
					
					pmrb.setMonthProgress(rs.getDouble("monthProgress"));
					pmrb.setSubmitTime(rs.getString("submitTime"));
					pmrb.setMonthFinish(rs.getString("currentFinish"));
					pmrb.setFirstView(rs.getString("firstView"));
					pmrb.setSecondView(rs.getString("secondView"));
					pmrb.setThirdView(rs.getString("thirdView"));
									
					list.add(pmrb);
			
				}


		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
		}
	
	/**
	 * 该函数筛选出某部门提交未通过的非项目记录
	 * @param 被考核部门（提交数据的部门编号）
	 * @return
	 */
	public ArrayList<NoProjectEvaluationBean>  searchNoProjectFaildEvaluation(String departmentId){
		ArrayList<NoProjectEvaluationBean> list=new ArrayList<NoProjectEvaluationBean>();
		
		String selectSQL="select ed.evaDepartmentid,resDep.departmentName as resDeptName,ef.evaluationId,ef.evaluationContent,ef.leadDepartmentId, leadDep.departmentName as leadDeptName,ef.separateLeader,npe.evaluationId, npe.evaMonth,npe.monthFinish,npe.submitTime,npe.status,npe.firstView,npe.secondView,npe.thirdView   " +
				"from  ((((EvaluationDepartment as ed LEFT JOIN NoProjectEvaluation AS npe ON ed.evaDepartmentId=npe.evaDepartmentId  AND  ed.evaluationId=npe.evaluationId  ) JOIN Department AS resDep ON resDep.departmentId=ed.evaDepartmentid ) JOIN EvaluationForm as ef on  ef.evaluationId=ed.evaluationId) JOIN Department AS leadDep ON  leadDep.departmentId=ef.leadDepartmentId) where status like '%F%' and  ed.evaDepartmentid='"+departmentId+"' ;";
		
		System.out.println(selectSQL);
		ResultSet rs=this.SelectDB(selectSQL);
		
		try {
			while(rs.next()){
				NoProjectEvaluationBean  npe=new NoProjectEvaluationBean();
				
				npe.setEvaluationId(rs.getString("evaluationId"));
				npe.setEvaluationContent(rs.getString("evaluationContent"));
				npe.setLeadDepartmentId(rs.getString("leadDepartmentId"));
				npe.setLeadDepartmentName(rs.getString("resDeptName"));
				npe.setEvaDepartmentId(rs.getString("evaDepartmentid"));
				
				npe.setEvaDepartmentName(rs.getString("leadDeptName"));
				npe.setEvaMonth(rs.getInt("evaMonth"));			
				npe.setMonthFinish(rs.getString("monthFinish"));
				npe.setSubmitTime(rs.getString("submitTime"));
				npe.setStatus(rs.getString("status"));
				
				npe.setFirstView(rs.getString("firstview"));
				npe.setSecondView(rs.getString("secondview"));
				npe.setThirdView(rs.getString("thirdview"));
		
				list.add(npe);				
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}		
		return  list;
	}
	
	
	/**
	 * 督查室审核项目记录，通过/不通过，还要给意见
	 */

	public boolean	DuchaShen(String projectID,int taskMonth,String isMoney,String yijian,boolean tongguo){
		//通过，tongguo=true,false表示不通过
		String status;
		//督查审核同意通过后将更新所有数据表，主要是资金和进度，通过事务处理
		if(tongguo==true ){		//只要通过，都要更新数据表，即使与资金无关，也要跟新进度！		
			status="TTT";

			String updateSQL="update ProjectMonthRecord set status='"+status+"',thirdView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
	
			String updateSQL1="update project set totalmoney =(select sum(projectmonthrecord.monthmoney) as promonthtotalmoney from projectmonthrecord where projectmonthrecord.projectid = '"+projectID+"' and status = 'TTT');";
			//该sql语句改成至于projectId有关，即通过
			String updateSQL2="update evaluationform set evaluationform.totalmoney=(select sum(project.totalmoney) as prototalmoney from project where project.evaluationid = (SELECT evaluationId FROM Project WHERE projectId='"+projectID+"') ) where evaluationform.evaluationid = (SELECT evaluationId FROM Project WHERE projectId='"+projectID+"') ;";

			this.updateDB(updateSQL);
			this.updateDB(updateSQL1);
			this.updateDB(updateSQL2);
			
		}else{				//督查不同意,或则只对项目记录进行操作！
			status="TTF";
			String updateSQL="update ProjectMonthRecord set status='"+status+"',thirdView='"+yijian+"' where projectID='"+projectID+"' and taskMonth="+taskMonth;
		
			 this.updateDB(updateSQL);			
		}	
			return true;
		}

	/**
	 * 该函数是督查室审核非项目完成情况
	 * @param evaluationId			评估指标编号（重点项目编号）
	 * @param evaDepartmentId		被考核部门编号
	 * @param evaMonth				被考核月份
	 * @param yijian				督查室意见
	 * @param tongguo				是否通过true/false
	 * @return
	 */
	public int	DuchaNoProjectShen(String evaluationId,String evaDepartmentId,int evaMonth,String yijian,boolean tongguo){
		//通过，tongguo=true,false表示不通过
		String status;
		//督查审核同意通过后将更新所有数据表，主要是资金和进度，通过事务处理
		if(tongguo==true ){		//只要通过，都要更新数据表，即使与资金无关，也要跟新进度！		
			status="TTT";

		}else{				//督查不同意,或则只对项目记录进行操作！
			status="TTF";
		}
		
		String updateSQL="update NoProjectEvaluation set status='"+status+"',thirdView='"+yijian+"' where evaluationId='"+evaluationId+"' and  evaDepartmentId='"+evaDepartmentId+"' and  evaMonth="+evaMonth;

		return this.updateDB(updateSQL);
		}

}
