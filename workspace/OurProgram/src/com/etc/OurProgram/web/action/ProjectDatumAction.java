package com.etc.OurProgram.web.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.etc.OurProgram.javabean.ProjectDatum;
import com.etc.OurProgram.service.ProjectDatumService;
import com.etc.OurProgram.service.ProjectManeServce;
import com.etc.OurProgram.service.impl.ProjectDatumServiceImpl;
import com.etc.OurProgram.service.impl.ProjectManeServceImpl;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ProjectDatumAction extends ActionSupport{
	
    private static final String INPUT = null;
	private int id;   
    private String datumName;
    private String saveTerm;
    private String datumRoute;
    private String datumAttribute;
    private Date datumSetupDate;
    private String desciption;
    private String auditingAttitude;
    private int projectID;   //从前一个页面传回来的项目的主键，即资料的外键
    private String projectName;
   



	private List<ProjectDatum> list;
    private File ff;
	private String ffFileName;
	private String ffContentType;	
	private InputStream fis;
	private String fisFileName;
    int i=0;
    private int k;
    private int pageNow=1; 
    private int pageSize =4;
    private int intRowCount;
    private int intPageCount;
 

	
	public String add() throws IOException{
    	ProjectDatumService pds=new ProjectDatumServiceImpl();
    	ProjectDatum pd=new ProjectDatum();
    	
         projectID = (Integer)ActionContext.getContext().getSession().get("projectID");
         projectName=(String)ActionContext.getContext().getSession().get("projectName");
        
    	pd.setDatumName(datumName);
    	pd.setSaveTerm(saveTerm);
    	pd.setDatumRoute(datumRoute);
    	pd.setDatumAttribute(datumAttribute);
    	pd.setDatumSetupDate(datumSetupDate);
    	pd.setDesciption(desciption);
    	pd.setAuditingAttitude("");
    	pd.setProjectID(projectID);

        //System.out.println("*****************"+projectID);
    	boolean flag=pds.add(pd);
    	
		if(flag==true){
			{ 			
	 			ProjectDatumService pds2=new ProjectDatumServiceImpl();
	 	    	ProjectDatum pd2=new ProjectDatum();
	 	    	pd2.setProjectID(projectID);
	 	    	list=pds2.queryAll(pd2); 
	 	    	
	 	    	FileOutputStream fos = new FileOutputStream("D:/MyDocument/workspace/OurProgram/WebRoot/fileupdown/"+datumName+".doc");
	 			FileInputStream fis = new FileInputStream(datumRoute);
	 			byte[] b = new byte[1024];
	 			while(fis.read(b)!=-1){
	 				fos.write(b);
	 			}
	 			fos.close();
	 			fis.close();
	 			
	 			return "suce";
	 		}
		}
		else
		{
			
			return INPUT;
		}
    	
    }
    
    public String showList(){
    	
    	ProjectDatumService pds=new ProjectDatumServiceImpl();
    	ProjectDatum pd=new ProjectDatum();  	
    	pd.setProjectID(projectID);
    	ActionContext.getContext().getSession().put("projectID", projectID);
    	ActionContext.getContext().getSession().put("projectName", projectName);
    	list=pds.query(pd,i,pageSize); 
    	intRowCount=pds.count(pd); 	
    	return "suce";
    
    }
    
    
    public String delete()
    {
    	
    	ProjectDatumService pms=new ProjectDatumServiceImpl();
    	ProjectDatum pd=new ProjectDatum();   
		pd.setId(id);
		pd.setProjectID(projectID);
		boolean flag=pms.delete(pd);
		if(flag==true){
			ProjectDatumService pds2=new ProjectDatumServiceImpl();
	    	ProjectDatum pd2=new ProjectDatum();
	    	pd2.setProjectID(projectID);
	    	
	    	list=pds2.queryAll(pd2); 
 			return "suce";
 		}
		else
		{
			
			return INPUT;
		}
    	
    }
    
    
    
     public String update()
     {
    	ProjectDatumService pds=new ProjectDatumServiceImpl();
     	ProjectDatum pd=new ProjectDatum();
        pd.setId(id);
     	pd.setDatumName(datumName);
    	pd.setSaveTerm(saveTerm);
    	pd.setDatumRoute(datumRoute);
    	pd.setDatumAttribute(datumAttribute);
    	pd.setDatumSetupDate(datumSetupDate);
    	pd.setDesciption(desciption);
    	pd.setAuditingAttitude("");
    	pd.setProjectID(projectID);
     	
     	boolean flag=pds.update(pd);
 		if(flag==true){
 			
 			ProjectDatumService pds2=new ProjectDatumServiceImpl();
 	    	ProjectDatum pd2=new ProjectDatum();
 	    	pd2.setProjectID(projectID);
 	    	list=pds2.queryAll(pd2); 
 			return "suce";
 		}
 		else
 		{
 			
 			return INPUT;
 		}
    
   
    }
    
     public String execute() throws Exception {
    		HttpServletRequest request=(HttpServletRequest)ActionContext.getContext().get(org.apache.struts2.StrutsStatics.HTTP_REQUEST);
    	         request.getSession().setAttribute("intRowCount", 123);
    	         ProjectDatumService npage=new ProjectDatumServiceImpl();
    	         ProjectDatum pd=new ProjectDatum();
    	         pd.setId(id);
    	         pd.setProjectID(projectID);
    	      
    	        intRowCount = npage.count(pd);  //数据库中数据个数
    	        k=(intRowCount + pageSize - 1) / pageSize;  
    	        intPageCount = (intRowCount + pageSize - 1) / pageSize;
    	        if(pageNow<1){
    	            pageNow=1;
    	        }
    	        
    	        if(pageNow > intPageCount)
    	             pageNow=intPageCount;
    	             i = (pageNow -1)*pageSize;
    	             ProjectDatumService nlist=new ProjectDatumServiceImpl();
    	    	//System.out.println("----:"+i);
    	        if(null!=nlist.query(pd,i,pageSize)){
    	        
    	        	list = nlist.query(pd,i,pageSize);
    	            return "suce";
    	        }else{
    	            return  INPUT;
    	        }
    	    }
     
     
     
		public String getSaveTerm() {
		return saveTerm;
	}
	public void setSaveTerm(String saveTerm) {
		this.saveTerm = saveTerm;
	}
	public String getDatumRoute() {
		return datumRoute;
	}
	public void setDatumRoute(String datumRoute) {
		this.datumRoute = datumRoute;
	}
	public String getDesciption() {
		return desciption;
	}
	public void setDesciption(String desciption) {
		this.desciption = desciption;
	}
	public String getAuditingAttitude() {
		return auditingAttitude;
	}
	public void setAuditingAttitude(String auditingAttitude) {
		this.auditingAttitude = auditingAttitude;
	}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getDatumName() {
			return datumName;
		}
		public void setDatumName(String datumName) {
			this.datumName = datumName;
		}
		public String getDatumAttribute() {
			return datumAttribute;
		}
		public void setDatumAttribute(String datumAttribute) {
			this.datumAttribute = datumAttribute;
		}
		public Date getDatumSetupDate() {
			return datumSetupDate;
		}
		public void setDatumSetupDate(Date datumSetupDate) {
			this.datumSetupDate = datumSetupDate;
		}
		public int getProjectID() {
			return projectID;
		}
		public void setProjectID(int projectID) {
			this.projectID = projectID;
		}
		
		   public List<ProjectDatum> getList() {
				return list;
			}

			public void setList(List<ProjectDatum> list) {
				this.list = list;
			}

			public File getFf() {
				return ff;
			}

			public void setFf(File ff) {
				this.ff = ff;
			}

			public String getFfFileName() {
				return ffFileName;
			}

			public void setFfFileName(String ffFileName) {
				this.ffFileName = ffFileName;
			}

			public String getFfContentType() {
				return ffContentType;
			}

			public void setFfContentType(String ffContentType) {
				this.ffContentType = ffContentType;
			}

			public InputStream getFis() {
				return fis;
			}

			public void setFis(InputStream fis) {
				this.fis = fis;
			}

			public String getFisFileName() {
				return fisFileName;
			}

			public void setFisFileName(String fisFileName) {
				this.fisFileName = fisFileName;
			}

			public static String getInput() {
				return INPUT;
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
			   public String getProjectName() {
					return projectName;
				}

				public void setProjectName(String projectName) {
					this.projectName = projectName;
				}

}
