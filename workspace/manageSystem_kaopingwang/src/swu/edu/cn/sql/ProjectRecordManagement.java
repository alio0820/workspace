package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.*;

import swu.edu.cn.bean.ProjectRecordBean;
import swu.edu.cn.bean.QianTouViewBean;
/**
 * 
 * @author  韩东海
 *该类主要完成对项目记录的操作，包括对项目记录的查询，更新，插入
 *各个级别对项目记录的审核及意见
 *该函数返回某责任部门某月的所有项目完成情况细节: public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month);
 *该函数返回某牵头部门某月的所有项目完成情况细节：public  LinkedList<String>	getLeadDepartmentTask(String departmentID,int Month)；
 *该函数返回所有项目完成情况细节,包括它的分类：       public  LinkedList<String>   getAllTask()；
 */


public class ProjectRecordManagement extends DBConnection{
	
	
	public static void main(String [] args){
		ProjectRecordManagement prm=new ProjectRecordManagement();
		prm.OpenDB();
		
		ArrayList<QianTouViewBean> list=prm.DuchaViewList();
		
		for(QianTouViewBean prb:list ){
				System.out.print(prb.getProjectID()+"\t");			
				System.out.print(prb.getProjectName()+"\t");
				System.out.println(prb.getResponsibleDepartemntName()+"\t");
				System.out.print(prb.getActualFinish()+"\t");
				System.out.print(prb.getTaskMonth()+"\t");
				System.out.print(prb.getRate()+"\t");
				
				System.out.println(prb.getLeadCompanyView());
			
		}
	
		
//		System.out.println(prm.isProjectRecordExist(1, 21));
//		java.util.Date  date=new java.util.Date();
//		System.out.println(date.getDate());
		
//		prm.insertProjectRecord(1, 1112, "handonghai", 0.35, "2011-2-21");
		
		/**前头部门查看自己待审的项目
		 * 测试成功*/
//		ArrayList<QianTouViewBean> list=prm.QianTouViewList(26);
//		while(!list.isEmpty()){
//			QianTouViewBean  qtvb=list.get(0);
//			System.out.print(qtvb.getProjectID()+"\t");
//			System.out.print(qtvb.getProjectName()+"\t");
//			System.out.print(qtvb.getActualFinish()+"\t");
//			System.out.print(qtvb.getResponsibleDepartemntName()+"\t");
//			System.out.print(qtvb.getTaskMonth()+"\t");
//			System.out.println(qtvb.getRate());
//			
//			list.remove(0);
//		}
	
		
		/**牵头部门审批项目
		 * 测试成功
		prm.QianTouShen(39, 1, "项目有待改进", true);
		*/
		
		//ArrayList<QianTouViewBean> list=prm.QianTouLeaderViewList("毛朝银");
		//牵头区领导审批项目》测试通过
		//prm.QianTouLeaderShen(39, 1, "不通过", false);
		
		
//		prm.DuchaViewList();
//		prm.DuchaShen(39, 1, "项目有待改进", true);
//		prm.CloseDB();
	}
	
public ProjectRecordManagement(){
		super();
}



/**
 * 
 * 该函数返回某责任部门某月的所有项目完成情况细节
 * 使用之前要不需要打开数据库连接
 * 通过status返回不同状态的项目记录
 * status=%>>所有
 * status=null>>未申报。。。。
 */
public  ArrayList<ProjectRecordBean>	getResponsibleDepartmentTask(int responsiDepartmentID,int Month,String status){
	ArrayList<ProjectRecordBean>  list=new ArrayList<ProjectRecordBean>();
		
	//责任部门是已知的，是该部门用户所在部门编号
	
//	String selectSQL="select Project.projectID,projectName,Project.comment,Project.currentProgress,Department.departmentName,status from ((project inner join Department on Project.leadDepartment=Department.departmentID  )left outer join ProjectRecord on   Project.projectID=ProjectRecord.projectID and taskMonth="+Month+"  ) where Project.responsibleDepartment='"+responsiDepartmentID+"' and status like '"+status +"';";
	String selectSQL="select Project.projectID,projectName,Project.expectTask,Project.currentProgress,Department.departmentName,status from ((project inner join Department on Project.leadDepartment=Department.departmentID  )left outer join ProjectRecord on   Project.projectID=ProjectRecord.projectID and taskMonth="+Month+" and status like '"+status +"' ) where Project.responsibleDepartment='"+responsiDepartmentID+"';";
	
//	String sql="select Project.projectID,projectName,Project.comment,Project.currentProgress,Department.departmentName,status from project,ProjectRecord,Department where Project.leadDepartment=Department.departmentID   and Project.projectID=ProjectRecord.projectID  and   ProjectRecord.taskMonth="+Month+" and  Project.responsibleDepartment='"+responsiDepartmentID+"'; ";
	System.out.println(selectSQL);
	ResultSet  rs=SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			//rs.getString("status").equals(status)表示查询条件
			//
		ProjectRecordBean prb=new ProjectRecordBean();
		prb.setProjectID(rs.getInt("projectID"));
		System.out.println("*************"+prb.getProjectID());
		prb.setProjectName(rs.getString("projectName"));
		prb.setExpectTask(rs.getString("expectTask"));
		prb.setLeadDepartment(rs.getString("departmentName"));
		prb.setCurrentProgress(rs.getDouble("Project.currentProgress"));
		
		prb.setStatus(rs.getString("status"));
			
			list.add(prb);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		

	return list;
	
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
 * 该函数返回某牵头部门某月的所有项目完成情况细节
 */

public  LinkedList<String>	getLeadDepartmentTask(String leadLepartmentID,int Month){
	LinkedList<String>  list=new LinkedList<String>();
	

	return list;
	
}

/**
 * 该函数返回所有项目完成情况细节,包括它的分类，将用树杈分类来显示
 * 该函数在查看所有项目进程上使用
 *
 */

public LinkedList<String> getAllProjectRecord(){
	LinkedList<String>  list=new LinkedList<String>();
	
	return  list;
	
}

/**
 * 
 * 该函数查询一条项目记录是否存在，当在申报业绩的时候必须检测是否重复提交！
 * 返回false表示没有重复的记录存在,
 */
public boolean isProjectRecordExist(int projectID,int taskMonth){
	boolean res=false;
	
	ResultSet rs=null;
	Statement st=null;
	
	String sql="select projectID,taskMonth from ProjectRecord where projectID="+projectID+"  and taskMonth= "+taskMonth+";";
	System.out.println(sql);

	try {
		if(conn.isClosed()){
			return res;	
		}
		
		st=conn.createStatement();
		rs=st.executeQuery(sql);
		
		while(rs.next()){
			if(rs.getInt("projectID")==projectID && rs.getInt("taskMonth")==taskMonth){
					res=true;
					break;
			}
			
		}
		
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return  res;
}



/**************************************责任部门的行为******************************************
 * 上报任务进度
 * 该函数增加一条新的项目记录,该记录必须包含项目主键，任务月份，完成时间（描述），完成比例及提交时间
 * 该函数由责任部门来调用
 * 该项目记录提交成功后的状态为000，表示一级待审
 * 默认该记录不存在，如果存在的记录只能上级批示
 */
public boolean ReportProjectRecord(int projectID,int taskMonth,String actualFinish,double  rate ){
		Date date = new Date();
		Timestamp ts = new Timestamp(date.getTime());
		String submitTime = ts.toString().substring(0,10);
		String insertSQL="insert into ProjectRecord(projectID,actualFinish,rate,taskMonth,status,submitTime) values("+projectID+",'"+actualFinish+"',"+rate+","+taskMonth+",'000'"+",'"+submitTime+"');";
		System.out.println(submitTime);
		
		return super.insertDB(insertSQL);

}


/**
 *责任部门对于未通过的记录要重新开始提交
 *只要有一级没有被通过，就叫不通过
 */
public int	reReportProjectRecord(int projectID,int taskMonth,String actualFinish,double  rate, String submitTime ){
	

	String updateSQL="update ProjectRecord set status='000',rate="+rate+",actualFinish='"+actualFinish+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}



//查看提交失败或者失败的记录


/************************************牵头部门的行为*************************************************
 * 牵头部门筛选出属于自己待审的项目记录
 * 使用之前不用打开数据库连接
 * 条件：牵头部门主键，
 * 返回项目记录队列
 */

public ArrayList<QianTouViewBean>  QianTouViewList(int leadDepartmentID){
	
	ArrayList<QianTouViewBean> list=new ArrayList<QianTouViewBean>();
	
	String selectSQL="select Project.projectID,taskMonth,projectName,Department.departmentName,ProjectRecord.actualFinish,ProjectRecord.rate from Project,Department,ProjectRecord where Project.leadDepartment="+leadDepartmentID+
					"  and  Project.ProjectID=ProjectRecord.projectID and  ProjectRecord.status='000' and Project.responsibleDepartment=Department.departmentID";
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			
//			System.out.println(rs.getInt("Project.projectID"));
//			System.out.println(rs.getInt("taskMonth"));
//			System.out.println(rs.getString("projectName"));
//			System.out.println(rs.getString("Department.departmentName"));
//			System.out.println(rs.getString("ProjectRecord.actualFinish"));
//			System.out.println(rs.getDouble("ProjectRecord.rate"));
			
			QianTouViewBean  qtvb=new QianTouViewBean();
			qtvb.setProjectID(rs.getInt("Project.projectID"));
			qtvb.setProjectName(rs.getString("projectName"));
			qtvb.setTaskMonth(rs.getInt("taskMonth"));
			qtvb.setResponsibleDepartemntName(rs.getString("Department.departmentName"));
			qtvb.setActualFinish(rs.getString("ProjectRecord.actualFinish"));
			qtvb.setRate(rs.getDouble("ProjectRecord.rate"));
			
			list.add(qtvb);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return  list;	
}


/**
 * 牵头部门审核他项目记录，通过/不通过，还要给意见
 * 一级审核
 * 就是对某条记录进行修改
 */

public int	QianTouShen(int projectID,int taskMonth,String yijian,boolean tongguo){
	//通过status=T00，不通过为F00
	String status;
	if(tongguo==true){
		status="T00";
	}else{
		status="F00";
	}
	
	String updateSQL="update ProjectRecord set status='"+status+"',leadCompanyView='"+yijian+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}

/*****************************************牵头区领导的行为************************************************************
 * 牵头区领导筛选出属于自己待审的项目记录
 * 牵头区领导只能看见上一级（牵头部门）审核通过的项目
 * 使用之前不用打开数据库连接
 * 条件：牵头区领导的姓名（登录后保存在session中），
 * 返回项目记录队列
 */

public ArrayList<QianTouViewBean>  QianTouLeaderViewList(String  leadarName){
	
	ArrayList<QianTouViewBean> list=new ArrayList<QianTouViewBean>();
	
	String selectSQL="select Project.projectID,leadCompanyView,taskMonth,projectName,Department.departmentName,ProjectRecord.actualFinish,ProjectRecord.rate from Project,Department,ProjectRecord where Project.leader='"+leadarName+
					"'  and  Project.ProjectID=ProjectRecord.projectID and  ProjectRecord.status='T00' and Project.responsibleDepartment=Department.departmentID";
	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			
//			System.out.println(rs.getInt("Project.projectID"));
//			System.out.println(rs.getInt("taskMonth"));
//			System.out.println(rs.getString("projectName"));
//			System.out.println(rs.getString("Department.departmentName"));
//			System.out.println(rs.getString("ProjectRecord.actualFinish"));
//			System.out.println(rs.getDouble("ProjectRecord.rate"));
			
			QianTouViewBean  qtvb=new QianTouViewBean();
			qtvb.setProjectID(rs.getInt("Project.projectID"));
			qtvb.setProjectName(rs.getString("projectName"));
			qtvb.setTaskMonth(rs.getInt("taskMonth"));
			qtvb.setResponsibleDepartemntName(rs.getString("Department.departmentName"));
			qtvb.setActualFinish(rs.getString("ProjectRecord.actualFinish"));
			qtvb.setRate(rs.getDouble("ProjectRecord.rate"));
			qtvb.setLeadCompanyView(rs.getString("leadCompanyView"));
			
			
			list.add(qtvb);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return  list;	
}


/**
 * 牵头区领导审核他项目记录，通过/不通过，还要给意见
 * 一级审核
 * 就是对某条记录进行修改
 */

public int	QianTouLeaderShen(int projectID,int taskMonth,String yijian,boolean tongguo){
	//通过，tongguo=true
	String status;
	if(tongguo==true){
		status="TT0";
	}else{
		status="TF0";
	}
	
	String updateSQL="update ProjectRecord set status='"+status+"',separateLeaderView='"+yijian+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}




/*****************************************两半督查的行为*************************************************
 * 督查室筛选出属于自己待审的项目记录
 * 督查只能看见上一级（牵头区领导）审核通过的项目
 * 所有项目都要经过督查室审核！
 * 使用之前不用打开数据库连接
 * 返回项目记录队列
 */

public ArrayList<QianTouViewBean>  DuchaViewList(){
	
	ArrayList<QianTouViewBean> list=new ArrayList<QianTouViewBean>();
	
	String selectSQL="select Project.projectID,leadCompanyView,separateLeaderView,supervisionView ,taskMonth,projectName,Department.departmentName,ProjectRecord.actualFinish,ProjectRecord.rate " +
			"from Project,Department,ProjectRecord " +
			"where  Project.ProjectID=ProjectRecord.projectID and  ProjectRecord.status='TT0' and Project.responsibleDepartment=Department.departmentID";
	System.out.println(selectSQL);
	ResultSet rs=this.SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			
			System.out.println(rs.getInt("Project.projectID"));
			System.out.println(rs.getInt("taskMonth"));
			System.out.println(rs.getString("projectName"));
			System.out.println(rs.getString("Department.departmentName"));
			System.out.println(rs.getString("ProjectRecord.actualFinish"));
			System.out.println(rs.getDouble("ProjectRecord.rate"));
			
			
			QianTouViewBean  qtvb=new QianTouViewBean();
			qtvb.setProjectID(rs.getInt("Project.projectID"));
			qtvb.setProjectName(rs.getString("projectName"));
			qtvb.setTaskMonth(rs.getInt("taskMonth"));
			qtvb.setResponsibleDepartemntName(rs.getString("Department.departmentName"));
			qtvb.setActualFinish(rs.getString("ProjectRecord.actualFinish"));
			qtvb.setRate(rs.getDouble("ProjectRecord.rate"));
			qtvb.setLeadCompanyView(rs.getString("leadCompanyView"));
			qtvb.setSeparateLeaderView(rs.getString("separateLeaderView"));
			qtvb.setSupervisionView(rs.getString("supervisionView"));
			
			list.add(qtvb);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return  list;	
}


/**
 * 督查室审核项目记录，通过/不通过，还要给意见
 * 一级审核
 * 就是对某条记录进行修改
 * 该函数没有实现事务功能，在后面要实现该功能
 */

public boolean	DuchaShen(int projectID,int taskMonth,double rate,String yijian,boolean tongguo){
	//通过，tongguo=true,false表示不通过
	String status;
	String column;
	if(taskMonth<10){
		column="progress0"+taskMonth;
	}else{
		column="progress"+taskMonth;
	}
	
	if(tongguo==true){
		status="TTT";
	}else{
		status="TTF";
	}
	
	String updateSQL="update ProjectRecord set status='"+status+"',SupervisionView='"+yijian+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	String updateProject="update  Project,TaskProgress set currentProgress=currentProgress+"+rate+"  where Project.projectId=49 and Project.projectid=TaskProgress.projectid";
	String updateTaskProgress="update  Project,TaskProgress set TaskProgress."+column+"=currentProgress  where Project.projectId="+projectID+" and Project.projectid=TaskProgress.projectid";

	
	int res= this.updateDB(updateSQL);
		if(res!=0){
				
		int res1=this.updateDB(updateProject);
		int res2=this.updateDB(updateTaskProgress);
		
			if(res1==1 &&res2==1)
				return  true;
			else
				return false;
		
		
		}else{
			return false;
		}
	}


}
