package com.git.datatype;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.faces.component.UIParameter;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.model.DataModel;

import com.git.fetchpage.DataPage;
import com.git.fetchpage.PagedListDataModel;
import com.git.datatype.DataTypeList;

public class DataTypeModel {
	DataModel dataModel;

	private int dataTypeid;

	private String dataTypecode;

	private String programuse;

	private String databaseuse;

	private String dtdescription;

	private String dtExpand;

	private Boolean dtstatus;

	private String dtremark;

	private String dtabbreviation;

	private Date updatetime;

	private Timestamp TimeStamp;

	private String DTV1;

	private String DTV2;

	private String DTV3;

	public String getDatabaseuse() {
		return databaseuse;
	}

	public void setDatabaseuse(String databaseuse) {
		this.databaseuse = databaseuse;
	}

	public String getDataTypecode() {
		return dataTypecode;
	}

	public void setDataTypecode(String dataTypecode) {
		this.dataTypecode = dataTypecode;
	}

	public int getDataTypeid() {
		return dataTypeid;
	}

	public void setDataTypeid(int dataTypeid) {
		this.dataTypeid = dataTypeid;
	}

	public String getDtabbreviation() {
		return dtabbreviation;
	}

	public void setDtabbreviation(String dtabbreviation) {
		this.dtabbreviation = dtabbreviation;
	}

	public String getDtdescription() {
		return dtdescription;
	}

	public void setDtdescription(String dtdescription) {
		this.dtdescription = dtdescription;
	}

	public String getDtExpand() {
		return dtExpand;
	}

	public void setDtExpand(String dtExpand) {
		this.dtExpand = dtExpand;
	}

	public String getDtremark() {
		return dtremark;
	}

	public void setDtremark(String dtremark) {
		this.dtremark = dtremark;
	}

	public void setDtstatus(Boolean dtstatus) {
		this.dtstatus = dtstatus;
	}

	public Boolean getDtstatus() {
		return dtstatus;
	}

	public String getDTV1() {
		return DTV1;
	}

	public void setDTV1(String dtv1) {
		DTV1 = dtv1;
	}

	public String getDTV2() {
		return DTV2;
	}

	public void setDTV2(String dtv2) {
		DTV2 = dtv2;
	}

	public String getDTV3() {
		return DTV3;
	}

	public void setDTV3(String dtv3) {
		DTV3 = dtv3;
	}

	public String getProgramuse() {
		return programuse;
	}

	public void setProgramuse(String programuse) {
		this.programuse = programuse;
	}

	public Timestamp getTimeStamp() {
		return TimeStamp;
	}

	public void setTimeStamp(Timestamp timeStamp) {
		TimeStamp = timeStamp;
	}

	public Date getUpdatetime() {
		return updatetime;
	}

	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}

	public void setDataType(DataTypeModel datatype) {

		this.setDataTypecode(datatype.getDataTypecode());
		this.setDataTypeid(datatype.getDataTypeid());
		this.setDtabbreviation(datatype.getDtabbreviation());
		this.setDtdescription(datatype.getDtdescription());
		this.setDtExpand(datatype.getDtExpand());
		this.setDtremark(datatype.getDtremark());
		this.setDtstatus(datatype.getDtstatus());
		this.setDTV1(datatype.getDTV1());
		this.setDTV2(datatype.getDTV2());
		this.setDTV3(datatype.getDTV3());
		this.setProgramuse(datatype.getProgramuse());
		this.setDatabaseuse(datatype.getDatabaseuse());
		this.setUpdatetime(datatype.getUpdatetime());
		this.setTimeStamp(datatype.getTimeStamp());

	}

	public DataTypeModel getDataType() {
		DataTypeModel DataType = new DataTypeModel();
		DataType.dataTypeid = this.getDataTypeid();
		DataType.dataTypecode = this.getDataTypecode();
		DataType.programuse = this.getProgramuse();
		DataType.databaseuse = this.getDatabaseuse();
		DataType.dtdescription = this.getDtdescription();
		DataType.dtExpand = this.getDtExpand();
		DataType.dtstatus = this.getDtstatus();
		DataType.dtremark = this.getDtremark();
		DataType.dtabbreviation = this.getDtabbreviation();
		DataType.updatetime = this.getUpdatetime();
		DataType.TimeStamp = this.getTimeStamp();
		DataType.DTV1 = this.getDTV1();
		DataType.DTV2 = this.getDTV2();
		DataType.DTV3 = this.getDTV3();

		return DataType;
	}

	/**
	 * 初始化数据类型的事件
	 * 
	 * @param event
	 */
	public void initDataType(ActionEvent event) {
		this.setDataType(new DataTypeModel());

	}

	/**
	 * 保存数据类型的事件
	 * 
	 * @param event
	 */
	public void saveDataType(ActionEvent event) {
		SeMetoDAO sm = new SeMetoDAO();
		Map session = FacesContext.getCurrentInstance().getExternalContext()
				.getSessionMap();
		sm.saveToDB(this.getDataType(), session);
		
	}

	/**
	 * 
	 * @param event
	 */
	public void updateDataType(ActionEvent event) {
		SeMetoDAO sm = new SeMetoDAO();
		Map session = FacesContext.getCurrentInstance().getExternalContext()
				.getSessionMap();
		sm.updateToDB(this.getDataType(), session);
		
// FacesContext.getCurrentInstance().

	}

	/**
	 * 查询数据类型的事件
	 * 
	 * @param event
	 */
	public void selectDataType(ActionEvent event) {
		SeMetoDAO sm = new SeMetoDAO();
		Map session = FacesContext.getCurrentInstance().getExternalContext()
				.getSessionMap();
		UIParameter component = (UIParameter) event.getComponent()
				.findComponent("editId");
		int id = Integer.parseInt(component.getValue().toString());
		
		this.setDataType(sm.loadDataTypeById(id, session));
		
	}

	/**
	 * 删除数据类型的事件
	 * 
	 * @param event
	 */
	public void deleteDataType(ActionEvent event) {
		SeMetoDAO sm = new SeMetoDAO();
		Map session = FacesContext.getCurrentInstance().getExternalContext()
				.getSessionMap();
		UIParameter component = (UIParameter) event.getComponent()
				.findComponent("deleteId");
		int id = Integer.parseInt(component.getValue().toString());
		sm.deleteDataTypeById(id, session);

		// System.out.println("D取到的ID为:"+id);
		// System.out.println("D取到的hashCode为:"+session.hashCode());
		// System.out.println("D取到的size为:"+session.size());
		// System.out.println("D取到的toString为:"+session.toString());
	}
	
	 private DataPage getDataPage(int startRow, int pageSize) {
		    // 连数据库
		 DataTypeList dtList=new DataTypeList();
		 System.out.println(dtList.list.size());
		 
		 return new DataPage(dtList.list.size(),1,(List)dtList.list);
		 
		 
		  }
	 
		  public DataModel getDataModel() {
		    if (dataModel == null) {
		        dataModel = new LocalDataModel(10);
		        
//		        dataModel = new LocalDataModel(getRowsPerPage());
		    }
		    return dataModel;
		  }
		  
		  private class LocalDataModel extends PagedListDataModel {
		    public LocalDataModel(int pageSize) {
		        super(pageSize);
		    }
		    
		    public DataPage fetchPage(int startRow, int pageSize) {
		        
		        return getDataPage(startRow, pageSize);
		    }


		  }
}
