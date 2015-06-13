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
	public int input(){			//用于选择需要的操作
		Scanner sc = new Scanner(System.in);
		int a = sc.nextInt();
		return a;
	}
	public void inputString(){//用于输入用户名和密码
		Scanner sc = new Scanner(System.in);
		System.out.print("用户名:");
		String id = sc.nextLine();
		System.out.println();
		System.out.print("密码:");
		String pwd = sc.nextLine();
		u.setId(id);
		u.setPwd(pwd);
		System.out.println();
		
	}
	public void start(){
		System.out.println("欢迎进入足下门户系统*******");
		System.out.println("请选择你要进行的操作：1.登陆 2.注册");
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
	 * 返回false表示用户已存在，不能注册；返回true表示用户不存在，注册成功；
	 */
	public boolean register(){
		boolean bl=true;
		for(int i=0;i<user.size();i++){
			if(u.getId().equals(user.get(i).getId()))
				bl=false;
		}
		if(!bl){
			System.out.println("用户已存在，请更换用户名");
		}
		else{
			user.add(u);
			System.out.println("恭喜你注册成功");		
		}
		return bl;
	}
	public void error(){
		System.out.println("您的输入无效，请重新输入！");
	}
	public static void main(String[] args){
		PortalsSystem ps  = new PortalsSystem();
		ps.start();
		ps.createUser();
		boolean choice = true;
		out:while(choice){						//选择操作
			int choice1 = ps.input();
			inter:while(choice1==1){			//登陆
				System.out.println("你现在正在登陆********");
				ps.inputString();
				if(ps.login()){			//登陆成功
					System.out.println("登陆成功！欢迎您："+u.getId());
					System.out.println("请选择需要的操作：1.选择注册？ 2.退出? 3.重新登陆?");
				}
				else{							//登陆失败
					System.out.println("登陆失败！1.选择注册？ 2.退出? 3.重新登陆?");
				}
					boolean cho2= true;
					inter2:while(cho2){						//选择操作
						int choice2 = ps.input();
						if(choice2==1){					//注册
							System.out.println("你现在正在注册********");
							ps.inputString();	
							ps.register();
							System.out.println("请选择需要的操作：1.继续注册？ 2.退出? 3.重新登陆?");
							continue inter2;
						}
						else if(choice2==2){			//退出
							break out;
						}
						else if(choice2==3){			//重新登陆
							continue inter;
						}
						else{							//遇到错误，重新输入
							ps.error();
						}
					}							
			}
			outss:while(choice1==2){						//注册
				System.out.println("你现在正在注册********");
				ps.inputString();
				ps.register();
				System.out.println("请选择需要的操作：1.选择注册？ 2.退出? 3.重新登陆?");
					boolean cho2= true;
					inter2:while(cho2){						//选择操作
						int choice2 = ps.input();
						if(choice2==1){					//注册
							continue outss;
						}
						else if(choice2==2){			//退出
							break out;
						}
						else if(choice2==3){			//重新登陆
							System.out.println("你现在正在登陆********");
							ps.inputString();
							if(ps.login()){			//登陆成功
								System.out.println("登陆成功！欢迎您："+u.getId());
								System.out.println("请选择需要的操作：1.选择注册？ 2.退出? 3.重新登陆?");
							}
							else{							//登陆失败
								System.out.println("登陆失败！1.选择注册？ 2.退出? 3.重新登陆?");
							}
							continue inter2;
						}
						else{							//遇到错误，重新输入
							ps.error();
						}
					}
			}
			if((choice1!=1)&&(choice1!=2)){										//遇到错误，重新输入
				ps.error();
			}
		}
		System.out.println("你已退出系统！");
	}
}