package com.chinasoft.advice;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;



public class AroundAdvice implements MethodInterceptor {

	@Override
	public Object invoke(MethodInvocation arg0) throws Throwable {
		System.out.println("����֪ͨǰ");
		Object o = arg0.proceed();
		System.out.println("����֪ͨ��");
		return o;
	}

}
