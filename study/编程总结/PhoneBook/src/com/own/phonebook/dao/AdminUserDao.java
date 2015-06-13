package com.own.phonebook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.own.phonebook.entity.AdminUser;
import com.own.phonebook.other.DB;


public class AdminUserDao extends DB{
	public void add(AdminUser adminUser){
		Connection conn=DB.getConn();
		String sql="insert into _adminuser values(null,?,?)";
		PreparedStatement ps=DB.getPrepareStatement(conn, sql);
		try {
			ps.setString(1, adminUser.getName());
			ps.setString(2, adminUser.getPassword());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
		
	}
	public void delete(AdminUser adminUser){
		deleteById(adminUser.getId());
		
	}
	public void deleteById(int id){
		Connection conn=DB.getConn();
		String sql="delete from _adminuser where id=?";
		PreparedStatement ps=DB.getPrepareStatement(conn, sql);
		try {
			ps.setInt(1, id);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		DB.close(ps);
	}
	
	public void update(AdminUser adminUser){
		Connection conn=DB.getConn();
		String sql="update _adminuser set name=? and password=? where id=?";
		PreparedStatement ps=DB.getPrepareStatement(conn, sql);
		try {
			ps.setString(1, adminUser.getName());
			ps.setString(2, adminUser.getPassword());
			ps.setInt(3, adminUser.getId());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public List<AdminUser> adminUserList(){
		Connection conn=DB.getConn();
		String sql="select * from _adminuser";
		PreparedStatement ps=DB.getPrepareStatement(conn, sql);
		List<AdminUser> adminUserList=new ArrayList<AdminUser>();
		try {
			ResultSet rs=ps.executeQuery();
			AdminUser adminUser=null;
			while(rs.next()){
				adminUser=new AdminUser();
				adminUser.setId(rs.getInt("id"));
				adminUser.setName(rs.getString("name"));
				adminUser.setPassword(rs.getString("password"));
				adminUserList.add(adminUser);
			}
			DB.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		DB.close(ps);
		return adminUserList;
	}
	public AdminUser query(AdminUser adminUser){
		Connection conn=DB.getConn();
		String sql="select * from _adminuser where name=?";
		PreparedStatement ps=DB.getPrepareStatement(conn, sql);		
		AdminUser getUser=new AdminUser();
		try {
			ps.setString(1, adminUser.getName());
			ResultSet rs;
			rs = ps.executeQuery();
	
			if(rs.first()==false)			
				return null;	
			else{
				while(rs.next()){
					getUser.setId(rs.getInt("id"));
					getUser.setName(rs.getString("name"));
					getUser.setPassword(rs.getString("password"));
					}
				}
			
			DB.close(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return getUser;
		}
	
	}

