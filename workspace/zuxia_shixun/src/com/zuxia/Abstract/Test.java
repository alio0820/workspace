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
		System.out.println("����10000Ԫ");
		System.out.println("�������е�����ϢΪ��"+bank1.accrual());
		ChinaBank bank2 =new ChinaBank();
		bank2.setMoney(10000);
		System.out.println("�й����е�����ϢΪ��"+bank2.accrual());
		BankAccrual cb = (new Test()).retulei(bank1);
		System.out.println("�������е�����ϢΪ��"+cb.accrual());
	}
}
