package com.zuxia.agency;

public class Mrzhang implements Man {
	private Man man;
	
	public Man getMan() {
		return man;
	}

	public void setMan(Man man) {
		this.man = man;
	}
	@Override
	public void showLove() {
		man.showLove();
	}

}
