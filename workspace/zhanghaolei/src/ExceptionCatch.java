
public class ExceptionCatch {
	public static void main(String args[])
	{
		int it[]={1,3,4};
		try{
			

		     for(int i=0;i<=3;i++)
		     {
		     System.out.println(it[i]);	
		     }
		    }catch(ArrayIndexOutOfBoundsException e)
		    {
		       System.out.println("oh my god! is wrong");
		    }
//		    finally{
//		   	 // 在 try 结束前要执行的代码块
//		      cleanup();
//		   }

    }
}
