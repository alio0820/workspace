
public class Student extends Person1 {
	
	private String schoolName;
	
	
	//������ø���Ĺ��췽������
	//1.����Ĭ�ϵ��ø��಻�������Ĺ��췽����	
	//2.�����ڹ��캯���Ŀ�ʼ�͵��ø���Ĺ��췽����
	public Student(String schoolName){		
		super("zhouqi");
		this.schoolName = schoolName;	

	}
	
	
	//��д������ʵ�ָ������ṩ�ķ���
	//������
	//1����������ͬ 2������ֵ��ͬ 3�������б���ͬ 
	//��4������ķ������η�Ҫ���ڵ��ڸ���ķ������η�
	//5��������쳣ҪС�ڵ��ڸ�����쳣��
	
	
	//���أ���ͬһ��������ͬ�ķ����в�ͬ��ʵ��
	//������
	//1������������ͬ
	//2�������б�ͬ
	//3���ͷ���ֵ�޹�
	//4���ͷ������η��޹�
	//5�����쳣Ҳ�޹�
	
	public  String getInfo(){
		return "��Ա����"+getName()+"ѧУ����"+schoolName;
	}
	
	public void callChild(){
		System.out.println("--------");
		System.out.println(super.getInfo());
		System.out.println(super.toString());
		System.out.println("--------");
	}
	
	public static void main(String[] args) {
		Student stu=new Student
	}

	
	
}
