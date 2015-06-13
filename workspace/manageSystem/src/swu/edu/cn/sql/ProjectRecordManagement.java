package swu.edu.cn.sql;

import java.sql.ResultSet;
import java.util.*;
/**
 * 
 * @author  韩东海
 *该类主要完成对项目记录的操作，包括对项目记录的查询，更新，插入
 *该函数返回某责任部门某月的所有项目完成情况细节: public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month);
 *该函数返回某牵头部门某月的所有项目完成情况细节：public  LinkedList<String>	getLeadDepartmentTask(String departmentID,int Month)；
 *该函数返回所有项目完成情况细节,包括它的分类：       public  LinkedList<String>   getAllTask()；
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
 * 该函数返回某责任部门某月的所有项目完成情况细节
 */
public  LinkedList<String>	getResponsibleDepartmentTask(String departmentID,int Month){
	LinkedList<String>  list=new LinkedList<String>();
	
	String  cloumn;
	if(Month<10)
		cloumn="progress0"+Month;
	else
		cloumn="progress"+Month;
	System.out.println(cloumn);
	
	//责任部门是已知的，是该部门用户所在部门
	
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


}
