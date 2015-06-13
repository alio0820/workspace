package com.web.office.addressbook;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.web.office.bean.AddressbookBean;
import com.web.office.common.DBConnection;
//@RemoteProxy(name="AddressbookAction")
@SuppressWarnings("serial")
public class AddressbookAction extends ActionSupport{
	private List<AddressbookBean> mylist;
	private String search;		//是否搜索
	private String rows;		//查询条数
	private String page;		//查询页码
	private String sidx;		//查询关键字
	private String sord;		//asc升序；desc降序
	private String filters;		//其他条件	
	//	@RemoteMethod
	public String getAddressbook(){
		DBConnection db = new DBConnection();
		db.OpenDB();
		Connection conn = db.getConn();
		List<AddressbookBean> abbList = new ArrayList<AddressbookBean>();		
		PreparedStatement ps=null;
		ResultSet rs=null;
		String sql = "";
		if(search.equals("false")){
			if(filters==null||filters.equals("")){
				filters ="1=1";
			}
			if(sidx.equals("")){
				sidx="id";
			}
			int begin = (Integer.parseInt(page)-1)*Integer.parseInt(rows);
			sql = "select * from relationInfo where 1=1 and "+filters+" order by "+sidx+" "+sord+" limit "+begin+","+rows;
		}
		else{
			sql="select * from relationInfo where 1=1";
		}
		try {
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();		
			while(rs.next()){
				AddressbookBean abb = new AddressbookBean();
				abb.setId(rs.getInt("id"));
				abb.setName(rs.getString("name"));
				abb.setSex(rs.getString("sex"));
				abb.setCellphone(rs.getString("cellphone"));
				abb.setCompanyAddress(rs.getString("companyAddress"));
				abb.setCompanyName(rs.getString("companyName"));
				abb.setCompanyPhone(rs.getString("companyPhone"));
				abb.setCompanyWebsite(rs.getString("companyWebsite"));
				abb.setEmail(rs.getString("email"));
				abb.setFax(rs.getString("fax"));
				abb.setGrade(rs.getString("grade"));
				abb.setGraduateSchool(rs.getString("graduateSchool"));
				abb.setHobby(rs.getString("hobby"));
				abb.setHomeAddress(rs.getString("homeAddress"));
				abb.setHomephone(rs.getString("homephone"));
				abb.setMSN(rs.getString("MSN"));
				abb.setPosition(rs.getString("position"));
				abb.setPostcode(rs.getString("postcode"));
				abb.setProfession(rs.getString("profession"));
				abb.setQQ(rs.getString("QQ"));
				abb.setBirthday(rs.getString("birthday"));
				abbList.add(abb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}		
		db.CloseDB();
		this.setMylist(abbList);
		return "success";
	}
	public List<AddressbookBean> getMylist() {
		return mylist;
	}
	public void setMylist(List<AddressbookBean> mylist) {
		this.mylist = mylist;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getRows() {
		return rows;
	}
	public void setRows(String rows) {
		this.rows = rows;
	}
	public String getPage() {
		return page;
	}
	public void setPage(String page) {
		this.page = page;
	}
	public String getSidx() {
		return sidx;
	}
	public void setSidx(String sidx) {
		this.sidx = sidx;
	}
	public String getSord() {
		return sord;
	}
	public void setSord(String sord) {
		this.sord = sord;
	}
	public String getFilters() {
		return filters;
	}
	public void setFilters(String filters) {
		this.filters = filters;
	}
}
