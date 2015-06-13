package hadoop.mysql.table;
import  java.util.Random;
public class NormalRandom {
	
	
	public static double getNormalRandom(double  expect,double variance )
	{
		//Expect时期望，Variance时方差
		double  res;
   	 Random randomX = new Random();
	 Random randomY = new Random();
	 
	 double modulus=1/(Math.sqrt(2*Math.PI)*variance);  //系数
	 
	 double  x=expect+2*variance*(2*randomX.nextDouble()-1);
	 double index=-0.5*(x-expect)*(x-expect)/variance/variance;		//指数
	 double  y=randomY.nextDouble()*modulus;
	res=modulus*Math.pow(Math.E,index );
	  
	 if(res<y &&x>=0) return x;
	 else  return getNormalRandom(expect,variance);

	}
	
	public static void  main(String[] args)
	{
		int i;
		for(i=0;i<100;i++)
			System.out.println(NormalRandom.getNormalRandom(100,5));
		
	}
	

}
