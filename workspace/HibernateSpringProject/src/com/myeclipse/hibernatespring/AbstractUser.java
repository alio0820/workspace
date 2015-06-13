package com.myeclipse.hibernatespring;

/**
 * AbstractUser entity provides the base persistence definition of the User
 * entity. @author MyEclipse Persistence Tools
 */

public abstract class AbstractUser implements java.io.Serializable
{

	// Fields

	private Integer id;
	private String username;
	private String password;
	private String firstName;
	private String lastName;
	private String dateCreated;

	// Constructors

	/** default constructor */
	public AbstractUser()
	{
	}

	/** full constructor */
	public AbstractUser(String username, String password, String firstName,
			String lastName, String dateCreated)
	{
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.dateCreated = dateCreated;
	}

	// Property accessors

	public Integer getId()
	{
		return this.id;
	}

	public void setId(Integer id)
	{
		this.id = id;
	}

	public String getUsername()
	{
		return this.username;
	}

	public void setUsername(String username)
	{
		this.username = username;
	}

	public String getPassword()
	{
		return this.password;
	}

	public void setPassword(String password)
	{
		this.password = password;
	}

	public String getFirstName()
	{
		return this.firstName;
	}

	public void setFirstName(String firstName)
	{
		this.firstName = firstName;
	}

	public String getLastName()
	{
		return this.lastName;
	}

	public void setLastName(String lastName)
	{
		this.lastName = lastName;
	}

	public String getDateCreated()
	{
		return this.dateCreated;
	}

	public void setDateCreated(String dateCreated)
	{
		this.dateCreated = dateCreated;
	}

}