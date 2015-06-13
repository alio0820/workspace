package com.chiansofti.a;

public class Car {
	public int a=1;
	protected int b=2;
	int c=3;
	private int d=4;
	public void turnAhead(){
		System.out.println("turnAhead");
	}
	protected void turnRight(){
		System.out.println("turnRight");
	}
	void turnLeft(){
		System.out.println("turnLeft");
	}
	private void turnOver(){
		System.out.println("turnOver");
	}
}
