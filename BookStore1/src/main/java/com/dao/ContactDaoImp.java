package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.entity.Contact;

public class ContactDaoImp implements ContactDao{
	
	Connection con = null;
	
	public ContactDaoImp(Connection con) {
		// TODO Auto-generated constructor stub
		this.con = con;
	}
	
	@Override
	public boolean insertViews(Contact cont) {
		// TODO Auto-generated method stub
		boolean f = false;
		String sql = "insert into contactus values(?,?,?,?,?)";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, cont.getName());
			ps.setString(2, cont.getEmail());
			ps.setString(3, cont.getPhone());
			ps.setString(4, cont.getSubject());
			ps.setString(5, cont.getMsg());
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return f;
	}
}
