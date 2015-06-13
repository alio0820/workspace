package com.chinasoft;

import java.util.LinkedList;
import java.util.List;

public class Subject implements AbstractSubject {

	private String name;
	
	public Subject(String name){
		this.name = name;
	}
	
	
	private String status;
	
	private List<AbstractObserver> list = new LinkedList<AbstractObserver>();
	
	@Override
	public void addObserver(AbstractObserver aob) {
		list.add(aob);

	}

	@Override
	public void removeObserver(AbstractObserver aob) {
		list.remove(aob);

	}

	@Override
	public void sendMessage() {
		for(AbstractObserver ob : list){
			ob.update(this.name);
		}
	}

	public void setStatus(String status) {
		if(status!=null &&(!status.equals(this.status))){
			this.status = status;
			sendMessage();
		}
		
	}

	public String getStatus() {
		return status;
	}

	public String getName() {
		return name;
	}
	
	
	
	
	

}
