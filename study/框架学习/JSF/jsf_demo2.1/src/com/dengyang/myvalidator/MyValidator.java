package com.dengyang.myvalidator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

/**
 * 自定验证器
 * 
 * @author dengyangyang
 * 
 */
@FacesValidator(value="pwdValidator")
public class MyValidator implements Validator {

	/*
	 * 还可以把以下验证方法写在实体Bean中
	 *  页面这样调用：
	 *  <h:inputSecret value="#{user.password}" required="true" validator="#{user.validate}" /> 
	 */
	public void validate(FacesContext context, UIComponent component,
			Object object) throws ValidatorException {
		String password = (String) object;
		if (password.length() < 6) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR, "您输入的密码太短!", "密码长度不能小于6个字符!");
		throw new ValidatorException(message);
		}
		if (password.length()>8) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR,"您输入的密码太长!", "密码长度不能大于8个字符!");
		throw new ValidatorException(message);
		}
	}

}
