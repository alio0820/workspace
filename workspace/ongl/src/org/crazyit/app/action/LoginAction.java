package org.crazyit.app.action;

import java.util.List;
import org.crazyit.app.domain.User;
import com.opensymphony.xwork2.Action;   //��ʦ�õľ������֣���������Ҫ��дexecute�������Ƚ��鷳
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
//			this.addFieldError("zhai","��¼����");
//			return INPUT;
//		}
//	}
	public String login() throws Exception{
		if((getUsers().get(0).getName().equals("zcd"))&&(getUsers().get(0).getPass().equals("1")))
			//��������list��getUsers().get(0).getName()������ֱ����user�ࡾuser.getName()��,����ȡ��jsp��ֵ��
			//ֻ��jsp��name����Ҫ����Ӧ�ĵ���
			{
			     setTip("��¼�ɹ���");			
			     return SUCCESS;	
			}
		else
		{			
			this.addFieldError("zhai","�������𣿵�¼���룡");
			setTip("��¼ʧ�ܣ�");
			return INPUT;
		}
	}	
//�����󣬲������ʾ
//	public void addActionError(String anErrorMessage){
//		   String s=anErrorMessage;
//		   System.out.println(s);
//		  }
//		  public void addActionMessage(String aMessage){
//		   String s=aMessage;
//		   System.out.println(s);
//		   
//		  }
//		  public void addFieldError(String fieldName, String errorMessage){   //����FieldError����ȥ�Ĳ������ں�̨��ʾ
//		   String s=errorMessage;
//		   String f=fieldName;          //zhaiû������ʱ��ǰ̨��������ʾ������Ϣ��fieleNameҲ���ز����������Ա��������
//		   System.out.println(s);
//		   System.out.println(f);		   
//		  }
}
