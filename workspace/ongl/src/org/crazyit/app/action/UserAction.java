package org.crazyit.app.action;

import org.crazyit.app.domain.User;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@SuppressWarnings("serial")
public class UserAction extends ActionSupport implements ModelDriven<User> 
{
    private User user= new User();
    public String execute()
    {
    	System.out.println(user.getName());
    	System.out.println(user.getPass());
    	return SUCCESS ;
    }
	public User getModel()
	{
		return user;
	}
//	Ä£ÐÍÇý¶¯
}

