package com.chinasoft.domain;

import java.io.Serializable;

public class StudentId implements Serializable {
	private String fristName;
	private String lastName;
	public String getFristName() {
		return fristName;
	}
	public void setFristName(String fristName) {
		this.fristName = fristName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	
	
}
