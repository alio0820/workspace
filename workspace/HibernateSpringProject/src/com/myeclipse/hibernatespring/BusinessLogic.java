package com.myeclipse.hibernatespring;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

public class BusinessLogic
{
	public static void main(String[] args)
	{
		/* 1. Create a new user */
		Integer id = new Integer(1);
		User user = new User();
		user.setId(id);
		user.setUsername("jdoe");
		user.setPassword("1234");
		user.setFirstName("John");
		user.setLastName("Doe");
		user.setDateCreated(String.valueOf(System.currentTimeMillis()));
		/* 2. Load the Spring bean configuration and create a bean factory */
		BeanFactory beanFactory = new XmlBeanFactory(new ClassPathResource("applicationContext.xml"));
		/* 3. Create instance of PersistenceLayer */
		PersistenceLayer persistenceLayer = (PersistenceLayer)beanFactory.getBean("persistenceLayer");
		/* 4. Save the new user to the database */
		persistenceLayer.addUser(user);
		
		/* 5. Confirm that our user was saved */ 
		User userLoadedFromDB = persistenceLayer.findUserById(id);
		System.out.println("User Loaded from DB [username="
				+ userLoadedFromDB.getUsername()+",password="
				+ userLoadedFromDB.getPassword()+",firstName="
				+ userLoadedFromDB.getFirstName()+",lastName="
				+ userLoadedFromDB.getLastName()+"]");
		
		/* 6. Update the user */
		userLoadedFromDB.setFirstName("Johnathan");
		persistenceLayer.updateUser(userLoadedFromDB);
		
		/* 7. Confirm that the update worked */ 
		User userLoadFromDBAgain = persistenceLayer.findUserById(id);
		System.out.println("User Loaded from DB Again [firstName="
				+userLoadFromDBAgain.getFirstName()+"]");
		
		/* 8. Delete the user */ 
		persistenceLayer.deleteUser(user);
			
	}
}
