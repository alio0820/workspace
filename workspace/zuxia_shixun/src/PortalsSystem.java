import java.util.*;
class User{
	private String id="";
	private String pwd="";
	public void setId(String id){
		this.id= id;
	}
	public String getId(){
		return id;
	}
	public void setPwd(String pwd){
		this.pwd = pwd;
	}
	public String getPwd(){
		return this.pwd;
	}
	public boolean equals(Object obj){
		boolean bl=false;
		User user = (User)obj;
		if(this.getId().equals(user.getId())&&this.getPwd().equals(user.getPwd()))
			return true;
		return bl;
	}
}
public class PortalsSystem extends User{
	private ArrayList<User> user = new ArrayList<User>();
	private static User u = new User();
	public void createUser(){
		User user0 = new User();
		User user1 = new User();
		user0.setId("zcd");
		user0.setPwd("123");
		user1.setId("zz");
		user1.setPwd("123");
		user.add(user1);
		user.add(user0);
	}
	public int input(){			//����ѡ����Ҫ�Ĳ���
		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		return a;
	}
	public void inputString(){//���������û���������
		Scanner sc = new Scanner(System.in);
		System.out.print("�û���:");
		String id = sc.nextLine();
		System.out.println();
		System.out.print("����:");
		String pwd = sc.nextLine();
		u.setId(id);
		u.setPwd(pwd);
		System.out.println();
		
	}
	public void start(){
		System.out.println("��ӭ���������Ż�ϵͳ*******");
		System.out.println("��ѡ����Ҫ���еĲ�����1.��½ 2.ע��");
	}
	public boolean login(){
		boolean bl=false;
		for(int i=0;i<user.size();i++){
			if(u.equals(user.get(i))){
				bl=true;
				break;
			}
		}
		return bl;
	}
	/*
	 * ����false��ʾ�û��Ѵ��ڣ�����ע�᣻����true��ʾ�û������ڣ�ע��ɹ���
	 */
	public boolean register(){
		boolean bl=true;
		for(int i=0;i<user.size();i++){
			if(u.getId().equals(user.get(i).getId()))
				bl=false;
		}
		if(!bl){
			System.out.println("�û��Ѵ��ڣ�������û���");
		}
		else{
			user.add(u);
			System.out.println("��ϲ��ע��ɹ�");		
		}
		return bl;
	}
	public void error(){
		System.out.println("����������Ч�����������룡");
	}
	public static void main(String[] args){
		PortalsSystem ps  = new PortalsSystem();
		ps.start();
		ps.createUser();
		boolean choice = true;
		out:while(choice){						//ѡ�����
			int choice1 = ps.input();
			inter:while(choice1==1){			//��½
				System.out.println("���������ڵ�½********");
				ps.inputString();
				if(ps.login()){			//��½�ɹ�
					System.out.println("��½�ɹ�����ӭ����"+u.getId());
					System.out.println("��ѡ����Ҫ�Ĳ�����1.ѡ��ע�᣿ 2.�˳�? 3.���µ�½?");
				}
				else{							//��½ʧ��
					System.out.println("��½ʧ�ܣ�1.ѡ��ע�᣿ 2.�˳�? 3.���µ�½?");
				}
					boolean cho2= true;
					inter2:while(cho2){						//ѡ�����
						int choice2 = ps.input();
						if(choice2==1){					//ע��
							System.out.println("����������ע��********");
							ps.inputString();	
							ps.register();
							System.out.println("��ѡ����Ҫ�Ĳ�����1.����ע�᣿ 2.�˳�? 3.���µ�½?");
							continue inter2;
						}
						else if(choice2==2){			//�˳�
							break out;
						}
						else if(choice2==3){			//���µ�½
							continue inter;
						}
						else{							//����������������
							ps.error();
						}
					}							
			}
			outss:while(choice1==2){						//ע��
				System.out.println("����������ע��********");
				ps.inputString();
				ps.register();
				System.out.println("��ѡ����Ҫ�Ĳ�����1.ѡ��ע�᣿ 2.�˳�? 3.���µ�½?");
					boolean cho2= true;
					inter2:while(cho2){						//ѡ�����
						int choice2 = ps.input();
						if(choice2==1){					//ע��
							continue outss;
						}
						else if(choice2==2){			//�˳�
							break out;
						}
						else if(choice2==3){			//���µ�½
							System.out.println("���������ڵ�½********");
							ps.inputString();
							if(ps.login()){			//��½�ɹ�
								System.out.println("��½�ɹ�����ӭ����"+u.getId());
								System.out.println("��ѡ����Ҫ�Ĳ�����1.ѡ��ע�᣿ 2.�˳�? 3.���µ�½?");
							}
							else{							//��½ʧ��
								System.out.println("��½ʧ�ܣ�1.ѡ��ע�᣿ 2.�˳�? 3.���µ�½?");
							}
							continue inter2;
						}
						else{							//����������������
							ps.error();
						}
					}
			}
			if((choice1!=1)&&(choice1!=2)){										//����������������
				ps.error();
			}
		}
		System.out.println("�����˳�ϵͳ��");
	}
}