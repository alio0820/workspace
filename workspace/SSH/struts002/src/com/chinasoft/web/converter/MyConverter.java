package com.chinasoft.web.converter;

import java.util.Map;

import com.chinasoft.web.vo.Person;

import ognl.DefaultTypeConverter;

public class MyConverter extends DefaultTypeConverter {

	@Override
	public Object convertValue(Map context, Object value, Class toType) {
		if(toType == Person.class){
			String[]ss = (String[])value;
			String[] strs = ss[0].split("@");
			Person p = new Person();
			p.setPersonName(strs[0]);
			p.setPersonpwd(strs[1]);
			return p;
		}else{
			Person p = (Person)value;
			String s = "���ӵ��û����ǣ�"+p.getPersonName() + "���ӵ���������:"+p.getPersonpwd();
			return s;
		}
		
		
		
		
	}
	
}
