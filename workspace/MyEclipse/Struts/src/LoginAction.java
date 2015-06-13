import java.util.Map;

import vo.User;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class LoginAction extends ActionSupport implements ModelDriven{
	
	private User user = new User();
	
	public String doLogin(){
		
		Map aaa = ActionContext.getContext().getSession();
		aaa.put("name", "zhouqi");
		System.out.println(user.getUserName() + "--------------"  + user.getPassWord());
		
		return SUCCESS;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Object getModel() {
		
		return user;
	}

	@Override
	public void validate() {		
		if(user.getUserName().length() < 6){
			addFieldError("userName", "用户名不能小于6位");
		}
		
	}


	
	
	
	
}
