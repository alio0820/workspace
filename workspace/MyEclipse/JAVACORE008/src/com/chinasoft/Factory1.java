package com.chinasoft;

public class Factory1 implements AbstractFactory {
	
	/* (non-Javadoc)
	 * @see com.chinasoft.AbstractFactory#getInstance(int)
	 */
	public  Fruit getInstance(int i) throws Exception{
		if(i==1){
			return new Banana();
		}
		if(i==2){
			return new Apple();
		}
		if(i==3){
			return new WaterMelon();
			
		}
		throw new Exception("ũ���޷�����");
	}
}
