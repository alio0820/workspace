package com.zr.js.js.javabean;

public class User_propertySort {
	private String id;
	private String num;
	private String name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
    //在user中的get方法，必须满足javabean的标准，否则jsp在取值的时候不报错，但取不到值，这点要特别注意，get方法要与变量一一对应！
}
