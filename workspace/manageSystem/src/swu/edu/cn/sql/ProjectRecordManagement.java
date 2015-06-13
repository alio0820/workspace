package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.util.*;
/**
 * 
 * @author  ������
 *������Ҫ��ɶ���Ŀ��¼�Ĳ�������������Ŀ��¼�Ĳ�ѯ�����£�����
 *�ú�������ĳ���β���ĳ�µ�������Ŀ������ϸ��: public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month);
 *�ú�������ĳǣͷ����ĳ�µ�������Ŀ������ϸ�ڣ�public  LinkedList<String>	getLeadDepartmentTask(String departmentID,int Month)��
 *�ú�������������Ŀ������ϸ��,�������ķ��ࣺ       public  LinkedList<String>   getAllTask()��
 */


public class ProjectRecordManagement extends DBConnection{
	
	
	public static void main(String [] args){
		ProjectRecordManagement prm=new ProjectRecordManagement();
		prm.OpenDB();
		
		prm.getResponsibleDepartmentTask("yuan001", 2);
		prm.CloseDB();
		
	}
	
public ProjectRecordManagement(){
		super();
}



/**
 * 
 * �ú�������ĳ���β���ĳ�µ�������Ŀ������ϸ��
 */
public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month){
	LinkedList<String>  list=new LinkedList<String>();
	
	String  cloumn;
	if(Month<10)
		cloumn="progress0"+Month;
	else
		cloumn="progress"+Month;
	System.out.println(cloumn);
	
	//���β�������֪�ģ��Ǹò����û����ڲ���
	
//	String selectSQL="select projectName,Department.departmentName,"+cloumn+", " +"status from (((project left outer join  ProjectRecord on  Project.projectID=ProjectRecord.projectID and taskMonth="+Month+") left outer   join   TaskProgress   on   TaskProgress.departmentID=Project.projectID  and TaskProgress.projectID=ProjectRecord.projectID )left outer   join   Department   on   Department.departmentID=Project.leadDepartment) where Project.responsibleDepartment='"+departmentID+"'; ";

	String selectSQL="select Project.projectID,projectName,Department.departmentName,"+cloumn+", " +"status from (((project left outer join  ProjectRecord on   Project.projectID=ProjectRecord.projectID and taskMonth="+Month+"  ) left outer   join   TaskProgress   on   TaskProgress.projectID=ProjectRecord.projectID  )left outer   join   Department   on   Department.departmentID=Project.leadDepartment) where Project.responsibleDepartment='"+departmentID+"'; ";

	
	System.out.println(selectSQL);
	ResultSet  rs=SelectDB(selectSQL);
	
	list=ResultSetToList(rs);
		
	while(!list.isEmpty()){
		System.out.println(list.getFirst());
		list.removeFirst();
	}

	return list;
	
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


}
