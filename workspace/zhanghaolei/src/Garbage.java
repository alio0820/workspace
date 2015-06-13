
public class Garbage {
	int index;
	static int count;
	Garbage(){
		count++;
		System.out.println("object "+ count + "conctruct");
		setup(count);
	}
	void setup(int id){
		index=id;
	}
	protected void finalize()	{
		System.out.println("object" + index + "take back");	
	}
	public static void main(String[] args) 	{
		new Garbage();
		new Garbage();
		new Garbage();
		System.gc();
	}
}
