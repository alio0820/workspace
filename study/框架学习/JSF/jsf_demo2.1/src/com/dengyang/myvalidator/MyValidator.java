package com.dengyang.myvalidator;

import javax.faces.application.FacesMessage;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.validator.FacesValidator;
import javax.faces.validator.Validator;
import javax.faces.validator.ValidatorException;

/**
 * �Զ���֤��
 * 
 * @author dengyangyang
 * 
 */
@FacesValidator(value="pwdValidator")
public class MyValidator implements Validator {

	/*
	 * �����԰�������֤����д��ʵ��Bean��
	 *  ҳ���������ã�
	 *  <h:inputSecret value="#{user.password}" required="true" validator="#{user.validate}" /> 
	 */
	public void validate(FacesContext context, UIComponent component,
			Object object) throws ValidatorException {
		String password = (String) object;
		if (password.length() < 6) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR, "�����������̫��!", "���볤�Ȳ���С��6���ַ�!");
		throw new ValidatorException(message);
		}
		if (password.length()>8) {
			FacesMessage message = new FacesMessage(
					FacesMessage.SEVERITY_ERROR,"�����������̫��!", "���볤�Ȳ��ܴ���8���ַ�!");
		throw new ValidatorException(message);
		}
	}

}
