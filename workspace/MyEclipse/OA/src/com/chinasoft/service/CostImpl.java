package com.chinasoft.service;

import java.util.Map;

import com.chinasoft.dao.CostDaoImpl;

public class CostImpl implements ICost {

	public float updateCost(Map map) throws Exception{
		CostDaoImpl costDaoImpl = new CostDaoImpl();
		float f = costDaoImpl.findCost(map);
		if(f > 10){
			costDaoImpl.addCost(map);
		}else{
			throw new Exception("Óà¶î²»×ã");
		}
		return 0;
	}
	
	

}
