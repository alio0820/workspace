package com.chinaosft;

import java.io.Serializable;

public class Car implements Serializable,Cloneable {
	private String carName;

	public String getCarName() {
		return carName;
	}

	public void setCarName(String carName) {
		this.carName = carName;
	}
	
	
}
