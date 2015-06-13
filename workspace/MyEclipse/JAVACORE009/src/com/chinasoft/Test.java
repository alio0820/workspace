package com.chinasoft;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class Test {

	/**
	 * @param args
	 * @throws ClassNotFoundException 
	 * @throws NoSuchMethodException 
	 * @throws SecurityException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 * @throws InvocationTargetException 
	 * @throws IllegalArgumentException 
	 * @throws NoSuchFieldException 
	 */
	public static void main(String[] args) throws ClassNotFoundException, SecurityException, NoSuchMethodException, InstantiationException, IllegalAccessException, IllegalArgumentException, InvocationTargetException, NoSuchFieldException {
		Person p = new Person();
		p = null;
		System.gc();
		System.out.println("----");
		

		
		//Field[] fs   = c.getFields();
//		Field[] fs   = c.getDeclaredFields();		
//		for(Field f : fs){
//			System.out.println(f.getName());
//		}
//		
//		Method[] ms = c.getMethods();
//		for(Method m : ms){
//			System.out.println(m.getName());		
//		}
		

		
		
		
		//Object o =c.newInstance();
		//加载类
//		Class c  = Class.forName(args[0]);
		
		//属性
//		Field f =  c.getField("name");
		
		

		//获得并调用构造方法
//		Class[] constructorParameterTypes = {String.class,int.class,String.class};		
//		Constructor constructor = c.getConstructor(constructorParameterTypes);		
//		Object[] co = {"zhouqi",29,"男"};		
//		Object o =constructor.newInstance(co);
//		
//		Class[] parameterTypes2 = {String[].class};
//		Method m2 = c.getDeclaredMethod(args[1], parameterTypes2);	
//		Object[] ooo = {"a","b"};
//		Object[] args2 = {ooo};
//		m2.invoke(o, args2);
//		
//		
//		
//		//获得并调用setName方法
//		Class pc = Class.forName(args[2]);
//		Class[] parameterTypes = {pc};
//		Method m = c.getDeclaredMethod(args[1], parameterTypes);		
//		Object[] arg = {"zhouqi11111"};
//		m.invoke(o, arg);
//
//		//获得并调用getName方法
//		Class[] parameterTypes1 = {};
//		Method m1 = c.getDeclaredMethod("getName", parameterTypes1);
//		m1.setAccessible(true);
//		Object[] arg1 = {};
//		Object ro  = m1.invoke(o, arg1);
//		System.out.println((String)ro);
	}
	
	
	

}
