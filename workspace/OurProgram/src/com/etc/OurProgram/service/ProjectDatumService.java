package com.etc.OurProgram.service;

import com.etc.OurProgram.javabean.ProjectDatum;
import java.util.List;
public interface ProjectDatumService {
	public boolean add(ProjectDatum pd);   
	public boolean update(ProjectDatum pd);
	public boolean delete(ProjectDatum pd);
	public List query(ProjectDatum pd,int i,int pageSize);
	public List queryAll(ProjectDatum pd);
	public int count(ProjectDatum pd);
}
