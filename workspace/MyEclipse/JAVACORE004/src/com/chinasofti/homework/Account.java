package com.chinasofti.homework;

public class Account {
	private int id;
	private int balance;
	private int maxbalance;
	private static int allmoney;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getBalance() {
		return balance;
	}
//	public void setBalance(int balance) {
//		this.balance = balance;
//	}
	public Account(int id,int balance,int maxover){
		this.id=id;
		this.balance=balance;
		this.maxbalance=balance+maxover;
	}
	
	public void deposit(int money){
		if(money>0){
			balance+=money;
			maxbalance+=money;
			allmoney+=money;
			System.out.println(id+"����"+money+"Ԫ�������˻���"+balance+"Ԫ��������ֽ�"+maxbalance+"Ԫ;���ϻ��У�"+allmoney+"Ԫ");
		}
	}
	
	public void getMoney(int money){
		if((maxbalance>=money)&&(allmoney>=money)){
			balance-=money;
			maxbalance-=money;
			allmoney-=money;
			System.out.println(id+"ȡ��"+money+"Ԫ�������˻���"+balance+"Ԫ��������ֽ�"+maxbalance+"Ԫ;���ϻ��У�"+allmoney+"Ԫ");
		}else{
			System.out.println("�Բ�����������������ֽ���");
		}
	}
	public static void main(String[] args) {
		Account a1=new Account(1001,0,5000);
		Account a2=new Account(1002,0,4000);
		a1.deposit(1000);
		a2.getMoney(1000);
		a1.getMoney(1000);
	}
}
