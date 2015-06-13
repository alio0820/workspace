package com.dengyang.demo;

import javax.el.ELContext;
import javax.el.ExpressionFactory;
import javax.el.ValueExpression;
import javax.faces.application.Application;
import javax.faces.context.FacesContext;
import javax.faces.el.ValueBinding;
/**
 * 参考
 * 《JavaServer Faces 2.0, The Complete Reference.pdf》
 * part1 chapter5 -- Web Application Development Details on Managed Beans
 * @author dengyangyang
 *
 */
public class TestBean {
	/*
	 * 如果要在其它类别中取得Bean 对象，则可以先取得
	 *javax.faces.context.FacesContext ，它代表了JSF 目前的执行环境对象，接着尝试取得
	 *javax.faces.el.ValueBinding 对象，从中取得指定的 Bean 对象，例
	 */
	FacesContext context = FacesContext.getCurrentInstance(); 
	
	 ValueBinding binding =   context.getApplication().createValueBinding("#{user}");
	 UserBean user = (UserBean) binding.getValue(context); 
	 
	/*
	 *  如果只是要尝试取得Bean 的某个属性，则可以如下： 
	 */
	  ValueBinding binding_name =context.getApplication().createValueBinding("#{user.name}"); 
	  String name = (String) binding_name.getValue(context); 
	  
	  /**
	   * Web Application Development Details on Managed Beans
	   */
	  //获取user某个属性
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
		  ve.setValue(elContext, "设置新名字");//To set the value, use
		  //to get the value, use
		  ValueExpression veEntity =expressionFactory.createValueExpression(elContext, "#{user }",UserBean.class); 
		  UserBean user = (UserBean) veEntity.getValue(elContext);
	  }
	  /*
	   * 见:"part1 chapter5 -- Web Application Development Details on Managed Beans"
	   * -Invoking a Method on a Managed Bean Programmatically
	   * 用托管bean 调用方法
	   */
	  
	  /*
	   * 见:"part1 chapter5 -- Web Application Development Details on Managed Beans"
	   * -Using Managed Beans as Backing Beans for JSF Pages
	   * 用托管bean返回(数据)给JSF页面
	   */
}
