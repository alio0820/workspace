package com.zuxia.Abstract;

public class ChinaBank extends BankAccrual {

	private double money;
	
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public double accrual() {
		// TODO Auto-generated method stub
		return this.money*0.022;
	}

}
