package com.chinasoft.dao;

import java.sql.Connection;
import java.util.Map;

public class CostDaoImpl implements ICostDao {

	public float addCost(Map map) {
		Connection con = (Connection)map.get("con");
		
		return 0;
	}

	public float findCost(Map map) {
		Connection con = (Connection)map.get("con");
		
		return 0;
	}

}
