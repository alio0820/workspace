package com.chiansofti.b;

import com.chiansofti.a.Car;

public class Truck extends Car {
	Car car=new Car();
	public static void main(String[] args) {
		Car car=new Car();
		car.turnAhead();//�ڲ�ͬ���У�ֻ�ܷ���public���εķ���
		car.a=2;//�ڲ�ͬ���У����������ֻ�ܷ��ʸ����public����
		Truck truck=new Truck();
		truck.turnAhead();
		truck.turnRight();
		truck.a=3;
		truck.b=4;
		truck.car.a=2;
	}
}
