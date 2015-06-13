package com.zuxia.Abstract;

public class Test {
	public BankAccrual retulei(BankAccrual bk){
		BankAccrual bank;
		if(bk instanceof ChinaBank){
			bank = new ChinaBank();
		}
		else
			bank = new CqBank();
		return bank;
	}
	public static void main(String[] args){
		CqBank bank1 = new CqBank();
		bank1.setMoney(10000);
		System.out.println("存入10000元");
		System.out.println("重庆银行的年利息为："+bank1.accrual());
		ChinaBank bank2 =new ChinaBank();
		bank2.setMoney(10000);
		System.out.println("中国银行的年利息为："+bank2.accrual());
		BankAccrual cb = (new Test()).retulei(bank1);
		System.out.println("重庆银行的年利息为："+cb.accrual());
	}
}
