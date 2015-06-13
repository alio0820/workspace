package com.citrus.info.service;

import java.sql.SQLException;

public interface treeInfoService {
	String info(String location,String tree);
	String getDecide(Long timeStamp,String SoilProperties,double d)throws ClassNotFoundException, SQLException;
	String getSeason(Long timeStamp);
}
