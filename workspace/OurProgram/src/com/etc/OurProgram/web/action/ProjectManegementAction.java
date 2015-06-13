package com.etc.OurProgram.web.action;


import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.etc.OurProgram.javabean.ProjectManegement;
import com.etc.OurProgram.javabean.Unit;
import com.etc.OurProgram.service.ProjectManeServce;
import com.etc.OurProgram.service.impl.ProjectManeServceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;



public class ProjectManegementAction extends ActionSupport{

	private int id;
	private String projectID;
	private String projectName;
	
	private int datumNumber;
	private String unit;
	private String lineNumber;
	private String pigeonholeLeader;
	private Date setupDate;
	private String teammates;
	private String stutas;
	private String describe;
	private String pigeonholeType;
	private Date submitDate;
	private String auditingAttitude;
	private String assessor;
	private Date pigeonholeDate;
	private List<ProjectManegement> list;
    int i=0;
    private int k;
    private int pageNow=1; 
    private int pageSize =5;
    private int intRowCount;
    private int intPageCount;
	
	
	
	
	




	/**
	 * 添加项目
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public String add() throws UnsupportedEncodingException 
	{

		
		ProjectManeServce pms=new ProjectManeServceImpl();
		ProjectManegement pm =new ProjectManegement();
        pm.setProjectID(projectID);
        pm.setProjectName(projectName);
        pm.setDatumNumber(Integer.parseInt("0"));
        pm.setUnit(unit);
        pm.setLineNumber(lineNumber);
        pm.setPigeonholeLeader(pigeonholeLeader);
        pm.setSetupDate(setupDate);
        pm.setTeammates(teammates);
        pm.setDescribe(describe);
        pm.setPigeonholeType("");
    	pm.setAuditingAttitude("");
		pm.setAssessor("");	
        pm.setSubmitDate(new Date());		
		pm.setPigeonholeDate(new Date());
 
		/*SimpleDateFormat dtCurrent=new   SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		Date date2 = null;
		try {
			date2 = dtCurrent.parse(dtCurrent.format(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}*/
	   
	 
		Date date2 = new Date();
		
        if((pm.getSetupDate()).compareTo(date2)<0)
        {
        	pm.setStutas ("进行中");
        	
        }
        else
        {
        	pm.setStutas("未进行");
        	
        }
        
      
		boolean flag=pms.add(pm);
		if(flag==true){
			ProjectManeServce pms2=new ProjectManeServceImpl();		
			list=pms2.query(i, pageSize); 
			return "suce";
		}
		else
		{
			
			return INPUT;
		}
		
	}
	
	
	/**
	 * 加载项目
	 * @return
	 */
  public String showList(){
	ProjectManeServce pms=new ProjectManeServceImpl();
	
	list=pms.query(i, pageSize);  //此ist为私有变量的list不能新建List list
	intRowCount=pms.count();
   // System.out.println(intRowCount);
	if(list.size()!=0)
		return "suce";
	else
	{
		return "INPUT";
	}
}


  
  /**
   * 删除项目
   * @return
   */
	public String deleteProject(){
		ProjectManeServce pms=new ProjectManeServceImpl();
		ProjectManegement pm =new ProjectManegement();
		pm.setId(id);
		boolean flag=pms.delete(pm);
		if(flag==true)
		{
			ProjectManeServce pms2=new ProjectManeServceImpl();		
			list=pms2.query(i, pageSize); 
			return "suce";
		}
		else
		{
			
			return INPUT;
		}
	}
	
	@SuppressWarnings("deprecation")
	public String updateProject(){
		
		ProjectManeServce pms=new ProjectManeServceImpl();
		ProjectManegement pm =new ProjectManegement();
		    pm.setProjectID(projectID);
	        pm.setProjectName(projectName);
	        pm.setDatumNumber(Integer.parseInt("0"));
	        pm.setUnit(unit);
	        pm.setLineNumber(lineNumber);
	        pm.setPigeonholeLeader(pigeonholeLeader);
	        pm.setSetupDate(setupDate);
	        pm.setTeammates(teammates);
	        pm.setDescribe(describe);
	        pm.setPigeonholeType("");
	    	pm.setAuditingAttitude("");
			pm.setAssessor("");
			pm.setSubmitDate(null);
			pm.setPigeonholeDate(null);
		/*	Date d=new Date();
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			c.setTime(d);
			c.add(Calendar.YEAR, 2);
			d = c.getTime();
			System.out.println(d);
	        pm.setSubmitDate(d);*/

			
			SimpleDateFormat dtCurrent=new   SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			Date date2 = null;
			

			try {
				date2 = dtCurrent.parse(dtCurrent.format(date));
			} catch (ParseException e) {
				e.printStackTrace();
			}
			try{
	        if((pm.getSetupDate()).compareTo(date2)<0)
	        {
	        	pm.setStutas ("进行中");
	        	
	        }
	        else
	        {
	        	pm.setStutas("未进行");
	        	
	        }}
			catch(Exception e){
				e.printStackTrace();
			}
	        	
		  pm.setId(id);
		  boolean flag=pms.update(pm);
		  if(flag==true){
				ProjectManeServce pms2=new ProjectManeServceImpl();		
				list=pms2.query(i, pageSize); 
				return "suce";
			}
		  else
		  {
			
			return INPUT;
		  }
	}
	
	
	
	@Override

    public String execute() throws Exception {
	HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
         request.getSession().setAttribute("intRowCount", 123);
         ProjectManeServce npage=new ProjectManeServceImpl();
        intRowCount = npage.count();
        k=(intRowCount + pageSize - 1) / pageSize;
        intPageCount = (intRowCount + pageSize - 1) / pageSize;
        if(pageNow<1){
            pageNow=1;
        }
        
        if(pageNow > intPageCount)
             pageNow=intPageCount;
             i = (pageNow -1)*pageSize;
        ProjectManeServce nlist=new ProjectManeServceImpl();
        if(null!=nlist.query(i,pageSize)){
        	list = nlist.query(i,pageSize);
            return "suce";
        }else{
            return  INPUT;
        }
    }

	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}
	
	public String getLineNumber() {
		return lineNumber;
	}
	public void setLineNumber(String lineNumber) {
		this.lineNumber = lineNumber;
	}
	public String getTeammates() {
		return teammates;
	}
	public void setTeammates(String teammates) {
		this.teammates = teammates;
	}
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public String getPigeonholeType() {
		return pigeonholeType;
	}
	public void setPigeonholeType(String pigeonholeType) {
		this.pigeonholeType = pigeonholeType;
	}
	public Date getSubmitDate() {
		return submitDate;
	}
	public void setSubmitDate(Date submitDate) {
		this.submitDate = submitDate;
	}
	public String getAuditingAttitude() {
		return auditingAttitude;
	}
	public void setAuditingAttitude(String auditingAttitude) {
		this.auditingAttitude = auditingAttitude;
	}
	public String getAssessor() {
		return assessor;
	}
	public void setAssessor(String assessor) {
		this.assessor = assessor;
	}
	public Date getPigeonholeDate() {
		return pigeonholeDate;
	}
	public void setPigeonholeDate(Date pigeonholeDate) {
		this.pigeonholeDate = pigeonholeDate;
	}
	
	

	public List<ProjectManegement> getList() {
		return list;
	}

	public void setList(List<ProjectManegement> list) {
		this.list = list;
	}

	public int getDatumNumber() {
		return datumNumber;
	}

	public void setDatumNumber(int datumNumber) {
		this.datumNumber = datumNumber;
	}

	public String getProjectName() {
		return projectName;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public String getProjectID() {
		return projectID;
	}

	public void setProjectID(String projectID) {
		this.projectID = projectID;
	}


	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Date getSetupDate() {
		return setupDate;
	}



	public void setSetupDate(Date setupDate) {
		this.setupDate = setupDate;
	}



	public String getPigeonholeLeader() {
		return pigeonholeLeader;
	}

	public void setPigeonholeLeader(String pigeonholeLeader) {
		this.pigeonholeLeader = pigeonholeLeader;
	}


	public String getStutas() {
		return stutas;
	}


	public void setStutas(String stutas) {
		this.stutas = stutas;
	}


	public int getK() {
		return k;
	}


	public void setK(int k) {
		this.k = k;
	}


	public int getPageNow() {
		return pageNow;
	}


	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}


	public int getPageSize() {
		return pageSize;
	}


	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}


	public int getIntRowCount() {
		return intRowCount;
	}


	public void setIntRowCount(int intRowCount) {
		this.intRowCount = intRowCount;
	}


	public int getIntPageCount() {
		return intPageCount;
	}


	public void setIntPageCount(int intPageCount) {
		this.intPageCount = intPageCount;
	}
	
	

}



