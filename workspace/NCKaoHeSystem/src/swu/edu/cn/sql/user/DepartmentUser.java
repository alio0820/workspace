package swu.edu.cn.sql.user;
import  swu.edu.cn.sql.*;

/**
 *作者	韩东海
 *日期	2012-05-08
 *功能	该类是部门用户的实体，包括部门用户的全部数据及操作，其中最重要的是责任部门角色（被考核部门）和牵头部门角色
 *责任角色（被考核部门）负责每月向上申报每月完成的情况，有项目的汇报项目完成情况，没有项目的汇报每月辅助完成情况，特别注意涉及资金考核的必须汇报资金
 *牵头部门负责审核责任角色（被考核部门）每月上报的数据，并给出适当意见
 */
public class DepartmentUser extends UserManagement  {
	
	String departmentId;				//部门编号，首先得判断该部门是否承担项目,前提是该部门属于某考核指标
	
	public DepartmentUser(){
		
	}

	public DepartmentUser(String departmentId){
		this.departmentId=departmentId;
	}
	
/**************************************************************************************************************/
	
	
	
	
	

}
