package cn.edu.swu.www;

import java.util.HashMap;
import java.util.Map;

public class UserDAO
{
	private static Map dataMap = new HashMap();		//��ű��������
	public boolean save(User user){					//�־��û�
		if(dataMap.containsKey(user.getId()))
			return false;
		System.out.println("���濪ʼ�����û�");
		System.out.println("id:"+user.getId());
		System.out.println("password:"+user.getPassword());
		System.out.println("name:"+user.getName());
		System.out.println("email:"+user.getEmail());
		dataMap.put(user.getId(), user);
		System.out.println("�û��������");
		return true;
	}
	public User find(String id){					//�����û�
		return (User)dataMap.get(id);
	}
	
	
}
