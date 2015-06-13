package com.etc.OurProgram.web.action;

import java.util.List;

import com.etc.OurProgram.service.financeQueryService;
import com.etc.OurProgram.service.impl.financeQueryServiceImpl;

public class financeQueryAction {
	 private String query; 
	 private String keyword;
	 private List list;
      public String query(){
    	  
    	 
    	 financeQueryService qs=new financeQueryServiceImpl();
    	 this.setList(qs.query(getQuery(), getKeyword()));
    	 
    	  return "success";
    	  
      }
	
    
      
  



	public String getQuery() {
		return query;
	}







	public void setQuery(String query) {
		this.query = query;
	}







	public String getKeyword() {
		return keyword;
	}







	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}







	public List getList() {
		return list;
	}



	public void setList(List list) {
		this.list = list;
	}
      
      
}
