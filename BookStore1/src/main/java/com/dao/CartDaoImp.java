package com.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookDet;
import com.entity.Cart;

public class CartDaoImp implements CartDao{

	private Connection con = null;
	
	public CartDaoImp(Connection con) {
		this.con = con;
	}
	
	@Override
	public boolean addCart(Cart c) {
		// TODO Auto-generated method stub
		boolean f = false;
		try {
			String sql = "insert into cart(bid,uid,bookname, author,price, total) values(?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, c.getBid());
			ps.setInt(2, c.getUid());
			ps.setString(3, c.getBookname());
			ps.setString(4, c.getAuthor());
			
			ps.setDouble(5, c.getPrice());
			ps.setDouble(6, c.getTotal());
			
			int i = ps.executeUpdate();
			if(i>0) f = true;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
	@Override
	public List<Cart> getBookbyUser(int userid) {
		// TODO Auto-generated method stub
		Cart c = null;
		List<Cart> list = new ArrayList<Cart>();
		double total = 0;
		try {
			String sql = "Select * from cart where uid = ?";
			
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, userid);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				c = new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUid(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				list.add(c);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	@Override
	public boolean removeBook(int cid) {
		// TODO Auto-generated method stub
		boolean f = false;
		String sql = "delete from cart where cid = ?";
		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, cid);
			int i = ps.executeUpdate();
			if (i>0) {
				f = true;
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}
}
