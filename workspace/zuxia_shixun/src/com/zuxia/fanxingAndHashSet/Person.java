package com.zuxia.fanxingAndHashSet;

public class Person<T> {
	private T name;
	private T content;
	public T getName() {
		return name;
	}
	public void setName(T name) {
		this.name = name;
	}
	public T getContent() {
		return content;
	}
	public void setContent(T content) {
		this.content = content;
	}
	
	public int hashCode(){
		return -1;
	}
	public boolean equals(Object obj){
		boolean flag=false;
		Person p = (Person)obj;
		if(p.name.equals(this.name))
			flag=true;
		return flag;
	}
}
