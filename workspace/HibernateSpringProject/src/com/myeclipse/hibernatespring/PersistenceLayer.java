package com.myeclipse.hibernatespring;

public class PersistenceLayer
{
	private UserDAO userDAO; 

    public UserDAO getUserDAO() { 
        return userDAO; 
    } 

    public void setUserDAO(UserDAO userDAO) { 
        this.userDAO = userDAO; 
    } 
    
    public void addUser(User user) { 
        userDAO.save(user); 
    } 
    
    public User findUserById(Integer id) { 
        return userDAO.findById(id); 
    } 
    
    public void updateUser(User user) { 
        userDAO.merge(user); 
    } 
    
    public void deleteUser(User user) { 
        userDAO.delete(user); 
    } 

}
