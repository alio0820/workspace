package com.zuxia.set;

import java.util.HashSet;
import java.util.Iterator;

public class MySet {
	public static void main(String[] args){
		HashSet<String> set = new HashSet<String>();
		set.add("10");
		set.add("1991");
		set.add("hubei");
		set.add("1");
		set.add("2");
		set.add("3");
		set.add("4");
		set.add("5");
		set.add("6");
		set.add("7");
//		set.add(10);
//		set.remove(10);
		System.out.println(set.size());
		Iterator it  =set.iterator();
/*		while(it.hasNext()){
			System.out.println(it.next());
		}*/
		for(String s: set){
			System.out.println(s);
		}
	}
}
