package com.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.model.LoginInfo;

public class LoginValidator implements Validator {

	public boolean supports(Class arg0) {
		
		return LoginInfo.class.isAssignableFrom(arg0);
	}

	public void validate(Object arg0, Errors errors) {
		
		LoginInfo loginInfo = (LoginInfo)arg0;
		if("".equals(loginInfo.getUsername())){
			errors.rejectValue("username",
					"usernameErr",
					null,
					"用户名不能为空");
		}
	}

}
