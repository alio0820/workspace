package com.chinasoft;

public class Person {

	private String name;	
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	
	@Override
	public int hashCode() {

		return 1;
	}

	@Override
	public boolean equals(Object obj) {
		Person p = (Person)obj;
		if(name==null){
			return false;
		}
		if(p==null||p.name==null){
			return false;
		}		
		return this.name.equals(p.name);
	}
	
	
	
	
	
	
}
