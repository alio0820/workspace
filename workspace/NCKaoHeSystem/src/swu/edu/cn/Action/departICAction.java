package swu.edu.cn.Action;

import swu.edu.cn.sql.ProjectManagement;

public class departICAction {
	private String dpId;
	private String evaId;
	private String dpName;
	public String getDpId() {
		return dpId;
	}
	public void setDpId(String dpId) {
		this.dpId = dpId;
	}
	public String getEvaId() {
		return evaId;
	}
	public void setEvaId(String evaId) {
		this.evaId = evaId;
	}	
	public String getDpName() {
		return dpName;
	}
	public void setDpName(String dpName) {
		this.dpName = dpName;
	}
	
	
	public String classify(){
		System.out.println(dpId);
		System.out.println(dpName);
		System.out.println(evaId);
		ProjectManagement  pm=new ProjectManagement();
		pm.OpenDB();
		boolean bl = pm.isDepartmentUndertakeProject(evaId,dpId);
		if(bl)
			return "1";
		else
			return "2";
	}
}
