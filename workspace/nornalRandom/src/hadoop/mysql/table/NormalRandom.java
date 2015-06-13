package hadoop.mysql.table;
import  java.util.Random;
public class NormalRandom {
	
	
	public static double getNormalRandom(double  expect,double variance )
	{
		//Expectʱ������Varianceʱ����
		double  res;
   	 Random randomX = new Random();
	 Random randomY = new Random();
	 
	 double modulus=1/(Math.sqrt(2*Math.PI)*variance);  //ϵ��
	 
	 double  x=expect+2*variance*(2*randomX.nextDouble()-1);
	 double index=-0.5*(x-expect)*(x-expect)/variance/variance;		//ָ��
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
