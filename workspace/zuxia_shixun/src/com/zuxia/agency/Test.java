package com.zuxia.agency;
public class Test {
	public static void main(String[] args){
		MrMiaom xiaom = new MrMiaom();
		Mrzhang zhang = new Mrzhang();
		zhang.setMan(xiaom);
		zhang.showLove();
	}
}
