package com.chinasoft.advice;

import org.springframework.aop.ThrowsAdvice;

import com.chinasoft.exception.MyException;

public class ExceptionAdvice implements ThrowsAdvice {
	 public void afterThrowing(Exception ex) throws Throwable {
         throw new MyException("自己定义的");
	 }

}
