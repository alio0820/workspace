
public class UserBean {
	private String name;
	private String password;
	private String errMessage;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getErrMessage() {
		return errMessage;
	}
	public void setErrMessage(String errMessage) {
		this.errMessage = errMessage;
	}
	public String verify(){
		if(!name.equals("zhai")||password.equals("123456")){
			errMessage = "Ãû³Æ»òÃÜÂë´íÎó";
			return "failure";
		}else{
			return "success";
		}
	}
}
