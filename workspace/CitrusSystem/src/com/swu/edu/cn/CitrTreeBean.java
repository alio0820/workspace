package com.swu.edu.cn;
//柑橘树表CitrTress对应的JavaBean
//一次性采集
public class CitrTreeBean {
	private  String ID;			 			//地域标识
	private  int   TimeStam; 				//时间戳
	private  int   Spec;  					//树木品种
	private  int   Age; 					//树龄
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public int getTimeStam() {
		return TimeStam;
	}
	public void setTimeStam(int timeStam) {
		TimeStam = timeStam;
	}
	public int getSpec() {
		return Spec;
	}
	public void setSpec(int spec) {
		Spec = spec;
	}
	public int getAge() {
		return Age;
	}
	public void setAge(int age) {
		Age = age;
	}
	
}
