package random;

import java.util.*;

class Randone {
	public static void main (String[] argv) {
	int a=100,b=5;
	Random r = new Random();
	
		for (int i = 1;i <= 1000000;i++) {
			double ans = r.nextGaussian()*Math.sqrt(b)+a;
			System.out.println("ant = " + ans);
		}
	}
} 
