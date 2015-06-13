package com.dengyang.demo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.SessionScoped;
import javax.faces.component.UIComponent;
import javax.faces.context.FacesContext;
import javax.faces.event.ActionEvent;
import javax.faces.event.ValueChangeEvent;
import javax.faces.validator.ValidatorException;

@ManagedBean(name = "user")
@SessionScoped
public class UserBean implements Serializable{
	private static final long serialVersionUID = 8810034943562944360L;
	
	@ManagedProperty(value="邓洋")
	private String name;
	private String password;
	private String sex;
	private String msg;
	private String birth;
	private String email;

	private Date date = new Date();
	private List<Integer> array;
	private Map<String, String> map;

	private String locale;
	private String outcome;

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

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public List<Integer> getArray() {
		return array;
	}

	public void setArray(List<Integer> array) {
		this.array = array;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public String outcome() {
		return outcome;
	}

	public String getLocale() {
		if (locale == null)
			locale = "zh_CN";
		return locale;
	}

	public void setLocale(String locale) {
		this.locale = locale;
	}

	/**
	 * 值变事件
	 * 
	 * @param e
	 */
	public void changeLocale(ValueChangeEvent e) {
		if (locale.equals("zh_CN"))
			locale = "en_US";
		else
			locale = "zh_CN";
	}

	/**
	 * 动作事件
	 * 
	 * @param e
	 */
	public void verify_event(ActionEvent e) {
		if (!name.equals("邓洋") || !password.equals("123456")) {
			msg = "名字或密码错误!";
			outcome = "index";
		} else
			outcome = "welcome";
	}
/**
 * 自定义校验器
 * @param context
 * @param toValidate
 * @param value
 * @throws ValidatorException
 */
	public void validateEmail(FacesContext context, UIComponent toValidate,
			Object value) throws ValidatorException {
		String emailStr = (String) value;
		if (-1 == emailStr.indexOf("@")) {
			FacesMessage message = new FacesMessage("请输入正确的邮件地址!");
			throw new ValidatorException(message);
		}
	}
	
	public String addConfirmedUser() { 
		  boolean added = true; // actual application may fail to add user 
		  FacesMessage doneMessage = null; 
		  String outcome = null; 
		  if (added) { 
		    doneMessage = new FacesMessage("注册成功!"); 
		    outcome = "done"; 
		  } else { 
		    doneMessage = new FacesMessage("注册失败!!"); 
		    outcome = "register"; 
		  }  
		  FacesContext.getCurrentInstance().addMessage(null, doneMessage); 
		  return outcome; 
		}
	
	public String myTitle(String param1){
		System.out.println("=="+param1);
		return "JSF2.1学习 by 邓洋!";
	}
}
