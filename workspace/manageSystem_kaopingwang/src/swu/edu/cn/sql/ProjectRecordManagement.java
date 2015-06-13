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
 * @author  ������
 *������Ҫ��ɶ���Ŀ��¼�Ĳ�������������Ŀ��¼�Ĳ�ѯ�����£�����
 *�����������Ŀ��¼����˼����
 *�ú�������ĳ���β���ĳ�µ�������Ŀ������ϸ��: public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month);
 *�ú�������ĳǣͷ����ĳ�µ�������Ŀ������ϸ�ڣ�public  LinkedList<String>	getLeadDepartmentTask(String departmentID,int Month)��
 *�ú�������������Ŀ������ϸ��,�������ķ��ࣺ       public  LinkedList<String>   getAllTask()��
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
		
		/**ǰͷ���Ų鿴�Լ��������Ŀ
		 * ���Գɹ�*/
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
	
		
		/**ǣͷ����������Ŀ
		 * ���Գɹ�
		prm.QianTouShen(39, 1, "��Ŀ�д��Ľ�", true);
		*/
		
		//ArrayList<QianTouViewBean> list=prm.QianTouLeaderViewList("ë����");
		//ǣͷ���쵼������Ŀ������ͨ��
		//prm.QianTouLeaderShen(39, 1, "��ͨ��", false);
		
		
//		prm.DuchaViewList();
//		prm.DuchaShen(39, 1, "��Ŀ�д��Ľ�", true);
//		prm.CloseDB();
	}
	
public ProjectRecordManagement(){
		super();
}



/**
 * 
 * �ú�������ĳ���β���ĳ�µ�������Ŀ������ϸ��
 * ʹ��֮ǰҪ����Ҫ�����ݿ�����
 * ͨ��status���ز�ͬ״̬����Ŀ��¼
 * status=%>>����
 * status=null>>δ�걨��������
 */
public  ArrayList<ProjectRecordBean>	getResponsibleDepartmentTask(int responsiDepartmentID,int Month,String status){
	ArrayList<ProjectRecordBean>  list=new ArrayList<ProjectRecordBean>();
		
	//���β�������֪�ģ��Ǹò����û����ڲ��ű��
	
//	String selectSQL="select Project.projectID,projectName,Project.comment,Project.currentProgress,Department.departmentName,status from ((project inner join Department on Project.leadDepartment=Department.departmentID  )left outer join ProjectRecord on   Project.projectID=ProjectRecord.projectID and taskMonth="+Month+"  ) where Project.responsibleDepartment='"+responsiDepartmentID+"' and status like '"+status +"';";
	String selectSQL="select Project.projectID,projectName,Project.expectTask,Project.currentProgress,Department.departmentName,status from ((project inner join Department on Project.leadDepartment=Department.departmentID  )left outer join ProjectRecord on   Project.projectID=ProjectRecord.projectID and taskMonth="+Month+" and status like '"+status +"' ) where Project.responsibleDepartment='"+responsiDepartmentID+"';";
	
//	String sql="select Project.projectID,projectName,Project.comment,Project.currentProgress,Department.departmentName,status from project,ProjectRecord,Department where Project.leadDepartment=Department.departmentID   and Project.projectID=ProjectRecord.projectID  and   ProjectRecord.taskMonth="+Month+" and  Project.responsibleDepartment='"+responsiDepartmentID+"'; ";
	System.out.println(selectSQL);
	ResultSet  rs=SelectDB(selectSQL);
	
	try {
		while(rs.next()){
			//rs.getString("status").equals(status)��ʾ��ѯ����
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
 * С�����������溯���е���
 */
public String CTS(String status,int i){
	char c=status.charAt(i);
	String res;
	if(c=='F')	res="<font style='color:red'>δͨ��</font>";
	else if(c=='T')	res="ͨ��";
	else res="������";
	
	return res;
}


/**
 * �ú�������ĳǣͷ����ĳ�µ�������Ŀ������ϸ��
 */

public  LinkedList<String>	getLeadDepartmentTask(String leadLepartmentID,int Month){
	LinkedList<String>  list=new LinkedList<String>();
	

	return list;
	
}

/**
 * �ú�������������Ŀ������ϸ��,�������ķ��࣬������辷�������ʾ
 * �ú����ڲ鿴������Ŀ������ʹ��
 *
 */

public LinkedList<String> getAllProjectRecord(){
	LinkedList<String>  list=new LinkedList<String>();
	
	return  list;
	
}

/**
 * 
 * �ú�����ѯһ����Ŀ��¼�Ƿ���ڣ������걨ҵ����ʱ��������Ƿ��ظ��ύ��
 * ����false��ʾû���ظ��ļ�¼����,
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



/**************************************���β��ŵ���Ϊ******************************************
 * �ϱ��������
 * �ú�������һ���µ���Ŀ��¼,�ü�¼���������Ŀ�����������·ݣ����ʱ�䣨����������ɱ������ύʱ��
 * �ú��������β���������
 * ����Ŀ��¼�ύ�ɹ����״̬Ϊ000����ʾһ������
 * Ĭ�ϸü�¼�����ڣ�������ڵļ�¼ֻ���ϼ���ʾ
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
 *���β��Ŷ���δͨ���ļ�¼Ҫ���¿�ʼ�ύ
 *ֻҪ��һ��û�б�ͨ�����ͽв�ͨ��
 */
public int	reReportProjectRecord(int projectID,int taskMonth,String actualFinish,double  rate, String submitTime ){
	

	String updateSQL="update ProjectRecord set status='000',rate="+rate+",actualFinish='"+actualFinish+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}



//�鿴�ύʧ�ܻ���ʧ�ܵļ�¼


/************************************ǣͷ���ŵ���Ϊ*************************************************
 * ǣͷ����ɸѡ�������Լ��������Ŀ��¼
 * ʹ��֮ǰ���ô����ݿ�����
 * ������ǣͷ����������
 * ������Ŀ��¼����
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
 * ǣͷ�����������Ŀ��¼��ͨ��/��ͨ������Ҫ�����
 * һ�����
 * ���Ƕ�ĳ����¼�����޸�
 */

public int	QianTouShen(int projectID,int taskMonth,String yijian,boolean tongguo){
	//ͨ��status=T00����ͨ��ΪF00
	String status;
	if(tongguo==true){
		status="T00";
	}else{
		status="F00";
	}
	
	String updateSQL="update ProjectRecord set status='"+status+"',leadCompanyView='"+yijian+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}

/*****************************************ǣͷ���쵼����Ϊ************************************************************
 * ǣͷ���쵼ɸѡ�������Լ��������Ŀ��¼
 * ǣͷ���쵼ֻ�ܿ�����һ����ǣͷ���ţ����ͨ������Ŀ
 * ʹ��֮ǰ���ô����ݿ�����
 * ������ǣͷ���쵼����������¼�󱣴���session�У���
 * ������Ŀ��¼����
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
 * ǣͷ���쵼�������Ŀ��¼��ͨ��/��ͨ������Ҫ�����
 * һ�����
 * ���Ƕ�ĳ����¼�����޸�
 */

public int	QianTouLeaderShen(int projectID,int taskMonth,String yijian,boolean tongguo){
	//ͨ����tongguo=true
	String status;
	if(tongguo==true){
		status="TT0";
	}else{
		status="TF0";
	}
	
	String updateSQL="update ProjectRecord set status='"+status+"',separateLeaderView='"+yijian+"' where projectID="+projectID+" and taskMonth="+taskMonth;
	
	return this.updateDB(updateSQL);
		
}




/*****************************************���붽�����Ϊ*************************************************
 * ������ɸѡ�������Լ��������Ŀ��¼
 * ����ֻ�ܿ�����һ����ǣͷ���쵼�����ͨ������Ŀ
 * ������Ŀ��Ҫ������������ˣ�
 * ʹ��֮ǰ���ô����ݿ�����
 * ������Ŀ��¼����
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
 * �����������Ŀ��¼��ͨ��/��ͨ������Ҫ�����
 * һ�����
 * ���Ƕ�ĳ����¼�����޸�
 * �ú���û��ʵ�������ܣ��ں���Ҫʵ�ָù���
 */

public boolean	DuchaShen(int projectID,int taskMonth,double rate,String yijian,boolean tongguo){
	//ͨ����tongguo=true,false��ʾ��ͨ��
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
