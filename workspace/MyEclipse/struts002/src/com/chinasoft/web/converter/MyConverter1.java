package com.chinasoft.web.converter;

import java.util.Map;

import org.apache.struts2.util.StrutsTypeConverter;

import com.chinasoft.web.vo.Person;

public class MyConverter1 extends StrutsTypeConverter {

	@Override
	public Object convertFromString(Map arg0, String[] arg1, Class arg2) {		
		String[] strs = arg1[0].split("@");
		System.out.println(arg2.getName());
		Person p = new Person();
		p.setPersonName(strs[0]);
		p.setPersonpwd(strs[1]);
		return p;
	}

	@Override
	public String convertToString(Map arg0, Object arg1) {
		
		Person p = (Person)arg1;
		String s = "老子的用户名是："+p.getPersonName() + "老子的用密码是:"+p.getPersonpwd();
		return s;
	}

}
