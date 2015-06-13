package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.etc.OurProgram.javabean.ProjectDatum;
import com.etc.OurProgram.javabean.ProjectManegement;
import com.etc.OurProgram.service.ProjectDatumService;
import com.etc.OurProgram.service.ProjectManeServce;
import com.etc.OurProgram.util.Conn;


public class ProjectDatumServiceImpl implements ProjectDatumService{

	public boolean add(ProjectDatum pd) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;


		try{
		 pstmt=connection.prepareStatement("insert into projectdatum(datumName,saveTerm,datumRoute,datumAttribute,datumSetupDate,desciption,auditingAttitude,projectID) values (?,?,?,?,?,?,?,?)");   
		 pstmt.setString(1, pd.getDatumName()); 
		 pstmt.setString(2, pd.getSaveTerm());
		 pstmt.setString(3, pd.getDatumRoute());
		 pstmt.setString(4, pd.getDatumAttribute());
		 pstmt.setDate(5,new java.sql.Date(pd.getDatumSetupDate().getTime()));
		 pstmt.setString(6, pd.getDesciption());
		 pstmt.setString(7, pd.getAuditingAttitude());
		 pstmt.setInt(8, pd.getProjectID());
		    
		int i=pstmt.executeUpdate();	
		if(i!=0){
			/**
			 * 对项目资料数进行加1操作
			 */
			ProjectManeServce pms=new ProjectManeServceImpl();
			ProjectManegement pm =new ProjectManegement();
			ProjectManegement pm2 =new ProjectManegement();
			ProjectManegement pm3 =new ProjectManegement();
			pm.setId( pd.getProjectID());
			
			pm2=pms.queryAboutDatum(pm);
		    int j=	pm2.getDatumNumber()+1 ;
		    pm3.setDatumNumber(j);
		    pm3.setId(pd.getProjectID());
		    pms.updateAboutDatum(pm3);
		
			
			return true;
		}
		else
			return false;
	
		}	
			catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean delete(ProjectDatum pd) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null ;
	
		try {
           
			pstmt = connection.prepareStatement("delete from projectdatum where id='"+pd.getId()+"'");
			int i = pstmt.executeUpdate();
			if(i>0){
				/**
				 * 对项目资料数进行减1操作
				 */
				ProjectManeServce pms=new ProjectManeServceImpl();
				ProjectManegement pm =new ProjectManegement();
				ProjectManegement pm2 =new ProjectManegement();
				ProjectManegement pm3 =new ProjectManegement();
				pm.setId( pd.getProjectID());
				
				pm2=pms.queryAboutDatum(pm);
			    int j=	pm2.getDatumNumber()-1 ;
			    pm3.setDatumNumber(j);
			    pm3.setId(pd.getProjectID());
			    pms.updateAboutDatum(pm3);
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
		
	}

	public List query(ProjectDatum pd,int i,int pageSize){
		Conn du=new Conn();
		Connection connection = du.getConnection(null);
		Statement pstmt = null;
	System.out.println(pd.getProjectID());
	System.out.println("SELECT * FROM projectdatum where projectID='"+pd.getProjectID()+"' order by datumSetupDate desc limit " + i + "," + pageSize);
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM projectdatum where projectID='"+pd.getProjectID()+"' order by datumSetupDate desc limit " + i + "," + pageSize);

			List list =  new ArrayList();
			
			while(rs.next()){
				ProjectDatum pd2=new ProjectDatum();
				pd2.setId(Integer.parseInt(rs.getString("id")));
				pd2.setDatumName(rs.getString("datumName"));
				pd2.setSaveTerm(rs.getString("saveTerm"));
				pd2.setDatumRoute(rs.getString("datumRoute"));
				pd2.setDatumAttribute(rs.getString("datumAttribute"));
				pd2.setDatumSetupDate(rs.getDate("datumSetupDate"));
				pd2.setDesciption(rs.getString("desciption"));
				pd2.setAuditingAttitude(rs.getString("auditingAttitude"));
				pd2.setProjectID(rs.getInt("projectID"));
			    list.add(pd2);
				
			}
			System.out.println(list.size());
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	
	return null;

	}

	public boolean update(ProjectDatum pd) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null ;
		try {
			pstmt = connection.prepareStatement("update  projectdatum set datumName=?,saveTerm=?,datumRoute=?,datumAttribute=?,datumSetupDate=?,desciption=?,auditingAttitude=?,projectID=? where id=?");

			pstmt.setString(1,pd.getDatumName());
			
			pstmt.setString(2,pd.getSaveTerm());
			pstmt.setString(3,pd.getDatumRoute());
			pstmt.setString(4, pd.getDatumAttribute());
			pstmt.setDate(5, new java.sql.Date(pd.getDatumSetupDate().getTime()) );
			pstmt.setString(6, pd.getDesciption());
			pstmt.setString(7, pd.getAuditingAttitude());
			pstmt.setInt(8, pd.getProjectID());
			pstmt.setInt(9, pd.getId());
			
			int i = pstmt.executeUpdate();
			if(i>0){
				return true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return false;
		
		
	}
	
	
	
	public List queryAll(ProjectDatum pd){
		Conn du=new Conn();
		Connection connection = du.getConnection(null);
		Statement pstmt = null;
		 
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM projectdatum where projectID='"+pd.getProjectID()+"' order by datumSetupDate desc");
			List list =  new ArrayList();
			
			while(rs.next()){
				ProjectDatum pd2=new ProjectDatum();
				pd2.setId(Integer.parseInt(rs.getString("id")));
				pd2.setDatumName(rs.getString("datumName"));
				pd2.setSaveTerm(rs.getString("saveTerm"));
				pd2.setDatumRoute(rs.getString("datumRoute"));
				pd2.setDatumAttribute(rs.getString("datumAttribute"));
				pd2.setDatumSetupDate(rs.getDate("datumSetupDate"));
				pd2.setDesciption(rs.getString("desciption"));
				pd2.setAuditingAttitude(rs.getString("auditingAttitude"));
				pd2.setProjectID(rs.getInt("projectID"));
			    list.add(pd2);
				
			}
			return list;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				pstmt.close();
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

	
	return null;

	}

	
	
	
	
	public int count(ProjectDatum pd) {
        int intRowCount=0;
        PreparedStatement pstmt = null ;
        String sql  = null ;
        ResultSet rs = null ;
        Conn dbc= null ;
        dbc = new Conn() ;

        sql = "select count(id) from projectdatum where projectID='"+pd.getProjectID()+"' order by id asc";
        try
        {            
            pstmt = dbc.getConnection(null).prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            intRowCount=rs.getInt(1);
            System.out.println(intRowCount);
        }
        catch(Exception e)
        {
            System.out.println(e) ;
        }
        finally
        {
        	try {
        		 rs.close() ;
                 pstmt.close() ;
				pstmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
        return intRowCount;
    }

	
}
