package com.zr.js.js.web.action;


import java.util.List;
import com.opensymphony.xwork2.ActionSupport;
import com.zr.js.js.service.FileSortService;
import com.zr.js.js.service.impl.FileSortServiceImpl;

@SuppressWarnings("serial")
public class FileSortAction extends ActionSupport{
	
	private String num;           //编号
	private String name;          //名称
	private String qq;            //
	private String id;
	private String str;           //查询哪一个表
	private List list;
	private String p_name;
	private String id_forward;
	private int i=0;
	private int pagesize=10;
	private int k;//储存最大页面数
    private int pageNow=1; //页码数,初始为1
    private int intRowCount;//总行数
    private int intPageCount;//总页数
    private String nnn;
	private FileSortService fileSortService;
	
	public String property() throws Exception {

//		System.out.println("会计科目编号:" + num);
//		System.out.println("会计名称:" +name);
		fileSortService = new FileSortServiceImpl();
		boolean flag = fileSortService.property(str,num, name,qq,id,id_forward);
		if(flag==false){
		//addActionError("资产类别编号已存在，请重新输入！");
		}
		fileSortService = new FileSortServiceImpl();
		intRowCount=fileSortService.count(str);
		k=(intRowCount + pagesize - 1) / pagesize;
        intPageCount = (intRowCount + pagesize - 1) / pagesize;//计算出总页数
        if(pageNow<1){
            pageNow=1;
        }
        
        if(pageNow > intPageCount)
             pageNow=intPageCount;
             i = (pageNow -1)*pagesize;
             
		this.setList(fileSortService.queryUser(i,pagesize,str,id_forward));
		if(str.equals("1"))
			return "next";
		else
		    return SUCCESS;
	}

	public String getNum() {
		return num;
	}
	public void setNum(String kjnum) {
		this.num = kjnum;
	}


	public String getName() {
		return name;
	}
	public void setName(String kjname) {
		this.name = kjname;
	}


	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}


	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public String getStr() {
		return str;
	}
	public void setStr(String str) {
		this.str = str;
	}

	public List getList() {
		return list;
	}
	public void setList(List list) {
		this.list = list;
	}

	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getId_forward() {
		return id_forward;
	}
	public void setId_forward(String id_forward) {
		this.id_forward = id_forward;
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

	public String getNnn() {
		return nnn;
	}

	public void setNnn(String nnn) {
		this.nnn = nnn;
	}
	
}
