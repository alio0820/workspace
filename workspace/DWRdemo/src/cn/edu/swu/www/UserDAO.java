package cn.edu.swu.www;

import java.util.HashMap;
import java.util.Map;

public class UserDAO
{
	private static Map dataMap = new HashMap();		//存放保存的数据
	public boolean save(User user){					//持久用户
		if(dataMap.containsKey(user.getId()))
			return false;
		System.out.println("下面开始保存用户");
		System.out.println("id:"+user.getId());
		System.out.println("password:"+user.getPassword());
		System.out.println("name:"+user.getName());
		System.out.println("email:"+user.getEmail());
		dataMap.put(user.getId(), user);
		System.out.println("用户保存结束");
		return true;
	}
	public User find(String id){					//查找用户
		return (User)dataMap.get(id);
	}
	
	
}
