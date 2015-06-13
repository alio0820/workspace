package org.crazyit.app.action;

import java.util.List;
import org.crazyit.app.domain.User;
import com.opensymphony.xwork2.Action;   //老师用的就是这种，但这种需要重写execute方法，比较麻烦
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport {
	private List<User> users;
	private String tip;
	private String zhai ;
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}	
public List<User> getUsers()
	{
		return users;
	}
	public void setUsers(List<User> users)
	{
		this.users = users;
	}

//	public String execute() throws Exception {
//		if((getUsers().get(0).getName().equals("zcd"))&&(getUsers().get(0).getPass().equals("1")))
//		{
//			return SUCCESS;	
//		}
//		else
//		{
//			this.addFieldError("zhai","登录不齐");
//			return INPUT;
//		}
//	}
	public String login() throws Exception{
		if((getUsers().get(0).getName().equals("zcd"))&&(getUsers().get(0).getPass().equals("1")))
			//无论是用list【getUsers().get(0).getName()】还是直接用user类【user.getName()】,都能取到jsp的值，
			//只是jsp的name属性要做相应的调整
			{
			     setTip("登录成功！");			
			     return SUCCESS;	
			}
		else
		{			
			this.addFieldError("zhai","你明白吗？登录不齐！");
			setTip("登录失败！");
			return INPUT;
		}
	}	
//检查错误，并输出显示
//	public void addActionError(String anErrorMessage){
//		   String s=anErrorMessage;
//		   System.out.println(s);
//		  }
//		  public void addActionMessage(String aMessage){
//		   String s=aMessage;
//		   System.out.println(s);
//		   
//		  }
//		  public void addFieldError(String fieldName, String errorMessage){   //拦截FieldError传过去的参数，在后台显示
//		   String s=errorMessage;
//		   String f=fieldName;          //zhai没加引号时，前台不可以显示错误信息，fieleName也加载不出来，所以必须加引号
//		   System.out.println(s);
//		   System.out.println(f);		   
//		  }
}
