package com.citrus.info.service.impl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

import com.citrus.info.service.treeInfoService;
import com.citrus.info.util.Conn;

public class treeInfoServiceImpl implements treeInfoService {
	public String info(String location,String tree){
    	Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;
        String retu = null ;
        int i=0;
        File fl = new File("d:\\num.txt");
	    try{
		 if(!fl.exists())
		 {
			 fl.createNewFile();
			 FileWriter fw = new FileWriter("d:\\num.txt");
             fw.write("0");
             fw.close();
		 }
		 FileReader fr = new FileReader("d:\\num.txt");//Ҳ������frֱ�Ӷ���fr.read();
		 BufferedReader br =new BufferedReader(fr);
		// FileInputStream fis = new FileInputStream("c:\\num.txt");
		 i =Integer.parseInt(br.readLine());
		 br.close();//�ر�BufferedReader���� 
		 fr.close();//�ر��ļ�
	    }catch(Exception e){
	    	e.printStackTrace();
	    }
		try
		{ 
			pstmt = connection.prepareStatement("SELECT soilhumi.TimeStam,Humi3,soilprop FROM soilhumi,citrtree where soilhumi.ID=citrtree.ID and soilhumi.ID='" +location+"'&& Humi3>=? order by TimeStam asc limit "+i+",30");
			pstmt.setDouble(1,0 );
			//pstmt.setString(2, "12");
		    ResultSet rs = pstmt.executeQuery();
		    int m=0;
			while(rs.next()){
					m++;
					Date date = new Date(rs.getInt("soilhumi.TimeStam"));
					int ddd= (i+m)%60;
					System.out.println(ddd);
				    String db =ddd+";"+rs.getDouble("Humi3")+";"+rs.getString("soilprop");
				    //System.out.println(db);
				    retu =retu+";"+db;//+";"+rs.getString("password")+";"+rs.getString("password");						    
			}
			i++;
			try {
				if(retu==null||m<30) i=0;
			    String str = i+"";
//			    System.out.println("��д�����Ϊ��"+str);
//			    FileOutputStream fos = new FileOutputStream("c:\\num.txt");
				FileWriter fw = new FileWriter("d:\\num.txt");
                fw.write(str);
                fw.close();              //�ļ����������һ��try catch 
                
                
			}catch(Exception e){
				e.printStackTrace();
			}
		try {
			pstmt.close();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
		return retu;
	} catch (SQLException e) {
		e.printStackTrace();
	} finally {
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
		return null;
    }
	public String  getDecide(Long timeStamp,String SoilProperties,double d) throws ClassNotFoundException, SQLException
	{
		//timeStamp ��ǰʱ���    SoilProperties ����    d��ǰ������ˮ�ֺ�����������ʪ���й� 
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;			

//		    System.out.println("Succeeded connecting to the Database!");
		    pstmt = connection.prepareStatement("select IrriSugg.expeSugg from IrriSugg,soilProp where  soilProp.seas=? and soilProp.expeSugg=irriSugg.expeSuggNumb and soilProp.soilProp=? and soilProp.minCont<=?  and soilProp.maxCont>=?  ");

			String res="";
			pstmt.setString(1, getSeason(timeStamp));
			pstmt.setString(2, SoilProperties);
			pstmt.setDouble(3, d);
			pstmt.setDouble(4, d);
		
			ResultSet  rs=pstmt.executeQuery();
			if(rs.next())
			{
				res="ר�ҽ��飺"+rs.getString("expeSugg");
			    rs.close();
			}
			else
			{
				pstmt.setString(1, "����");
			    pstmt.setString(2, SoilProperties);
			    pstmt.setDouble(3, d);
			    pstmt.setDouble(4, d);			    
			    ResultSet  rs1=pstmt.executeQuery();
			    if(rs1.next())   //�����в�ѯ������ǰ������һλ������
			    res="ר�ҽ��飺"+rs1.getString("expeSugg");
			    else
			    	res="there is not advice!";
			    rs1.close();			    
			}			
			return  res;
	}
	public String getSeason(Long timeStamp){   //����ʱ������ؼ���
		  Date date =(Date) new java.sql.Date( timeStamp);
		  int month =date.getMonth()+1;
		  month =month/3;
		  String season ="";
		  if(month==1||month==4)
			  season ="����";
		  else if(month==2)
			  season ="�ļ�";
		  else if(month==3)
			  season ="�＾";
		  else
			  season ="����";
		  return season;
	  }

}
