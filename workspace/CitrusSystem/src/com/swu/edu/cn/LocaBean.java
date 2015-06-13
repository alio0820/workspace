package com.swu.edu.cn;
//地理位置表Loca对应的javaBean
//一次性采集
public class LocaBean {
		private double  High;  //海拔
		private double  Dime; //维度
		private double  Litu; //经度
    	private String  ID;//地域表示
		public double getHigh() {
			return High;
		}
		public void setHigh(double high) {
			High = high;
		}
		public double getDime() {
			return Dime;
		}
		public void setDime(double dime) {
			Dime = dime;
		}
		public double getLitu() {
			return Litu;
		}
		public void setLitu(double litu) {
			Litu = litu;
		}
		public String getID() {
			return ID;
		}
		public void setID(String iD) {
			ID = iD;
		}
		

}
