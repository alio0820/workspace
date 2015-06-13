package com.zr.js.js.javabean;

public class User {

	private String num;
	private String flag;
	private String name;
	private String score;
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
	public void setScore(String score) {
		this.score = score;
	}
	public String getScore() {
		return score;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getFlag() 
	{
		return flag;
	}

    //在user中的get方法，必须满足javabean的标准，否则jsp在取值的时候不报错，但取不到值，这点要特别注意，get方法要与变量一一对应！
	
	
}
