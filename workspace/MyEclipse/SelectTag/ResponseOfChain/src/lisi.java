
public class lisi extends AbstractPerson {

	private String name;
	
	public lisi(String name) {		
		super();
		this.name = name;
		
	}

	@Override
	public void next(int i) {
		if(person!=null&&i>0){
			System.out.println(name+"�õ��Ļ�");
			person.next(--i);
		}else{
			System.out.println(name+"����");
		}
		
	}

}
