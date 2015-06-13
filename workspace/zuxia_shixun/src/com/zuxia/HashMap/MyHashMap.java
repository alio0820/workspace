package com.zuxia.HashMap;

import java.util.HashMap;
import java.util.Set;

public class MyHashMap {
	public static void main(String[] args){
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("zhai", "翟灿东");
		map.put("xida", "西南大学");
		Set<String> keys = map.keySet();
		for(String s : keys){
			System.out.println(map.get(s));
		}
		System.out.println(map.get("12")==null);
	}
}
