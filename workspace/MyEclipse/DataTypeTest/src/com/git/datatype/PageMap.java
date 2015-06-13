package com.git.datatype;

import java.util.HashMap;
import java.util.Map;

public class PageMap {
	private Map programMap;//�����õ���������
	private Map dbMap;//���ݿ��õ���������
	
	public Map getdbMap(){
		if(dbMap==null){
			Map dbMap=new HashMap();
			
			dbMap.put("int", "int");
			dbMap.put("varchar", "varchar");
			dbMap.put("long", "long");
			dbMap.put("money", "money");
			dbMap.put("text", "text");
			dbMap.put("DataTime", "DataTime");
			dbMap.put("Xml", "Xml");
		}
		
		return dbMap;
	}
	
	public Map getProgramMap(){
		if(programMap==null){
			Map programMap=new HashMap();
			programMap.put("string", "string");
			programMap.put("char", "char");
			programMap.put("long", "long");
			programMap.put("int", "int");
			programMap.put("short", "short");
			programMap.put("decimal", "decimal");
			programMap.put("byte[]", "byte[]");
			programMap.put("bool", "bool");
			programMap.put("DataTime", "DataTime");
			programMap.put("Guid", "Guid");
			programMap.put("Xml", "Xml");
		}
				
		return programMap;
			
	}
	
	
}
