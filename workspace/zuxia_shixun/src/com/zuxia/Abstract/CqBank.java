package com.zuxia.Abstract;

public class CqBank extends BankAccrual {

	private double money;	
	public double getMoney() {
		return money;
	}

	public void setMoney(double money) {
		this.money = money;
	}

	public double accrual() {		
		return this.money*0.026;
	}

}
