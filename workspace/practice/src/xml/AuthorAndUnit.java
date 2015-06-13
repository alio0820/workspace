package xml;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AuthorAndUnit {

	
		int count=0;
		int c=0;
		 static int n=0;
		//当flag=-1时表示列表中的作者项为空，
				//当为0时表示"王国仁 于 戈 吕建华   张 斌 郑怀远" 
				//当为1时表示范晓勃1) 林 闯2) 吴建平1) 徐 恪1   
				//当为2时表示 张晨东 陈火旺 王兵山   *徐 光 
			    //当为3时表示 ① 张焕国② 曹兴芹① 
		private int flag=-1;
		
		public static void main(String []args){
		
			AuthorAndUnit aau=new AuthorAndUnit();
			List<String> athorList;
			List<String> organList;
			List<AuthorUnit> list=new ArrayList<AuthorUnit>();
			list=getAuthorAndUnit();
			int id;
			
			for(int i=0;i<list.size();i++){
				 AuthorUnit au=new AuthorUnit();
				 au=list.get(i);	
				 id=au.getId();
				 String aaua=aau.dealFirst(au.getAuthor());
				 aaua=aau.dealbatrckt(aaua);
				 athorList=aau.dealAnthor(aaua);
				 String aauo=aau.dealFirst(au.getAuthor_unit());
				 aauo=aau.dealbatrckt(aauo);
				 athorList=aau.dealAnthor(aaua);
				 organList=aau.dealOrgan(aauo);
				 System.out.println(id);
				 aau.dealAll(id,athorList,organList);
				 aau.c++;
			}
//			System.out.println(aau.count);
//			System.out.println(aau.c);
//			System.out.println(n);
		}
		
		public String dealbatrckt(String str){
			str=str.replaceAll("）", "\\)");
			str=str.replaceAll("（", "\\(");
			return str;
			
		}
		public String dealFirst(String str){
			char []cha=str.toCharArray();
			for(int i=0;i<cha.length;i++){
				if(cha[i]>=65281&&cha[i] <65373){
					cha[i]=(char)(cha[i]-65248);
				}
			}
			return String.valueOf(cha);
		}
		public static List<AuthorUnit> getAuthorAndUnit(){
			Connection connection=null;
			PreparedStatement pstmt=null;
			List<AuthorUnit> list=new ArrayList<AuthorUnit>();
		    	try{
					 Class.forName("com.mysql.jdbc.Driver");
					 connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/authortounit?useUnicode=true&characterEncoding=utf-8","root","xingye");					 
					 String sql="select id,author,author_unit from authorunit";
					 pstmt=connection.prepareStatement(sql); 
					 ResultSet rs=pstmt.executeQuery();	 
					
					 while(rs.next()){
						 
						 AuthorUnit au=new AuthorUnit();
						 au.setId(rs.getInt("id"));
						 au.setAuthor(rs.getString("author"));
						 au.setAuthor_unit(rs.getString("author_unit"));
						 list.add(au);
						 n++;
					 }		
				} 
		    catch (SQLException e1) {
				e1.printStackTrace();
			} catch (ClassNotFoundException e2) {
				
				e2.printStackTrace();
			} 
			finally {
				
					
						try {
							
							 connection.close();
							 pstmt.close(); 
						} catch (SQLException e) {
							e.printStackTrace();
						}
					 
				}
				return list; 
		}
		
		
		public void insertAuthorAndUnit(String author,String unit,int id){
			
			  //将分离好的作者和作者单位插入数据库
			 
			Connection connection=null;
			PreparedStatement pstmt=null;
			System.out.println(id);
		    	try{
					 Class.forName("com.mysql.jdbc.Driver");
					 connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/xuebao?useUnicode=true&characterEncoding=utf-8","root","sunling");				
					 String sql="insert into authortounit (author,author_unit,id) values(?,?,?)";
					 pstmt=connection.prepareStatement(sql);
					 System.out.println(author+"   "+unit+"  "+id);
					 pstmt.setString(1,author);
					 pstmt.setString(2, unit);
					 pstmt.setInt(3,id);
					 pstmt.executeUpdate();						
		    	}
		    catch (SQLException e1) {
				e1.printStackTrace();
			} catch(ClassNotFoundException e2) {
				
				e2.printStackTrace();
			} 
			finally {
				
					
						try {
							
							 connection.close();
							 pstmt.close(); 
						} catch (SQLException e) {
							e.printStackTrace();
						}
					 
				}
	 
		}
		
		
		public List dealAnthor(String anthor){
			//朱朝晖1),2) 毛宇光1) 朱梧JIA 2),1)
			//1)(南京航空航天大学计算机科学研究所 南京 210016) 2)(南京大学计算机软件国家重点实验室 南京 210093)
			System.out.println(anthor);
			List<String> anthorList=new ArrayList<String>();
			String []str;
			//去掉字符串的前端和末端空格
			anthor=anthor.trim();
			//有序号的情况下进行的处理环节
			if(anthor.length()!=0){
			if(anthor.contains("1")){
				flag=1;
				//将字符串分成字符串数组
				str=anthor.split("\\)");
				for(int i=0;i<str.length;i++){
					//朱朝晖     1  2 这种情况下进行处理 
					if(i+1<str.length&&(str[i+1]=(str[i+1].trim())).length()==2){
						//anthorList.add(str[i]+str[i+1]);
					//	i++;
						String temp="";
						while(i+1<str.length && (str[i+1]=(str[i+1].trim())).length()<=2 ){
							temp+=str[i];
							i++;
						}
						temp+=str[i];
						anthorList.add(temp);
					}
					else{
						///朱朝晖     1这种情况下进行处理
						anthorList.add(str[i]);
					}
				}
			}
			
			//有*号的情况下进行处理的环节 张晨东  陈火旺  王兵山  *徐 光 杨 莉 
			else if(anthor.contains("*")){
				flag=2;
				anthor=anthor.replaceAll(" ", ")");
				str=anthor.split("\\)");
				for(int i=0;i<str.length;i++){
					if(str[i].trim().length()!=0){
					//  *徐        光 这种情况下进行处理
						if(str[i].contains("*")&&str[i].length()-str[i].lastIndexOf("*")==2){
							anthorList.add(str[i]+str[i+1]);
							i++;
						}
					//  杨       莉  这种情况下进行处理
						else if(str[i].length()==1){
							anthorList.add(str[i]+str[i+1]);
							i++;
						}
						else{
							anthorList.add(str[i]);
						}
					}
				}
			}
		
			
			else if(anthor.contains("①")){
				flag=3;
				anthor=anthor.replaceAll(" ", ")");
				//覃中平① 张焕国② 曹兴芹①		
				//将字符串分成字符串数组
				str=anthor.split("\\)");
				for(int i=0;i<str.length;i++){
					
					if(i+1<str.length&&str[i+1].length()==2){
						
						anthorList.add(str[i]+str[i+1]);
						i++;
					}
					else{
						
						anthorList.add(str[i]);
					}
				}
			
			}
			
			//上者三者都没有的情况下调用的处理环节、
			/*
			 * 张晨东  陈火旺  王兵山 杨莉 
			 *  用split函数进行划分
			 * */
			else {
				flag=0;
				str=anthor.split("\\s+");
				for(int i=0;i<str.length;i++){
					if(str[i].trim().length()!=0){
					//  杨       莉  这种情况下进行处理
						if(str[i].length()==1){
							anthorList.add(str[i]+str[i+1]);
							i+=1;
						}
						else{
							anthorList.add(str[i]);
						}
					}
				}
			
			}
			
			
			
			}
			else flag=-1;
			return anthorList;
		}
		

		public List dealOrgan(String organ){
			List<String> organList=new ArrayList<String>();
			String []temp=organ.split("\\)");
			for(int i=0;i<temp.length;i++){
				if((temp[i]=temp[i].trim()).length()!=0){
					if(temp[i].length()==1){
						if(temp[i+1].trim().indexOf("(", 1)!=-1){
							temp[i+1]=temp[i+1].trim()+")"+temp[i+2];
							temp[i+1]=temp[i+1].substring(1);
							organList.add(temp[i]+temp[i+1]);
							i++;
						}else{
							temp[i+1]=temp[i+1].substring(1);
							organList.add(temp[i]+temp[i+1]);
						}//--------------------------
						i++;
					}
					else{
						if(i+1<temp.length && temp[i].trim().indexOf("(",1)!=-1){
							organList.add((temp[i].trim()+")"+temp[i+1]).substring(1));
							i++;
						}else
							organList.add(temp[i].trim().substring(1));
					}
				}
			}
			return organList;
		}

		public void dealAll(int id,List<String> aList,List<String> oList){
			if(flag==0){
				for(int i=0;i<aList.size();i++)
					for(int j=0;j<oList.size();j++){
						//aList.set(i, aList.get(i).toString().replaceAll("[(),，0-9]",""));
						//oList.set(j, oList.get(j).toString().replaceAll("[(),，0-9]",""));
						//System.out.println(aList.get(i)+"      "+((String)oList.get(j)).substring(1));
						System.out.println(id);
						insertAuthorAndUnit(aList.get(i),(oList.get(j)).substring(1),id);
						count+=1;
					}
			}
			else if(flag==1){
				int place=0;
				for(int i=0;i<aList.size();i++){
				
					String temp=aList.get(i);
					while(place<temp.length()){
						if((place=temp.indexOf(",",place+1))==-1)
							place=temp.length();
						String flagString=temp.substring(place-1, place);
						for(int j=0;j<oList.size();j++){
							if(((oList.get(j))).substring(0, 1).equals(flagString))
							{
								//aList.set(i, aList.get(i).toString().replaceAll("[(),，0-9]",""));
							//String a= oList.get(j).toString().replaceAll("[(),，0-9]","");	
							
								//System.out.println((String)aList.get(i).replaceAll("[(),，0-9]","")+"      "+oList.get(j).substring(1));
								insertAuthorAndUnit(aList.get(i).replaceAll("[(),，0-9]",""),oList.get(j).substring(1),id);
								count+=1;
							}
							
						}
						
					}
					place=0;
				}
			}
			else if(flag==2){
				boolean bool=false;
				for(int i=0;i<aList.size();i++){
					String temp=aList.get(i);
					if(temp.contains("*"))bool=true;
					for(int j=0;j<oList.size();j++){
						if(bool==true){
							if(((oList.get(j))).contains("*")==true)
								System.out.println(aList.get(i).substring(1)+"      "+oList.get(j).substring(2));
						}
						else{
							if(((oList.get(j))).contains("*")==false){
								//aList.set(i, aList.get(i).toString().replaceAll("[(),，*]",""));
								//oList.set(j, oList.get(j).toString().replaceAll("[(),，*]",""));
							
								//System.out.println(aList.get(i)+"      "+oList.get(j).substring(1));
								insertAuthorAndUnit(aList.get(i),oList.get(j).substring(1),id);
								count+=1;
							}
						}
					}
					bool=false;
				}
			}
			else if(flag==3){
				int place=0;
				for(int i=0;i<aList.size();i++){
					String temp=aList.get(i);
					while(place<temp.length()){
						if((place=temp.indexOf(",",place+1))==-1)
							place=temp.length();
						String flagString=temp.substring(place-1, place);
						for(int j=0;j<oList.size();j++){
							if(((oList.get(j))).substring(0, 1).equals(flagString)){
							//aList.set(i, aList.get(i).toString().replaceAll("[(),，①②③④⑤⑥⑦⑧⑨⑩]",""));
							//oList.set(j, oList.get(j).toString().replaceAll("[(),，①②③④⑤⑥⑦⑧⑨⑩]",""));
							//System.out.println((String)aList.get(i)+"      "+oList.get(j));
								insertAuthorAndUnit(aList.get(i),oList.get(j),id);
							count+=1;
							}
						}
					}
					place=0;
				}
			}
			else{
				
			}
		}
	}

