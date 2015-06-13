package com.zr.js.js.web.action;

import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.zr.js.js.service.AccountingService;
import com.zr.js.js.service.impl.AccountingServiceImpl;

@SuppressWarnings("serial")
public class AccountingAction extends ActionSupport{
	private String num;
	private String name;
	private String flag;
	private String score;
	private String qq;
	//private String id;
	private int i=0;
	private int pagesize=10;
	private int k;//储存最大页面数
    private int pageNow=1; //页码数,初始为1
    private int intRowCount;//总行数
    private int intPageCount;//总页数
	private List list;
	private AccountingService accountingService;
		
//	private HttpServletRequest request = ServletActionContext.getRequest() ;
//	request.setCharacterEncoding("UTF-8");	
	public String accounting() throws Exception {
		accountingService = new AccountingServiceImpl();
		boolean flag1 = accountingService.accounting(num,name,flag,qq);
	    

		intRowCount=accountingService.count();
		k=(intRowCount + pagesize - 1) / pagesize;
        intPageCount = (intRowCount + pagesize - 1) / pagesize;//计算出总页数
        if(pageNow<1){
            pageNow=1;
        }
        
        if(pageNow > intPageCount)
             pageNow=intPageCount;
             i = (pageNow -1)*pagesize;

		this.setList(accountingService.queryUser(i,pagesize));
		return SUCCESS;
	}

	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}

	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public void setScore(String score)
	{
		this.score=score;
	}
	public String  getScore()
	{
		return score;
	}
	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}

	public int getPagesize() {
		return pagesize;
	}
	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
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
