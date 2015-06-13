package com.etc.OurProgram.service.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import com.etc.OurProgram.javabean.ProjectManegement;
import com.etc.OurProgram.service.ProjectManeServce;
import com.etc.OurProgram.util.Conn;




public class ProjectManeServceImpl implements ProjectManeServce {



	public boolean add(ProjectManegement pm)  {		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null;	    
		try{
		pstmt=connection.prepareStatement("select projectID from project");
		ResultSet rs1=pstmt.executeQuery();
		List list=new ArrayList();
		
		while(rs1.next()){	
			ProjectManegement pms=new ProjectManegement();
			pms.setProjectID(rs1.getString("projectID"));
			list.add(pms);		
		}
		pstmt=connection.prepareStatement("insert into project(projectID,projectName,unit,lineNumber,setupDate,pigeonholeLeader,teammates,stutas,description,pigeonholeType,submitDate,auditingAttitude,assessor,pigeonholeDate,datumNumber) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setString(1, pm.getProjectID());		
		pstmt.setString(2,pm.getProjectName());
		pstmt.setString(3,pm.getUnit());
		pstmt.setString(4, pm.getLineNumber());
		pstmt.setDate(5, new java.sql.Date(pm.getSetupDate().getTime()) );
		pstmt.setString(6, pm.getPigeonholeLeader());
		pstmt.setString(7, pm.getTeammates());
		pstmt.setString(8, pm.getStutas());
		pstmt.setString(9, pm.getDescribe());
		pstmt.setString(10, pm.getPigeonholeType());
		pstmt.setDate(11, new java.sql.Date(pm.getSubmitDate().getTime()));
		pstmt.setString(12, pm.getAuditingAttitude());
		pstmt.setString(13, pm.getAssessor());
		pstmt.setDate(14, new java.sql.Date( pm.getPigeonholeDate().getTime()));
		pstmt.setInt(15, pm.getDatumNumber());

		for(int i=0;i<list.size();i++){			
			ProjectManegement pms2=new ProjectManegement();
			pms2=(ProjectManegement)list.get(i);
			if(pms2.getProjectID()==pm.getProjectID())
				return false;		
		}
		int i=pstmt.executeUpdate();	
		if(i!=0)
			return true;
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

	public boolean delete(ProjectManegement pm) {
		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null ;
	//	ProjectManegement pms=new ProjectManegement();
		try {

			pstmt = connection.prepareStatement("delete from project where id=?");
			pstmt.setInt(1, pm.getId());
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

	

	public boolean update(ProjectManegement pm) {
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		PreparedStatement pstmt = null ;
		PreparedStatement pstmt2 = null ;
		try {
			pstmt=connection.prepareStatement("select projectID from project where projectID = ?");
			pstmt.setString(1, pm.getProjectID());
			ResultSet rs1=pstmt.executeQuery();
			
			ProjectManegement pms = null;
			while(rs1.next()){		
				pms=new ProjectManegement();
				pms.setProjectID(rs1.getString("projectID"));
			}
			if(pms == null){
				
				pstmt = connection.prepareStatement("update  project set projectID=?,projectName=?,unit=?,lineNumber=?,setupDate=?,pigeonholeLeader=?,teammates=?,stutas=?,description=?,pigeonholeType=?,submitDate=?,auditingAttitude=?,assessor=?,pigeonholeDate=?,datumNumber=? where id=?");
				pstmt.setString(1, pm.getProjectID());			
				pstmt.setString(2,pm.getProjectName());			
				pstmt.setString(3,pm.getUnit());
				pstmt.setString(4, pm.getLineNumber());
				pstmt.setDate(5, new java.sql.Date(pm.getSetupDate().getTime()) );
				pstmt.setString(6, pm.getPigeonholeLeader());
				pstmt.setString(7, pm.getTeammates());
				pstmt.setString(8, pm.getStutas());
				pstmt.setString(9, pm.getDescribe());
				pstmt.setString(10, pm.getPigeonholeType());
				pstmt.setDate(11,null);
				pstmt.setString(12, pm.getAuditingAttitude());
				pstmt.setString(13, pm.getAssessor());
				pstmt.setDate(14, null);
				pstmt.setInt(15, pm.getDatumNumber());
				pstmt.setInt(16, pm.getId());
				
			/*	pstmt2 = connection.prepareStatement("select count(*) from project where id<>? and projectID=?");
				pstmt2.setInt(1, pm.getId());
				pstmt2.setString(2, pm.getProjectID());*/
				
				
				/*
				for(int i=0;i<list.size();i++){			
					ProjectManegement pms2=new ProjectManegement();
					pms2=(ProjectManegement) list.get(i);
					if(pms2.getProjectID()== pms.getProjectID())
						System.out.println("fdfdf");
						return false;		
				}
				*/
				int i = pstmt.executeUpdate();
				if(i>0){
					return true;
				}
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

	public List query(int i,int pageSize) {
		
		Conn conn = new Conn();
			Connection connection = conn.getConnection(null);
			Statement pstmt = null;
			try {
				pstmt = connection.createStatement();
				String sql = "select * from project order by projectID asc limit " + i + "," + pageSize;
			    //System.out.println(sql);
				ResultSet rs = pstmt.executeQuery(sql);
				List list = new ArrayList();
				while(rs.next()){
					ProjectManegement pms=new ProjectManegement();
					pms.setId(rs.getInt("id"));
					pms.setProjectID(rs.getString("projectID"));
					pms.setProjectName(rs.getString("projectName"));
					pms.setUnit(rs.getString("unit"));
					pms.setLineNumber(rs.getString("lineNumber"));
					pms.setSetupDate(rs.getDate("setupDate"));
					pms.setPigeonholeLeader(rs.getString("pigeonholeLeader"));
					pms.setTeammates(rs.getString("teammates"));
					pms.setStutas(rs.getString("stutas"));
					pms.setDescribe(rs.getString("description"));
					pms.setPigeonholeType(rs.getString("pigeonholeType"));
					pms.setSubmitDate(rs.getDate("submitDate"));
					pms.setAuditingAttitude(rs.getString("auditingAttitude"));
					pms.setAssessor(rs.getString("assessor"));
					pms.setPigeonholeDate(rs.getDate("pigeonholeDate"));
					pms.setDatumNumber(rs.getInt("datumNumber"));
				
					list.add(pms);
					
				}
				//System.out.println(list.size());
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
   
	public ProjectManegement queryAboutDatum(ProjectManegement pm) {
		
		Conn conn = new Conn();
		Connection connection = conn.getConnection(null);
		Statement pstmt = null;
		try {
			pstmt = connection.createStatement();
			ResultSet rs = pstmt.executeQuery("SELECT * FROM project where id='"+pm.getId()+"'");
			ProjectManegement pms=new ProjectManegement();
			while(rs.next()){
				pms.setDatumNumber(rs.getInt("datumNumber"));		
			}
			return pms;
			
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
	
    public boolean updateAboutDatum(ProjectManegement pm)  {
    	Conn conn = new Conn();
	Connection connection = conn.getConnection(null);
	PreparedStatement pstmt = null ;
	try {

		pstmt = connection.prepareStatement("update  project set datumNumber=? where id=?");
		pstmt.setInt(1, pm.getDatumNumber());
		pstmt.setInt(2, pm.getId());
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
	
  
             
    public int count() {
        int intRowCount=0;
        PreparedStatement pstmt = null ;
        String sql  = null ;
        ResultSet rs = null ;
        Conn dbc= null ;
        dbc = new Conn() ;

        sql = "select count(id) from project order by id asc";
        try
        {            
            pstmt = dbc.getConnection(null).prepareStatement(sql);
            rs = pstmt.executeQuery();
            rs.next();
            intRowCount=rs.getInt(1);
          
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
