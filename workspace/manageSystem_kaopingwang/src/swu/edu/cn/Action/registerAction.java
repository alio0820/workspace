package swu.edu.cn.Action;

import swu.edu.cn.sql.UserManagement;

public class registerAction {
	private String user;
	private String password;
	private String name;
	private String  department;
	private String officialPosition;
	private String select1;
	UserManagement  userManager=new UserManagement();
	
	
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getUser() {
		return user;
	}
	public void setUser(String user) {
		this.user = user;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSelect1() {
		return select1;
	}
	public void setSelect1(String select1) {
		this.select1 = select1;
	}	
	public String getOfficialPosition() {
		return officialPosition;
	}
	public void setOfficialPosition(String officialPosition) {
		this.officialPosition = officialPosition;
	}
	
	
	public String register(){		
		boolean  succ=false;
		String table;
		userManager.OpenDB();
		if(select1.equals("部门")){
			int department_int =Integer.parseInt(department);
			table="departmentuser";
			if(!userManager.isUserExist(user, table, "userName")){
				succ = userManager.createDepartmentUser(user, password, department_int, name);			
			}
		}
		else {
			table="separateleader";
			if(!userManager.isUserExist(user, table, "userName")){
				succ = userManager.createSeparateLeader(user,password,name, "组织部");		
			}
		}
		
		if(succ==true)
			return "success";
		else
			return "input";
	}
}

	