package com.chinasoft;

import java.util.HashSet;
import java.util.Iterator;

public class Test {

	/**
	 * @param args
	 */
	
	public static void main(String[] args) {
		//����:
		//1:�����ж�hashcode�����hashcode��ͬ������ͬһ��Ԫ��
		//���hashcode��ͬ�������ж�equals�����equals��ͬ����Ԫ����ͬ
		//���equals��ͬ����Ԫ�ز�ͬ
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
