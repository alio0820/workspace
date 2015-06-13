
public class wangwu extends AbstractPerson {

	private String name;
	
	public wangwu(String name) {		
		super();
		this.name = name;
		
	}

	@Override
	public void next(int i) {
		if(person!=null&&i>0){
			System.out.println(name+"得到的花");
			person.next(--i);
		}else{
			System.out.println(name+"脱衣");
		}
		
	}

}
