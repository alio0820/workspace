package com.dengyang.demo;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
/**
 * �ο�
 * ��JavaServer Faces 2.0, The Complete Reference.pdf��
 * part1 chapter5 -- Web Application Development Details on Managed Beans
 * @author dengyangyang
 *
 */
public class TestBean {
	/*
	 * ���Ҫ�����������ȡ��Bean �����������ȡ��
	 *javax.faces.context.FacesContext ����������JSF Ŀǰ��ִ�л������󣬽��ų���ȡ��
	 *javax.faces.el.ValueBinding ���󣬴���ȡ��ָ���� Bean ������
	 */
	FacesContext context = FacesContext.getCurrentInstance(); 
	
	 ValueBinding binding =   context.getApplication().createValueBinding("#{user}");
	 UserBean user = (UserBean) binding.getValue(context); 
	 
	/*
	 *  ���ֻ��Ҫ����ȡ��Bean ��ĳ�����ԣ���������£� 
	 */
	  ValueBinding binding_name =context.getApplication().createValueBinding("#{user.name}"); 
	  String name = (String) binding_name.getValue(context); 
	  
	  /**
	   * Web Application Development Details on Managed Beans
	   */
	  //��ȡuserĳ������
	  ELContext elContext = context.getELContext( ); 
	  Application application = context.getApplication( ); 
	  String username = (String) application.evaluateExpressionGet(context, "#{user.name}", String.class);
/*
 * To set the get or set the value, use
 */
	  public void setValue(){
		  ExpressionFactory expressionFactory = application.getExpressionFactory( ); 
		  ValueExpression ve = expressionFactory.createValueExpression(elContext, "#{user.name}", String.class);
		  username = (String) ve.getValue(elContext); 
		  ve.setValue(elContext, "����������");//To set the value, use
		  //to get the value, use
		  ValueExpression veEntity =expressionFactory.createValueExpression(elContext, "#{user }",UserBean.class); 
		  UserBean user = (UserBean) veEntity.getValue(elContext);
	  }
	  /*
	   * ��:"part1 chapter5 -- Web Application Development Details on Managed Beans"
	   * -Invoking a Method on a Managed Bean Programmatically
	   * ���й�bean ���÷���
	   */
	  
	  /*
	   * ��:"part1 chapter5 -- Web Application Development Details on Managed Beans"
	   * -Using Managed Beans as Backing Beans for JSF Pages
	   * ���й�bean����(����)��JSFҳ��
	   */
}
