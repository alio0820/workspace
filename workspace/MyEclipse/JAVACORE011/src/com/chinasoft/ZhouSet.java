package com.chinasoft;

import java.util.HashSet;
import java.util.Iterator;

public class ZhouSet extends HashSet {

	@Override
	public Iterator iterator() {
		
		return new MyIterator(this);
	}
	
	public Iterator getIterator(){
		return super.iterator();
		
	}
	
}
