package com.git.datatype;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import javax.faces.context.*;

public class DataTypeList {
	Collection list;
	public Collection getDtLst() {
		
		SeMetoDAO sm=new SeMetoDAO();		
//		list=new ArrayList();
		Map session = FacesContext.getCurrentInstance().getExternalContext().getSessionMap();
		list=sm.getAllDataTypes(session);	
		System.out.print("ȡֵ"+((ArrayList)list).get(0).toString());
		return list;
		
	}
	
	public void setDtLst(List list) {
		this.list = list;
	}
}
