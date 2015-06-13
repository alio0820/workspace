package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.javabean.financeUser;
import com.etc.OurProgram.service.financeUpdateService;
import com.etc.OurProgram.service.impl.financeUpdateServiceImpl;
import com.opensymphony.xwork2.ActionSupport;

public class financeUpdateAction extends ActionSupport {
    private int  id;
    private String Date;
	private String Own_project;
	private String Money;
	private String Borrow_object;
	private String Pay_way;
	private String Government_buystyle;
	private String Government_buysite;
	private String ProofID;
	private String Contract_special;
	private String Summary;
	private String Haber_subject;
	private String Project_manage;
	private String Government_buyway;
	private String Government_buyclassify;
	private String IsSubmit;
	private int Projectid;
    public String getDate() {
		return Date;
	}

	public void setDate(String date) {
		Date = date;
	}

	public String getOwn_project() {
		return Own_project;
	}

	public void setOwn_project(String ownProject) {
		Own_project = ownProject;
	}

	public String getMoney() {
		return Money;
	}

	public void setMoney(String money) {
		Money = money;
	}

	public String getBorrow_object() {
		return Borrow_object;
	}

	public void setBorrow_object(String borrowObject) {
		Borrow_object = borrowObject;
	}

	public String getPay_way() {
		return Pay_way;
	}

	public void setPay_way(String payWay) {
		Pay_way = payWay;
	}

	public String getGovernment_buystyle() {
		return Government_buystyle;
	}

	public void setGovernment_buystyle(String governmentBuystyle) {
		Government_buystyle = governmentBuystyle;
	}

	public String getGovernment_buysite() {
		return Government_buysite;
	}

	public void setGovernment_buysite(String governmentBuysite) {
		Government_buysite = governmentBuysite;
	}

	public String getProofID() {
		return ProofID;
	}

	public void setProofID(String proofID) {
		ProofID = proofID;
	}

	public String getContract_special() {
		return Contract_special;
	}

	public void setContract_special(String contractSpecial) {
		Contract_special = contractSpecial;
	}

	public String getSummary() {
		return Summary;
	}

	public void setSummary(String summary) {
		Summary = summary;
	}

	public String getHaber_subject() {
		return Haber_subject;
	}

	public void setHaber_subject(String haberSubject) {
		Haber_subject = haberSubject;
	}

	public String getProject_manage() {
		return Project_manage;
	}

	public void setProject_manage(String projectManage) {
		Project_manage = projectManage;
	}

	public String getGovernment_buyway() {
		return Government_buyway;
	}

	public void setGovernment_buyway(String governmentBuyway) {
		Government_buyway = governmentBuyway;
	}

	public String getGovernment_buyclassify() {
		return Government_buyclassify;
	}

	public void setGovernment_buyclassify(String governmentBuyclassify) {
		Government_buyclassify = governmentBuyclassify;
	}

	public String getIsSubmit() {
		return IsSubmit;
	}

	public void setIsSubmit(String isSubmit) {
		IsSubmit = isSubmit;
	}

	public int getProjectid() {
		return Projectid;
	}

	public void setProjectid(int projectid) {
		Projectid = projectid;
	}

	private List list;
   	public List getList() {
		return list;
	}

	public void setList(List list) {
		this.list = list;
	}

	public String update(){
   		financeUser u=new financeUser();
   		u.setId(id);
   		
   		financeUpdateService us=new financeUpdateServiceImpl();
   		this.setList (us.update(u));
   		return "success";
   		
   	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
   	
	
   	
}
