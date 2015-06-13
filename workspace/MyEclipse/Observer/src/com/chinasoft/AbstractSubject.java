package com.chinasoft;

public interface AbstractSubject {
	
	public void addObserver(AbstractObserver aob);
	
	public void removeObserver(AbstractObserver aob);
	
	
	public void sendMessage();
	
	public String getStatus();
	
	public String getName();
}
