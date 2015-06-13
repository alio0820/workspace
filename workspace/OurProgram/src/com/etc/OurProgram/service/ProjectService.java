package com.etc.OurProgram.service;

import java.util.List;

import com.etc.OurProgram.javabean.ProjectList;

public interface ProjectService {
	List queryUser(ProjectList pl);
	List querySubmit(ProjectList pl);
	List querySubmitRecord(ProjectList pl);

}
