package com.chinasoft;

import java.util.HashSet;
import java.util.Iterator;

public class Test {

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		//规则:
		//1:首先判断hashcode，如果hashcode不同，则不是同一个元素
		//如果hashcode相同，则再判断equals，如果equals相同，则元素相同
		//如果equals不同，则元素不同
		HashSet<Object> hashset = new ZhouSet();
		hashset.add(1);
		hashset.add(2);		
		hashset.add(3);
		hashset.add(4);
		hashset.add(5);
		hashset.add(6);
		hashset.add(7);
		hashset.add(8);
		hashset.add(9);
		hashset.add(10);
//		Person p = new 	Person();
//		p.setName("zhouqi");
//		System.out.println(p.hashCode());
//		Person p1 = new Person();
//		p1.setName("zhouqi1");
//		System.out.println(p1.hashCode());
//		hashset.add(p);
//		hashset.add(p1);
//		System.out.println(hashset.size());
//		
	//	for(Person p2:hashset){
	//		System.out.println(p2.getName());
	//	}
		
		Iterator<Object> it = hashset.iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		
	}

}
