package swu.edu.cn.examsystem;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import swu.edu.cn.sql.*;
/*
 * author:handonghai
 * date:2012-3-28
 * ����ͳ����ݱ���е���ݣ��õ���Ӧ��ͳ�����
 */

public class Statistics {
	//��ȷ��,��һ����*��ͷ����ݿ����û���ѡ����#��ͷ��������ͬ�ӷ�
//										  #CCDCCCFCACCDCCBDACDDBBDDAAABBCB0CABBCBCB
	public String correctSingleAnswer="*"+"CCDCCCFCACCBCCBDACDDBADDAAABBCBCCABBCBCB";
//										   #;ABCDEF;ABCD;BE;AD;ABCDEFGHI;ABCD;ABD;ACD;AD;ABC;BC;ABCD;ABDE;ABD;ABC;ABCDE;ABC;ABD;BC;ACE
	public String[] correctMultipleAnswer="*;ABCDEF;ABCD;BE;AD;ABCDEFGI;ABCD;ABD;ACD;AD;ABC;BC;ABCD;ABDE;ABD;ABC;ABCDE;ABC;ABD;BC;ACE".split(";");
	public String correctJudgeAnswer="*TFTTTTTTTTTTFFFFFFFT";
	
	public int[] number;						//�μӴ�����������ֲ�
	
		
	public Statistics(){				
		number=new int[6];	
		
	}
	
	/******************************************************************
	 * �ж��ַ�src���ַ�tar��Ӧ�м�����ͬ,�������еĴ�Сд
	 */
	public int judge(String src,String tar){
		int res=0;
		int len=src.length()<tar.length()?src.length():tar.length();
		
		for(int i=0;i<len;i++){
			String srcStr=String.valueOf(src.charAt(i));
			String tarStr=String.valueOf(tar.charAt(i));
			if(srcStr.equalsIgnoreCase(tarStr))
				res++;
		}
		return res;
	}
	
	/****************************************************************
	 * userSingleChoiceAnswer 		�û��ĵ�ѡ��
	 * userMultipleChoiceAnswer		�û��Ķ�ѡ��
	 * userJudgeChoiceAnswer		�û����ж����
	 * ͨ������ȷ�𰸱ȶԣ�����һ���û����ܵ÷�
	 */
	public  int getScore(String userSingleChoiceAnswer,String userMultipleChoiceAnswer,String userJudgeChoiceAnswer){	
		int res=0;
		String answer[]=userMultipleChoiceAnswer.split(";");  			//�õ��û�����ѡ���������
		int len=answer.length<correctMultipleAnswer.length?answer.length:correctMultipleAnswer.length;
		System.out.println(len);
		System.out.println(answer.length);
		System.out.println(correctMultipleAnswer.length);
		for(int i=1;i<len;i++){
			
			if(answer[i].equalsIgnoreCase(correctMultipleAnswer[i]))
				res++;
			//System.out.println(i);
		}
		res=2*res+judge(userSingleChoiceAnswer, correctSingleAnswer)+judge(correctJudgeAnswer, userJudgeChoiceAnswer);
		return res;		
		
	}
	
	/********************************************************************************
	 * ͳ���û��ֵܷķֲ������������һ��һά������number[];
	 */
	public	void getTotalResult(){	
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		ResultSet res=DBConn.SelectDB("select username,score from userinfo where flag='false'");
		try {
			while(res.next()){
					//System.out.println(res.getString(1)+"\t\t"+res.getInt(2));
				int sco=res.getInt(2);
				number[0]++;					//�ܵĲο��������������ȷ���а���
				if(sco>=90)						
					number[1]++;				//90�����ϵ�����
				else if(sco>=80&&sco<90)		
					number[2]++;				//80~90
				else if(sco>=70&&sco<80)	
					number[3]++;				//70~80
				else if(sco>=60&&sco<70)
					number[4]++;				//60~70
				else
					number[5]++;				//�����������
					
			}
		DBConn.CloseDB();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	public	void showTotalResult(){
			System.out.println("�ο�������Ϊ"+number[0]+"��");
		for(int i=1;i<6;i++)
			System.out.println((100-10*i)+"~"+(110-10*i)+"�������"+number[i]+"��\t\t");
	}
	
	/*****************************************************************
	 *  ͳ��ÿ����Ŀ��ѡ��ֲ������ŵ���ݱ�tongji
	 *  ��ݱ�id��ʾ��id����Ŀ������֮ǰ���Ȱ���ݱ���0
	 */
	public void getResult(){      
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		
		String sql="update tongji set a=0,b=0,c=0,d=0,e=0,f=0,g=0,h=0,i=0";
		//System.out.println(sql);
		Statement st=null;
		try {
			st=DBConn.conn.createStatement();				//�����ݱ?��0��ʼ��д��ݱ�tongji
			st.executeUpdate(sql);			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		ResultSet res=DBConn.SelectDB("select SingleChoice,MultipleChoice from userinfo where flag='false'");
		try {
			while(res.next()){
				String userSingleChoiceAnswer=res.getString(1);						//�õ�һ���û��ĵ�ѡ������Ϣ����ȷ�Ĵ���ϢΪcorrectSingleAnswer
				
				String[] userMultipleChoiceAnswer=res.getString(2).split(";");		 //���û��Ķ���ѡ�����Ϣ
					
				System.out.println(res.getString(1)+"\t"+res.getString(2));
				System.out.println(res.getString(1).length());
//				System.out.println(correctSingleAnswer.length());
				for(int i=1;i<correctSingleAnswer.length();i++){   						 //�жϵ�ѡ
					
					String c=String.valueOf(userSingleChoiceAnswer.charAt(i));         //��i����ѡ�����ȷ��			
					System.out.println("��"+i+"����Ŀ�Ĵ���"+c);
					//System.out.print(c);
					DBConn.addCount(i, c, 1); 				//�����tongji��������Ϊi������Ϊc��ֵ����1
				}
				
				for(int i=1;i<userMultipleChoiceAnswer.length;i++){		//��ѡ�ж�
					String answer=userMultipleChoiceAnswer[i];			//��i����ȷ�����ȷ��
					int len=answer.length();						//0�к�����Ч���ַ�
					for(int j=1;j<=len;j++){
						String c=answer.substring(j-1, j);
						DBConn.addCount(i+40, c, 1);
					}					
				}
				
			}
		}		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		DBConn.CloseDB();
	}
	
	
	//�û�ÿ���ύ���ʱ���ã�����tongji��
	public void  newOne(String userSingleChoiceAnswer,String userMultipleChoiceAnswer){	
//		correctSingleAnswer
//		correctMultipleAnswer
		String[] userMultipleAnswer=userMultipleChoiceAnswer.split(";");
		DBConnection DBConn=new DBConnection();
		DBConn.OpenDB();
		for(int i=1;i<correctSingleAnswer.length();i++){   						 //�жϵ�ѡ
			
			String c=String.valueOf(userSingleChoiceAnswer.charAt(i));         //��i����ѡ�����ȷ��			
			//System.out.println("��"+i+"����Ŀ�Ĵ���"+c);
			//System.out.print(c);	
			DBConn.addCount(i, c, 1); 									//�����tongji��������Ϊi������Ϊc��ֵ����1
		}
		
		for(int i=1;i<userMultipleAnswer.length;i++){				//��ѡ�ж�
			String answer=userMultipleAnswer[i];					//��i����ȷ�����ȷ��
			int len=answer.length();								//0�к�����Ч���ַ�
			for(int j=1;j<=len;j++){
				String c=answer.substring(j-1, j);
				DBConn.addCount(i+40, c, 1);
			}					
		}
			
			
		DBConn.CloseDB();
	}
	
	
	/*****************************************************************
	 * ͳ��ÿ�������ȷ�ʣ����ŵ���ݱ�tongji��rate�ֶ���
	 * ��i�е�rate��ʾ��i����ȷ��
	 */
	public void getCorrectRate(){	
			DBConnection DBConn=new DBConnection();
			DBConn.OpenDB();
			
			ResultSet rs=DBConn.SelectDB("select SingleChoice,MultipleChoice, judgeissues from userinfo where flag='false'");
			int[] corr=new int[81];			//�洢1��70������Եĸ�������corr[i]��ʾ��i�����Եĸ���
			for(int i=0;i<=80;i++) 
					corr[i]=0;
			int sum=0;				//�μӿ����û�����
			try {
				
				while(rs.next()){
					sum++;
					String userSingleChoiceAnswer=rs.getString(1);						//�õ�һ���û��ĵ�ѡ������Ϣ����ȷ�Ĵ���ϢΪcorrectSingleAnswer
					
					String[] userMultipleChoiceAnswer=rs.getString(2).split(";");		 //���û��Ķ���ѡ�����Ϣ����ȷ�Ķ������ϢΪcorrectMultipleAnswer[]	
					
					String userJudgeissuesAnswer=rs.getString(3);	
					for(int i=1;i<=40;i++){				//�жϵ�ѡ���Եĸ���
						String s1=String.valueOf(userSingleChoiceAnswer.charAt(i));
						String s2=String.valueOf(correctSingleAnswer.charAt(i));						
						if(s1.equalsIgnoreCase(s2))
								corr[i]++;
					}
					
					for(int i=1;i<=20;i++){												//�ж϶�ѡ���Եĸ���
						if(userMultipleChoiceAnswer[i].equalsIgnoreCase(correctMultipleAnswer[i]))
							corr[i+40]++;
					}
					
					for(int i=1;i<=20;i++){							//�ж������Եĸ���
						String s1=String.valueOf(userJudgeissuesAnswer.charAt(i));
						String s2=String.valueOf(correctJudgeAnswer.charAt(i));						
						if(s1.equalsIgnoreCase(s2))
								corr[i+60]++;						
					}
					
					for(int i=1;i<=20;i++)
						System.out.print(corr[i+60]+"\t");
					System.out.print("\n");	
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("sum="+sum);
			for(int i=1;i<=80;i++) 
				System.out.println(corr[i]);
				
			
			//����Ѿ����û�ʹ�ã�ͨ��������������ݱ�tongji
			if(sum!=0){
					for(int i=1;i<=80;i++)	
						DBConn.updateOne(i, "rate", corr[i]*1.00/sum);			//������ȷ��
						//System.out.println(corr[i]);
				
			}
						
			DBConn.CloseDB();
	}
	
	
	/*****************************************************************
	 * ����ѡ����Ľ��뺯���ַ�a��oת�����û���ԭʼ����ѡ��
	 */
	public static String getMultipleAnswer(char ans){	
		String res="";
		int ansInt=(int)ans-96;
		if(ansInt>=0 && ansInt<=15){
			if(ansInt>=8){
				ansInt=ansInt-8;
				res="d"+res;
			}
			if(ansInt>=4){
				ansInt=ansInt-4;
				res="c"+res;
			}
			if(ansInt>=2){
				ansInt=ansInt-2;
				res="b"+res;
			}
			if(ansInt>=1){
				ansInt=ansInt-1;
				res="a"+res;
			}					
		}
	
		return res;
	}
	
	
	
	/*
	 * ************************Main**************************************
	 */
//	public static void main(String[] args){
//		Statistics sta=new Statistics();
//		//sta.getTotalResult();
//		//sta.getResult();
//		//sta.getCorrectRate();
////		sta.getTotalResult();
////		sta.showTotalResult();								/
//		sta.newOne("#AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABAAa","*;ABCDEF;ABCD;BE;AD;ABCDEFGI;ABCD;ABD;ACD;AD;ABC;BC;ABCD;ABDE;AB;ABC;ABCDE;ABC;ABD;BC;ACE");
//
//		
//	}
	

}
