package com.dao;
import java.sql.*;

import com.entity.*;
import com.mysql.cj.exceptions.RSAException;

public class UserDaoImp implements UserDao{

	private Connection con;
	
	public UserDaoImp(Connection con) {
		super();
		this.con = con;
	}


	@Override
	public boolean userRegister(User user) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			String sql = "insert into user(name,email,phone,password) values(?,?,?,?)";
			PreparedStatement ps = con.prepareStatement("insert into user(name,email,phone,password) values(?,?,?,?)");
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhone());
			ps.setString(4, user.getPass());
			
			int i = ps.executeUpdate();
			
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}


	
	
	@Override
	public User login(String email, String pass) {
		// TODO Auto-generated method stub
		User user = new User();
		try {
			
		PreparedStatement ps = con.prepareStatement("Select id, name,password,phone from user where email = ?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		System.out.println(rs +" resultset");
		while(rs.next()){
			
			user.setId(rs.getInt(1));
			user.setName(rs.getString(2));
			user.setPass(rs.getString(3));
			user.setEmail(email);
			user.setPhone(rs.getString(4));
		}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return user;
	}
	
	@Override
	public boolean updatePofile(int uid, String name, String email, String phone) {
		// TODO Auto-generated method stub
		boolean f = false;
		
		try {
			String sql = "update user set name = ?, email = ?, phone = ? where id= ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setInt(4, uid);
			
			int i = ps.executeUpdate();
			
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public boolean checkUser(String email) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "select id from user where email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				if(rs.getInt(1)>0) f = true;
				System.out.println(rs.getInt(1));
				
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	
}
