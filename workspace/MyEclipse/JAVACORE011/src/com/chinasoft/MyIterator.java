package com.chinasoft;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class MyIterator implements Iterator {

	private List list = new ArrayList();
	private int index = 0;
	
	public MyIterator(ZhouSet set){
		Iterator it = set.getIterator();
		while(it.hasNext()){
			this.list.add(it.next());
		}		
		this.index = this.list.size();
	}
	
	
	@Override
	public boolean hasNext() {
		if(index == 0)
			return false;
		else{
			return true;
		}
	}

	@Override
	public Object next() {
		index--;
		Object o = list.get(index);		
		return o;
	}

	@Override
	public void remove() {
		list.remove(index);
		
	}

}
