package com.myeclipse.hibernatespring;

import java.sql.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */
public class User extends AbstractUser implements java.io.Serializable
{

	// Constructors

	/** default constructor */
	public User()
	{
	}

	/** full constructor */
	public User(String username, String password, String firstName,
			String lastName, String dateCreated)
	{
		super(username, password, firstName, lastName, dateCreated);
	}

}
