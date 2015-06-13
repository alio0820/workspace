package com.chiansofti.b;

import com.chiansofti.a.Car;

public class Truck extends Car {
	Car car=new Car();
	public static void main(String[] args) {
		Car car=new Car();
		car.turnAhead();//在不同包中，只能访问public修饰的方法
		car.a=2;//在不同包中，该类的引用只能访问该类的public属性
		Truck truck=new Truck();
		truck.turnAhead();
		truck.turnRight();
		truck.a=3;
		truck.b=4;
		truck.car.a=2;
	}
}
