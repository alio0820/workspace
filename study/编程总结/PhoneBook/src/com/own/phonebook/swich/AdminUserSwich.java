package com.own.phonebook.swich;

import com.own.phonebook.entity.AdminUser;
import com.own.phonebook.vo.AdminUserVO;

public class AdminUserSwich {
	public AdminUser VOtoEntity(AdminUserVO adminUserVO){
		AdminUser adminUser=new AdminUser();
		adminUser.setName(adminUserVO.getName().toString());
		adminUser.setPassword(adminUserVO.getPassword().toString());
		return adminUser;
	}
	
	public AdminUserVO EntitytoVO(AdminUser adminUser){
		AdminUserVO adminUserVO=new AdminUserVO();
		adminUserVO.setId(adminUser.getId());
		adminUserVO.setName(adminUser.getName().toString());
		adminUserVO.setPassword(adminUser.getPassword().toString());
		return adminUserVO;
	}
}
