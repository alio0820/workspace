
public class Gc {
	private Object o;
	public void doSth(){
		Object o=new Object();
		doSthElse(o);
		o=new Object();
		doSthElse(null);
		o=null;
	}
	public void doSthElse(Object o){
		this.o=o;
	}
}
