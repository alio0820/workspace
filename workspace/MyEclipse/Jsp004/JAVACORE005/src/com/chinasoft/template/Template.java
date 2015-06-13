package com.chinasoft.template;

public abstract class Template implements IWork {
	
	private static final String name = "zhouqi";
	
	public void doWorkByDay(){
		doWork1();
		doWork2();
		doWork3();
		
	}
	
	private void doWork1(){
		System.out.println("�����Ͽ�");
	}
	
	public abstract void doWork2();
	
	private void doWork3(){
		System.out.println("�����Ͽ�");
	}

	@Override
	public abstract void doTest();
	
	
	
}
