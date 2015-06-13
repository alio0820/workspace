package com.chinasofti.pojo;

import java.io.Serializable;

public class StudentId implements Serializable {
	private String name;
	private String passWord;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
	@Override
	public boolean equals(Object obj) {
		StudentId s = (StudentId)obj;
		return name.equals(s.name)&&passWord.equals(s.passWord);
	}
}
