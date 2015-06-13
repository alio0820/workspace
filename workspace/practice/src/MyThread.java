
public class MyThread implements Runnable
{
int tickets =100;
public void run()
{
	while(true)
	{
		if(tickets>0)
		{
			System.out.println(Thread.currentThread().getName()+"remain tickets:"+tickets);
			tickets--;
		}
	}
}
}
class TicketsSystem
{
	public static void main(String[] args)
	{
		MyThread num= new MyThread();
		new Thread(num).start();
		new Thread(num).start();
		new Thread(num).start();
		new Thread(num).start();
	}
}