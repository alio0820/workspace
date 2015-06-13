package com.chinasoft.template;

//类可以继承的同时去实现接口
public  class  StudentA  extends Template implements IWork1 {



	@Override
	public void doTest() {
		System.out.println(IWork1.i);
		System.out.println(IWork.i);
		
		System.out.println("A的工作");
		
	}

	
	@Override
	public void doTest1() {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void doWork2() {
		// TODO Auto-generated method stub
		
	}


	
	

}
