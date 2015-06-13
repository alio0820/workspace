package com.chinasoft;

import java.util.HashMap;
import java.util.Map;

public class Observer implements AbstractObserver {

	private String name;
	private Map<String,AbstractSubject> map = new HashMap<String,AbstractSubject>();
	
	public Observer(String name,AbstractSubject... ass){
		this.name= name;
		for(AbstractSubject as :ass){
			as.addObserver(this);
			map.put(as.getName(), as);
		}
	}
	
	@Override
	public void update(String subName) {
		System.out.println(name + map.get(subName).getStatus());

	}

}
