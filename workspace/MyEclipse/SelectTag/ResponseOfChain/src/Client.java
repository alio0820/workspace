
public class Client {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		zhangsan p1 = new zhangsan("zhangsan");
		lisi p2 = new lisi("lisi");
		wangwu p3 = new wangwu("wangwu");
		zhaoliu p4 = new zhaoliu("zhaoliu");
		
		p1.setPerson(p2);
		p2.setPerson(p3);
		p3.setPerson(p4);
		p4.setPerson(p1);
		
		p1.next(20);
	}

}
