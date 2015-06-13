package com.swu.pojo;

public class User                       //为testQuery方法使用
{
	private String name;
	private int  age;
    
	public User(String name, int age)
	{
		this.name=name;
		this.age=age;
	}
	
	public User(String name)
	{
		this.name=name;
	}
	
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public int  getAge()
	{
		return age;
	}
	public void setAge(int  age)
	{
		this.age = age;
	}
	

}
