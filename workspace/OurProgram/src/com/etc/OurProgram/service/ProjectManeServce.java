package com.etc.OurProgram.service;

import com.etc.OurProgram.javabean.ProjectManegement;


import java.util.List;

public interface ProjectManeServce {
	
	
public boolean add(ProjectManegement pm);   
public boolean update(ProjectManegement pm);
public boolean delete(ProjectManegement pm);
public List query(int i,int pageSize);
public ProjectManegement queryAboutDatum(ProjectManegement pm);
public boolean updateAboutDatum(ProjectManegement pm);


public int count();

}
