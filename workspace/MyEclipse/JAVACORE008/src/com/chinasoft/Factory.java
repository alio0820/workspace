package com.chinasoft;

public class Factory implements AbstractFactory {
	
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
		throw new Exception("农夫无法生产");
	}
}
