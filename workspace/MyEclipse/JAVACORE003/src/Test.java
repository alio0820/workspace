
public class Test {
	
	public void doTest(Person1 p){
		System.out.println("11111");
		System.out.println(p.getInfo());
	}
	
	public void doTest(Student p){
		System.out.println("22222");
		p.callChild();
	}

	
	
	//��Ա���� p1 �Ǵ���ڶ������

	/**
	 * @param args
	 */
	public static void main(String[] args) {
	//���裺
	
	//��ջ���洴��һ�����ö���P
	//ִ�е��ؼ��֡�new����ʱ���ڶ����濪��һ���ڴ�ռ�
	//��Person������ĳ�Ա��������ֵ
	//ִ�й��췽�������й��췽�����涨�������
	//�Ѷѵĵ�ַ���ظ�P
		
		Test test = new Test();
		Student p = new Student("zhouqi");
		

		
		test.doTest(p);
		
		
	
	}

}
